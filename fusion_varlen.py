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
from functions import *
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder, LabelEncoder
from sklearn.metrics import accuracy_score, roc_auc_score
import pickle
import time
from collections import OrderedDict

csv_path = "../CHI_PhoneLog_gap.csv"
user = ['P10','P11','P16','P17','P18','P19','P23','P24','P25','P26','P28','P29','P30','P31','P32','P33','P35','P36','P37','P38','P40','P41','P42','P43','P44','P45','P46','P47','P48','P49','P50','P51','P52','P53','P54','P55']





# training parameters
k = 2             # number of target category
epochs = 10        # training epochs
batch_size = 224
learning_rate = 0.000001
lr_patience = 15
log_interval = 30   # interval for displaying training info
weight_decay = 0.0001



# Select frames to begin & end in videos
select_frame = {'begin': 1, 'end': 7, 'skip': 1}

def check_mkdir(dir_name):
    if not os.path.exists(dir_name):
        os.mkdir(dir_name)

def train(log_interval, model, device, train_loader, optimizer, epoch):
    # set model as training mode
#     cnn_encoder, rnn_decoder = model

    model.train()
    roc_auc=[]
    losses, scores, all_y, all_y_pred = [],[], [], []
    N_count = 0   # counting total trained sample in one epoch
    for batch_idx, (X,X_log ,X_lengths, y) in enumerate(train_loader):
        # distribute data to device
        X,X_log ,X_lengths, y = X.to(device),X_log.to(device) ,X_lengths.to(device).view(-1, ), y.to(device).view(-1, )

        N_count += X.size(0)

        optimizer.zero_grad()
        output = model(X,X_log ,X_lengths)
#         output = rnn_decoder(cnn_encoder(X), X_lengths)   # output has dim = (batch, number of classes)

        loss = F.cross_entropy(output, y)  # mini-batch loss
#         epoch_loss += F.cross_entropy(output, y, reduction='sum').item()  # sum up mini-batch loss
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
        step_roc_auc_score = roc_auc_score(y.cpu().data.squeeze().numpy(), y_pred.cpu().data.squeeze().numpy())
        roc_auc.append(step_roc_auc_score)
        # show information
        if (batch_idx + 1) % log_interval == 0:
            print('Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}, Accu: {:.2f}%, roc_auc: {:.2f}%'.format(
                epoch + 1, N_count, len(train_loader.dataset), 100. * (batch_idx + 1) / len(train_loader), loss.item(),100 * step_score, 100 * step_roc_auc_score))

#     epoch_loss /= len(train_loader)

    # compute accuracy
    all_y = torch.stack(all_y, dim=0)
    all_y_pred = torch.stack(all_y_pred, dim=0)
#     epoch_score = accuracy_score(all_y.cpu().data.squeeze().numpy(), all_y_pred.cpu().data.squeeze().numpy())

    return losses, scores, roc_auc

def validation(model, device, optimizer, test_loader):
    # set model as testing mode
#     cnn_encoder, rnn_decoder = 
    model.eval()
#     cnn_encoder.eval()
#     rnn_decoder.eval()

    test_loss = 0
    all_y, all_y_pred = [], []
    with torch.no_grad():
        for X,X_log ,X_lengths, y in test_loader:
            # distribute data to device
            X,X_log ,X_lengths, y = X.to(device),X_log.to(device) ,X_lengths.to(device).view(-1, ), y.to(device).view(-1, )

            output = model(X,X_log,X_lengths)

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
    test_roc_auc_score = roc_auc_score(all_y.cpu().data.squeeze().numpy(), all_y_pred.cpu().data.squeeze().numpy())

    # show information
#     print('\nTest set ({:d} samples): Average loss: {:.4f}, Accuracy: {:.2f}%\n'.format(len(all_y), test_loss, 100* test_score))

#     # save Pytorch models of best record
#     check_mkdir(save_model_path)
#     torch.save(cnn_encoder.state_dict(), os.path.join(save_model_path, 'cnn_encoder_epoch{}.pth'.format(epoch + 1)))  # save spatial_encoder
#     torch.save(rnn_decoder.state_dict(), os.path.join(save_model_path, 'rnn_decoder_epoch{}.pth'.format(epoch + 1)))  # save motion_encoder
#     torch.save(optimizer.state_dict(), os.path.join(save_model_path, 'optimizer_epoch{}.pth'.format(epoch + 1)))      # save optimizer
#     print("Epoch {} model saved!".format(epoch + 1))

    return test_loss, test_score, test_roc_auc_score

