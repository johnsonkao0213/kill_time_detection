import os
import numpy as np
import pandas as pd
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


# set path
data_path = "./datasets/frames/raw_frame_U"   # define UCF-101 spatial data path

save_model_path = "./weight/"
csv_path =  './datasets/csv/decoded_test_data.csv'
fold = '1'
h5_train_path = './datasets/trainSet_fold'+fold+'.h5'
h5_val_path = './datasets/valSet_fold'+fold+'.h5'

user = ['U00']


CNN_fc_hidden1, CNN_fc_hidden2 = 1024, 768
CNN_embed_dim = 2048   # latent dim extracted by 2D CNN 2048
res_size = 224        # ResNet image size
dropout_p = 0.3 

RNN_hidden_layers = 3
RNN_hidden_nodes = 512
RNN_FC_dim = 256
mlp_dim = 128 #128
# training parameters
k = 2             # number of target category
epochs = 25        # training epochs
batch_size = 4 #512
num_workers = 1 #8
learning_rate = 0.0001
weight_decay = 0.00001
log_interval = 30   # interval for displaying training info
lr_patience = 15


# Select frames to begin & end in videos
select_frame = {'begin': 1, 'end': 7, 'skip': 1}

def check_mkdir(dir_name):
    if not os.path.exists(dir_name):
        os.mkdir(dir_name)


def train(log_interval, model, device, train_loader, optimizer, epoch):
    print(h5_train_path)
    print(h5_val_path)
    print(params)
    print('MLP')
    # set model as training mode
    rnn_decoder = model
    #cnn_encoder.train()
    rnn_decoder.train()

    losses,scores, all_y, all_y_pred = [],[], [], []
    N_count = 0   # counting total trained sample in one epoch
    for batch_idx, (X, X_lengths, y) in enumerate(train_loader):
        # distribute data to device
        X, X_lengths, y = X.to(device), X_lengths.to(device).view(-1, ), y.to(device).view(-1, )
        N_count += X.size(0)

        optimizer.zero_grad()
        output = rnn_decoder(X, X_lengths)   # output has dim = (batch, number of classes)

        loss = F.cross_entropy(output, y)  # mini-batch loss
#         loss += F.cross_entropy(output, y, reduction='sum').item()  # sum up mini-batch loss
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
    rnn_decoder = model
    #cnn_encoder.eval()
    rnn_decoder.eval()

    test_loss = 0
    all_y, all_y_pred = [], []
    with torch.no_grad():
        for X, X_lengths, y in test_loader:
            # distribute data to device
            X, X_lengths, y = X.to(device), X_lengths.to(device).view(-1, ), y.to(device).view(-1, )

            output = rnn_decoder(X, X_lengths)

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
    print('\nTest set ({:d} samples): Average loss: {:.4f}, Accuracy: {:.2f}%\n'.format(len(all_y), test_loss, 100* test_score))

    # save Pytorch models of best record
    check_mkdir(save_model_path)
    torch.save(rnn_decoder.state_dict(), os.path.join(save_model_path, 'rnn_decoder_mlp'+fold+'_epoch{}.pth'.format(epoch + 1)))  # save motion_encoder
#     torch.save(optimizer.state_dict(), os.path.join(save_model_path, 'optimizer_mlp'+fold+'_epoch{}.pth'.format(epoch + 1)))      # save optimizer
    print("Epoch {} model saved!".format(epoch + 1))

    return test_loss, test_score


# Detect devices
use_cuda = torch.cuda.is_available()                   # check if GPU exists
device = torch.device("cuda" if use_cuda else "cpu")   # use CPU or GPU
#device = torch.device("cpu") 
# Data loading parameters
params = {'batch_size': batch_size, 'shuffle': True, 'num_workers': num_workers, 'pin_memory': True,  'drop_last': True} if use_cuda else {}



df = pd.read_csv(csv_path, index_col="file_name", low_memory=False)
df = df[df['kill_time'].notna()]
df.kill_time = df.kill_time.astype(int)
df = df[df['PID'].isin(user)]
df = df.drop(columns=['PID', 'screen_status', 'record_time','kill_time']) #5


train_set = Dataset_MLP_h5(h5_train_path, None)
valid_set = Dataset_MLP_h5(h5_val_path, None)

train_loader = data.DataLoader(train_set, **params)
valid_loader = data.DataLoader(valid_set, **params)

# Create model
rnn_decoder = MLPEncoder(mlp_dim, RNN_hidden_layers, RNN_hidden_nodes,
                         RNN_FC_dim, dropout_p, k, df, device).to(device)
if torch.cuda.device_count() > 1:
    print("Using", torch.cuda.device_count(), "GPUs!")
    #cnn_encoder = nn.DataParallel(cnn_encoder)
    rnn_decoder = nn.DataParallel(rnn_decoder)
    crnn_params = list(rnn_decoder.parameters())
elif torch.cuda.device_count() == 1:
    print("Using", torch.cuda.device_count(), "GPU!")
    # Combine all EncoderCNN + DecoderRNN parameters
    crnn_params = list(rnn_decoder.parameters())


optimizer = torch.optim.Adam(rnn_decoder.parameters(), lr=learning_rate)
scheduler = ReduceLROnPlateau(optimizer, 'min', patience=lr_patience, min_lr=1e-10, verbose=True)
# -

# record training process
epoch_train_losses = []
epoch_train_scores = []
epoch_test_losses = []
epoch_test_scores = []

# start training
for epoch in range(epochs):
    print(time.asctime(time.localtime(time.time())))
    # train, test model
    epoch_train_loss, epoch_train_score = train(log_interval, rnn_decoder, device, train_loader, optimizer, epoch)
    epoch_test_loss, epoch_test_score = validation(rnn_decoder, device, optimizer, valid_loader)
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
    np.save('./weight/MLP'+fold+'_training_loss.npy', A)
    np.save('./weight/MLP'+fold+'_training_score.npy', B)
    np.save('./weight/MLP'+fold+'_test_loss.npy', C)
    np.save('./weight/MLP'+fold+'_test_score.npy', D)




