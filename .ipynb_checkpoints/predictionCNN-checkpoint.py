# -*- coding: utf-8 -*-
import os
import numpy as np
import torch
import torchvision.transforms as transforms
import torch.utils.data as data
import matplotlib.pyplot as plt
from utils.functions import *
from sklearn.preprocessing import OneHotEncoder, LabelEncoder
from sklearn.metrics import accuracy_score,confusion_matrix, classification_report,average_precision_score,recall_score
import pandas as pd
import pickle
from sklearn.metrics import accuracy_score,confusion_matrix, classification_report,average_precision_score,recall_score,f1_score,roc_auc_score
from utils.ALSTM import *
from collections import OrderedDict




# +
# set path
data_path = "../../poster_data/raw_frame_ordered_P"                # define UCF-101 RGB data path
action_path = "../targets_P"

rnn_checkpoint_path = './weight/rnn_decoder_CRNN1_epoch1.pth'
cnn_checkpoint_path = './weight/cnn_encoder_CRNN1_epoch1.pth'
h5_test_path = './datasets/testSet_fold1.h5'
save_csv_path = './prediction/screenshot_result.csv'
print(h5_test_path)
print(save_csv_path)
# use same encoder CNN saved!
CNN_fc_hidden1, CNN_fc_hidden2 = 1024, 768
CNN_embed_dim = 2048   # latent dim extracted by 2D CNN
res_size = 224        # ResNet image size
dropout_p = 0.3      # dropout probability
# use same decoder RNN saved!
RNN_hidden_layers = 3
RNN_hidden_nodes = 512
RNN_FC_dim = 256
# training parameters
k = 2             # number of target category
batch_size = 2 #256
# Select which frame to begin & end in videos
begin_frame, end_frame, skip_frame = 1, 7, 1
# data loading parameters
use_cuda = torch.cuda.is_available()                   # check if GPU exists
device = torch.device("cuda" if use_cuda else "cpu")   # use CPU or GPU
transform = transforms.Compose([transforms.ToTensor()])
selected_frames = np.arange(begin_frame, end_frame, skip_frame).tolist()

# reload CRNN model

cnn_encoder = ResCNNEncoder(fc_hidden1=CNN_fc_hidden1, fc_hidden2=CNN_fc_hidden2, drop_p=dropout_p, CNN_embed_dim=CNN_embed_dim).to(device)
rnn_decoder = DecoderRNN_varlen(CNN_embed_dim=CNN_embed_dim, h_RNN_layers=RNN_hidden_layers, h_RNN=RNN_hidden_nodes,
                         h_FC_dim=RNN_FC_dim, drop_p=dropout_p, num_classes=k).to(device)


state_dict1 = torch.load(rnn_checkpoint_path)
new_state_dict1 = OrderedDict()
for k, v in state_dict1.items():
    name = k[7:] # remove `module.`
    new_state_dict1[name] = v
# load params
rnn_decoder.load_state_dict(new_state_dict1)
print('load combine model...')

state_dict2 = torch.load(cnn_checkpoint_path)
new_state_dict2 = OrderedDict()
for k, v in state_dict2.items():
    name = k[7:] # remove `module.`
    new_state_dict2[name] = v
# load params
# cnn_encoder = nn.DataParallel(cnn_encoder)
cnn_encoder.load_state_dict(new_state_dict2)
print('load combine model...')

# reset data loader
params = {'batch_size': batch_size, 'shuffle': False, 'num_workers': 0, 'pin_memory': True,  'drop_last': True} if use_cuda else {}

if torch.cuda.device_count() > 1:
    print("Using", torch.cuda.device_count(), "GPUs!")
    cnn_encoder = nn.DataParallel(cnn_encoder)
    rnn_decoder = nn.DataParallel(rnn_decoder)
#     crnn_params = list(cnn_encoder.module.parameters())
    crnn_params = list(cnn_encoder.module.fc4.parameters()) + list(rnn_decoder.parameters())
elif torch.cuda.device_count() == 1:
    print("Using", torch.cuda.device_count(), "GPU!")
    # Combine all EncoderCNN + DecoderRNN parameters
    crnn_params = list(rnn_decoder.parameters())


pred=[]
y=[]
y=np.array(y)
filename = []
filename=np.array(filename)
pred=np.array(pred)
for i in range(5):

    test_set = Dataset_h5_CNN(h5_test_path, i, transform=transform, train=False, filename = True)
    test_loader = data.DataLoader(test_set, **params)

    print('Predicting all {} videos:'.format(len(test_loader.dataset)))
    y_, pred_ , filename_= CRNN_final_prediction([cnn_encoder, rnn_decoder], device, test_loader, prob = True)

    y = np.append(y,y_)
    pred = np.append(pred,pred_)
    filename = np.append(filename,filename_)

    del test_loader, test_set





df = pd.DataFrame(data={'filename':filename, 'y': y, 'y_pred_CNN': pred})
df.to_csv(save_csv_path, index=True)



print('video prediction finished!',h5_test_path)
del cnn_encoder
del rnn_decoder