# set path
data_path = "../../CHI_data/raw_frame_P"   # define UCF-101 spatial data path

save_model_path = "./ResNetCRNN_ckpt_attention_map/"
# fold = '3'
# dataset = 'Group1'
# cnnEpoch= '15'
# mlpEpoch= '5'

MLP_epoch = {
    'Group1_2' : {
        '1': '6',
        '2': '6',
        '3': '8'
     },
    'Group2' : {
        '1': '8',
        '2': '19',
        '3': '13'
     },
    'Group3' : {
        '1': '6',
        '2': '4',
        '3': '8'
     },
    'Group4_2' : {
        '1': '9',
        '2': '5',
        '3': '2'
     },
    'Group5' : {
        '1': '9',
        '2': '13',
        '3': '7'
     },
    'Group6_2' : {
        '1': '11',
        '2': '2',
        '3': '3'
     },
    'all' : { #random
        '1': '20',
     },
}

CNN_epoch = {
    'Group1_2' : {
        '1': '19',
        '2': '18',
        '3': '20'
     },
    'Group2' : {
        '1': '14',
        '2': '20',
        '3': '19'
     },
    'Group3' : {
        '1': '6',
        '2': '17',
        '3': '18'
     },
    'Group4_2' : {
        '1': '15',
        '2': '12',
        '3': '9'
     },
    'Group5' : {
        '1': '14',
        '2': '18',
        '3': '15'
     },
    'Group6_2' : {
        '1': '12',
        '2': '6',
        '3': '12'
     },
    'all' : { #random
        '1': '20',
     },
}
df = pd.read_csv(csv_path, index_col="file_name", low_memory=False)
df = df[df['kill_time'].notna()]
df.kill_time = df.kill_time.astype(int)
df = df[df['PID'].isin(user)]
df = df.drop(columns=['Unnamed: 0', 'PID' ,'screen_status', 'record_time', 'is_screenshotted','kill_time', 'cdma_signal_strength', 'lte_signal_strength_dbm']) #8

# Detect devices
use_cuda = torch.cuda.is_available()                   # check if GPU exists
device = torch.device("cuda" if use_cuda else "cpu")   # use CPU or GPU

