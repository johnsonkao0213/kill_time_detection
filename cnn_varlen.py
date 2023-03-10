# +
import os
import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.models as models
import torchvision.transforms as transforms
from torch.optim.lr_scheduler import ReduceLROnPlateau
import torch.utils.data as data
import torchvision
from torch.autograd import Variable
import matplotlib.pyplot as plt
from utils.functions import *
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder, LabelEncoder
from sklearn.metrics import accuracy_score

import pickle
import time

from collections import OrderedDict

# set path
data_path = "./datasets/frames/raw_frame_U"   # define data path 
fold = '1'
h5_train_path = './datasets/trainSet_fold'+fold+'.h5'
h5_val_path = './datasets/valSet_fold'+fold+'.h5'

save_model_path = "./weight/"
# EncoderCNN architecture
CNN_fc_hidden1, CNN_fc_hidden2 = 1024, 768
CNN_embed_dim = 2048   # latent dim extracted by 2D CNN 2048
res_size = 224        # ResNet image size
dropout_p = 0.5      # dropout probability

# DecoderRNN architecture
RNN_hidden_layers = 3
RNN_hidden_nodes = 512
RNN_FC_dim = 256
# mlp_dim = 128 #128

# training parameters
k = 2             # number of target category
epochs = 20        # training epochs
batch_size = 2 #196
num_workers = 1 #8
learning_rate = 0.00001
weight_decay = 0.0001
lr_patience = 30
log_interval = 30   # interval for displaying training info


def check_mkdir(dir_name):
    if not os.path.exists(dir_name):
        os.mkdir(dir_name)

def train(log_interval, model, device, train_loader, optimizer, epoch):
    # set model as training mode
    cnn_encoder, rnn_decoder = model
    cnn_encoder.train()
    rnn_decoder.train()
    print(h5_train_path)
    print(h5_val_path)
    print(params)
    print('learning_rate',learning_rate, 'weight_decay',weight_decay)
    losses, scores, all_y, all_y_pred = [],[], [], []
    
    N_count = 0   # counting total trained sample in one epoch
    for batch_idx, (X, X_lengths, y) in enumerate(train_loader):

        # distribute data to device
        X, X_lengths, y = X.to(device), X_lengths.to(device).view(-1, ), y.to(device).view(-1, )

        N_count += X.size(0)

        optimizer.zero_grad()
        cnn_embed_seq = cnn_encoder(X)
        N, T, n = cnn_embed_seq.size()

        for i in range(N):
            if X_lengths[i] < T:
                cnn_embed_seq[i, X_lengths[i]:, :] = torch.zeros(T - X_lengths[i], n, dtype=torch.float, device=cnn_embed_seq.device)

        output = rnn_decoder(cnn_embed_seq, X_lengths)   # output has dim = (batch, number of classes)

        loss = F.cross_entropy(output, y)  # mini-batch loss
        losses.append(loss.item())
        y_pred = torch.max(output, 1)[1]  # y_pred != output

        # collect all y and y_pred in all mini-batches
        all_y.extend(y)
        all_y_pred.extend(y_pred)

        # to compute accuracy
        step_score = accuracy_score(y.cpu().data.squeeze().numpy(), y_pred.cpu().data.squeeze().numpy())
        scores.append(step_score)


        loss.backward()
        optimizer.step()

        # show information
        if (batch_idx + 1) % log_interval == 0:
            print('Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}, Accu: {:.2f}%'.format(
                epoch + 1, N_count, len(train_loader.dataset), 100. * (batch_idx + 1) / len(train_loader), loss.item(), 100 * step_score))


    # compute accuracy
    all_y = torch.stack(all_y, dim=0)
    all_y_pred = torch.stack(all_y_pred, dim=0)


    return losses, scores

def validation(model, device, optimizer, test_loader):
    # set model as testing mode
    cnn_encoder, rnn_decoder = model
    cnn_encoder.eval()
    rnn_decoder.eval()

    test_loss = 0
    all_y, all_y_pred = [], []
    with torch.no_grad():
        for X, X_lengths, y in test_loader:
            # distribute data to device
            X, X_lengths, y = X.to(device), X_lengths.to(device).view(-1, ), y.to(device).view(-1, )
            cnn_embed_seq = cnn_encoder(X)
            N, T, n = cnn_embed_seq.size()

            for i in range(N):
                if X_lengths[i] < T:
                    cnn_embed_seq[i, X_lengths[i]:, :] = torch.zeros(T - X_lengths[i], n, dtype=torch.float, device=cnn_embed_seq.device)

            output = rnn_decoder(cnn_embed_seq, X_lengths)   # output has dim = (batch, number of classes)


            loss = F.cross_entropy(output, y, reduction='sum')
            test_loss += loss.item()                 # sum up minibatch loss
            y_pred = output.max(1, keepdim=True)[1]  # (y_pred != output) get the index of the max log-probability

            # collect all y and y_pred in all batches
            all_y.extend(y)
            all_y_pred.extend(y_pred)

    test_loss /= len(test_loader.dataset)

    # compute accuracy
    all_y = torch.stack(all_y, dim=0)
    all_y_pred = torch.stack(all_y_pred, dim=0)
    test_score = accuracy_score(all_y.cpu().data.squeeze().numpy(), all_y_pred.cpu().data.squeeze().numpy())
    # show information
    print('\nTest set ({:d} samples): Average loss: {:.4f}, Accuracy: {:.2f}%\n'.format(len(all_y), test_loss, 100* test_score ))

    return test_loss, test_score, 