for dataset in ['all']:
    for fold in ['1']:
        # h5_train_path = '../../../../../work/u7002555/CHI_images_users_by_day_trainSet_fold'+fold+'.h5'
        # h5_val_path = '../../../../work/u7002555/CHI_images_users_by_day_valSet_fold'+fold+'.h5'
        # h5_train_path = '../../../../work/u7002555/CHI_images_users_by_day_55_trainSet_fold'+fold+'.h5'
        # h5_val_path = '../../../../work/u7002555/CHI_images_users_by_day_55_valSet_fold'+fold+'.h5'
        # h5_train_path = '../../../../work/u7002555/CHI_images_users_by_day_cluster2_2_trainSet_fold'+fold+'.h5'
        # h5_val_path = '../../../../work/u7002555/CHI_images_users_by_day_cluster2_2_testSet_fold'+fold+'.h5'
        # h5_train_path = './CHI_gen_users5_'+fold+'_3_trainSet.h5'
        # h5_val_path = './CHI_gen_users5_'+fold+'_3_testSet.h5'
        h5_train_path = "../../../../work/u7002555/CHI_images_users_by_day_55_"+dataset+"_weekend_random_trainSet_fold"+fold+".h5"
        h5_val_path = "../../../../work/u7002555/CHI_images_users_by_day_55_"+dataset+"_weekend_random_valSet_fold"+fold+".h5"

        CNN_fc_hidden1, CNN_fc_hidden2 = 1024, 768
        CNN_embed_dim = 2048   # latent dim extracted by 2D CNN
        res_size = 224        # ResNet image size
        dropout_p = 0.5       # dropout probability

        # DecoderRNN architecture
        RNN_hidden_layers = 3
        RNN_hidden_nodes = 512
        RNN_hidden_nodes_mlp = 512
        RNN_FC_dim = 256
        mlp_dim = 128

        # Data loading parameters
        params = {'batch_size': batch_size, 'shuffle': True, 'num_workers': 0, 'pin_memory': True,  'drop_last': True} if use_cuda else {}

        transformT = transforms.Compose([transforms.ToTensor(),
                                        transforms.RandomRotation(30),
                                        transforms.RandomCrop([100,100])])
        transform = transforms.Compose([transforms.Resize([res_size, res_size]),
                                        transforms.ToTensor(),
                                        transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])])
        # EncoderCNN architecture
        
        
        # Create model
        cnn_encoder = ResCNNEncoder(fc_hidden1=CNN_fc_hidden1, fc_hidden2=CNN_fc_hidden2, drop_p=dropout_p, CNN_embed_dim=CNN_embed_dim).to(device)
        rnn_decoder = DecoderRNN_varlen(CNN_embed_dim=CNN_embed_dim, h_RNN_layers=RNN_hidden_layers, h_RNN=RNN_hidden_nodes,
                                 h_FC_dim=RNN_FC_dim, drop_p=dropout_p, num_classes=k,feature=True).to(device)

        MLP = MLPEncoder(mlp_dim, RNN_hidden_layers, RNN_hidden_nodes_mlp,
                                 RNN_FC_dim, dropout_p, k, df, device,feature=True).to(device)


        model = combineEncoder(cnn_encoder, rnn_decoder, MLP, dropout_p, num_classes=k).to(device)
        del MLP, rnn_decoder,cnn_encoder
        state_dict2 = torch.load(os.path.join(save_model_path, 'rnn_decoder_CRNN'+fold+'_day_55_'+dataset+'_weekend_random_epoch'+CNN_epoch[dataset][fold]+'.pth'))
        new_state_dict2 = OrderedDict()
        for k, v in state_dict2.items():
            name = k[7:] # remove `module.`
            new_state_dict2[name] = v
            # load params
        model.rnn_decoder.load_state_dict(new_state_dict2)
        print('load rnn_decoder...')

        state_dict1 = torch.load(os.path.join(save_model_path, 'cnn_encoder_CRNN'+fold+'_day_55_'+dataset+'_weekend_random_epoch'+CNN_epoch[dataset][fold]+'.pth'))
        new_state_dict1 = OrderedDict()
        for k, v in state_dict1.items():
            name = k[7:] # remove `module.`
            new_state_dict1[name] = v
        # load params
        model.cnn_encoder.load_state_dict(new_state_dict1)
        print('load cnn_encoder...')

        state_dict3 = torch.load(os.path.join(save_model_path, 'rnn_decoder_mlp'+fold+'_day_55_'+dataset+'_weekend_random_epoch'+MLP_epoch[dataset][fold]+'.pth'))
        new_state_dict3 = OrderedDict()
        for k, v in state_dict3.items():
            name = k[7:] # remove `module.`
            new_state_dict3[name] = v
        # load params
        model.mlp.load_state_dict(new_state_dict3)
        print('load MLP...')




        for param in model.rnn_decoder.parameters():
            param.required_grad = False
        for param in model.cnn_encoder.parameters():
            param.required_grad = False
        for param in model.mlp.parameters():
            param.required_grad = False


        # Combine all EncoderCNN + DecoderRNN parameters
        print("Using", torch.cuda.device_count(), "GPU!")
        if torch.cuda.device_count() > 1:
            # Parallelize model to multiple GPUs
        #     cnn_encoder = nn.DataParallel(cnn_encoder)
            model = nn.DataParallel(model)
            crnn_params = list(model.parameters())
        #                   list(cnn_encoder.module.fc1.parameters()) + list(cnn_encoder.module.bn1.parameters()) + \
        #                   list(cnn_encoder.module.fc2.parameters()) + list(cnn_encoder.module.bn2.parameters()) + \
        #                   list(cnn_encoder.module.fc3.parameters()) + list(rnn_decoder.parameters())

        elif torch.cuda.device_count() == 1:
            crnn_params = list(cnn_encoder.fc1.parameters()) + list(cnn_encoder.bn1.parameters()) + \
                          list(cnn_encoder.fc2.parameters()) + list(cnn_encoder.bn2.parameters()) + \
                          list(cnn_encoder.fc3.parameters()) + list(model.parameters())

        optimizer = torch.optim.Adam(crnn_params, lr=learning_rate,weight_decay=weight_decay)
        scheduler = ReduceLROnPlateau(optimizer, 'min', patience=lr_patience, min_lr=1e-10, verbose=True)

        # record training process
        epoch_train_losses = []
        epoch_train_scores = []
        epoch_test_losses = []
        epoch_test_scores = []
        epoch_train_roc_auc_scores = []
        epoch_test_roc_auc_scores = []

        # start training
        for epoch in range(epochs):
            print(time.asctime(time.localtime(time.time())))
            print(h5_train_path)
            # train, test model
            train_set = Dataset_h5(h5_train_path, epoch, transform=transformT)

            train_loader = data.DataLoader(train_set, **params)
            epoch_train_loss, epoch_train_score, epoch_train_roc_auc_score = train(log_interval, model, device, train_loader, optimizer, epoch)
            del train_loader, train_set

            epoch_test_loss, epoch_test_score,epoch_test_roc_auc_score = 0,0,0
            for i in range(5):
                valid_set = Dataset_h5(h5_val_path, epochs, transform=transformT,train = False)
                valid_loader = data.DataLoader(valid_set, **params)
                test_loss, test_score,test_roc_auc_score = validation(model, device, optimizer, valid_loader)

                epoch_test_loss += test_loss
                epoch_test_score += test_score
                epoch_test_roc_auc_score+=test_roc_auc_score

                del valid_loader, valid_set
        #     epoch_test_loss, epoch_test_score = epoch_test_loss, epoch_test_score
            epoch_test_loss, epoch_test_score, epoch_test_roc_auc_score = epoch_test_loss/5, epoch_test_score/5, epoch_test_roc_auc_score/5
            print('\nVaild set: Average loss: {:.4f}, Accuracy: {:.2f}%\n'.format(epoch_test_loss, 100* epoch_test_score))

            torch.save(model.state_dict(), os.path.join(save_model_path, 'rnn_decoder_fusion'+fold+'_day_55_'+dataset+'_weekend_random_epoch{}.pth'.format(epoch + 1)))  # save motion_encoder
            torch.save(optimizer.state_dict(), os.path.join(save_model_path, 'optimizer_fusion'+fold+'_day_55_'+dataset+'_weekend_random_epoch{}.pth'.format(epoch + 1)))      # save optimizer
            print("Epoch {} model saved!".format(epoch + 1))

            scheduler.step(epoch_test_loss)

            # save results
            epoch_train_losses.append(epoch_train_loss)
            epoch_train_scores.append(epoch_train_score)
            epoch_train_roc_auc_scores.append(epoch_train_roc_auc_score)
            epoch_test_losses.append(epoch_test_loss)
            epoch_test_scores.append(epoch_test_score)
            epoch_test_roc_auc_scores.append(epoch_test_roc_auc_score)


            # save all train test results
            A = np.array(epoch_train_losses)
            B = np.array(epoch_train_scores)
            C = np.array(epoch_test_losses)
            D = np.array(epoch_test_scores)
            E = np.array(epoch_train_roc_auc_scores)
            G = np.array(epoch_test_roc_auc_scores)
            np.save('./fusion'+fold+'_day_55_'+dataset+'_weekend_random_training_loss.npy', A)
            np.save('./fusion'+fold+'_day_55_'+dataset+'_weekend_random_training_score.npy', B)
            np.save('./fusion'+fold+'_day_55_'+dataset+'_weekend_random_test_loss.npy', C)
            np.save('./fusion'+fold+'_day_55_'+dataset+'_weekend_random_test_score.npy', D)
            np.save('./fusion'+fold+'_day_55_'+dataset+'_weekend_random_training_roc_auc.npy', E)
            np.save('./fusion'+fold+'_day_55_'+dataset+'_weekend_random_test_roc_auc.npy', G)

        # plot
        fig = plt.figure(figsize=(10, 4))
        plt.subplot(121)
        plt.plot(np.arange(1, epochs + 1), A[:, -1])  # train loss (on epoch end)
        plt.plot(np.arange(1, epochs + 1), C)  # test loss (on epoch end)
        plt.title("model loss")
        plt.xlabel('epochs')
        plt.ylabel('loss')
        plt.legend(['train', 'test'], loc="upper left")
        # 2nd figure (accuracy)
        plt.subplot(122)
        plt.plot(np.arange(1, epochs + 1), B[:, -1])  # train accuracy (on epoch end)
        plt.plot(np.arange(1, epochs + 1), D)  # test accuracy (on epoch end)
        plt.title("training scores")
        plt.xlabel('epochs')
        plt.ylabel('accuracy')
        plt.legend(['train', 'test'], loc="upper left")
        title = "./fig_UCF101_ResNetCRNN.png"
        plt.savefig(title, dpi=600)
        # plt.close(fig)
        plt.show()