# Detect devices
use_cuda = torch.cuda.is_available()                   # check if GPU exists
device = torch.device("cuda" if use_cuda else "cpu")   # use CPU or GPU

# Data loading parameters
params = {'batch_size': batch_size, 'shuffle': True, 'num_workers': num_workers, 'pin_memory': True,  'drop_last': True} if use_cuda else {}


transformT = transforms.Compose( [transforms.ToTensor(),
                                  transforms.RandomRotation(15),
                                 ]
                               )

# Create model
cnn_encoder = ResCNNEncoder(fc_hidden1=CNN_fc_hidden1, fc_hidden2=CNN_fc_hidden2, drop_p=dropout_p, CNN_embed_dim=CNN_embed_dim).to(device)
rnn_decoder = DecoderRNN_varlen(CNN_embed_dim=CNN_embed_dim, h_RNN_layers=RNN_hidden_layers, h_RNN=RNN_hidden_nodes,
                         h_FC_dim=RNN_FC_dim, drop_p=dropout_p, num_classes=k).to(device)


# Combine all EncoderCNN + DecoderRNN parameters
print("Using", torch.cuda.device_count(), "GPU!")
if torch.cuda.device_count() > 1:
    # Parallelize model to multiple GPUs
    cnn_encoder = nn.DataParallel(cnn_encoder)
    rnn_decoder = nn.DataParallel(rnn_decoder)
    crnn_params = list(cnn_encoder.module.fc4.parameters()) + list(rnn_decoder.parameters())

elif torch.cuda.device_count() == 1:
    crnn_params = list(cnn_encoder.fc4.parameters()) + list(rnn_decoder.parameters())

optimizer = torch.optim.Adam(crnn_params, lr=learning_rate,weight_decay=weight_decay)
scheduler = ReduceLROnPlateau(optimizer, 'min', patience=lr_patience, min_lr=1e-10, verbose=True)

# record training process
epoch_train_losses = []
epoch_train_scores = []
epoch_test_scores = []
epoch_test_losses = []


# start training
for epoch in range(epochs):
    print(h5_train_path)
    print(time.asctime(time.localtime(time.time())))
    train_set = Dataset_h5_CNN(h5_train_path, epoch, transform=transformT)

    train_loader = data.DataLoader(train_set, **params)
    epoch_train_loss, epoch_train_score = train(log_interval, [cnn_encoder, rnn_decoder], device, train_loader, optimizer, epoch)
    del train_loader, train_set

    epoch_test_loss, epoch_test_score = 0,0
    for i in range(5):
        valid_set = Dataset_h5_CNN(h5_val_path, epoch, transform=transformT,train = False)
        valid_loader = data.DataLoader(valid_set, **params)
        test_loss, test_score = validation([cnn_encoder, rnn_decoder], device, optimizer, valid_loader)

        epoch_test_loss += test_loss
        epoch_test_score += test_score
        del valid_loader, valid_set

    epoch_test_loss, epoch_test_score = epoch_test_loss/5, epoch_test_score/5
    print('\nVaild set: Average loss: {:.4f}, Accuracy: {:.2f}\n'.format(epoch_test_loss, 100* epoch_test_score))
    torch.save(rnn_decoder.state_dict(), os.path.join(save_model_path, 'rnn_decoder_CRNN'+fold+'_epoch{}.pth'.format(epoch + 1)))  # save motion_encoder
    torch.save(cnn_encoder.state_dict(), os.path.join(save_model_path, 'cnn_encoder_CRNN'+fold+'_epoch{}.pth'.format(epoch + 1)))  # save motion_encoder
#     torch.save(optimizer.state_dict(), os.path.join(save_model_path, 'optimizer_CRNN'+fold+'_epoch{}.pth'.format(epoch + 1)))      # save optimizer
    print("Epoch {} model saved!".format(epoch + 1))
    # train, test model
    scheduler.step(epoch_test_loss)

    # save results
    epoch_train_losses.append(epoch_train_loss)
    epoch_train_scores.append(epoch_train_score)

    epoch_test_losses.append(epoch_test_loss)
    epoch_test_scores.append(epoch_test_score)


    # save all train test results
    A = np.array(epoch_train_losses)
    B = np.array(epoch_train_scores)
    C = np.array(epoch_test_losses)
    D = np.array(epoch_test_scores)

    np.save('./weight/CRNN'+fold+'_training_loss.npy', A)
    np.save('./weight/CRNN'+fold+'_training_score.npy', B)
    np.save('./weight/CRNN'+fold+'_test_loss.npy', C)
    np.save('./weight/CRNN'+fold+'_test_score.npy', D)


