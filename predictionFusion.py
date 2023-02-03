# -*- coding: utf-8 -*-
import os
import numpy as np
import torch
import torchvision.transforms as transforms
import torch.utils.data as data
import matplotlib.pyplot as plt
from functions import *
from sklearn.preprocessing import OneHotEncoder, LabelEncoder
from sklearn.metrics import accuracy_score,confusion_matrix, classification_report,average_precision_score,recall_score
import pandas as pd
import pickle
from sklearn.metrics import accuracy_score,confusion_matrix, classification_report,average_precision_score,recall_score,f1_score,roc_auc_score
from ALSTM import *
from collections import OrderedDict





# set path
data_path = "../../poster_data/raw_frame_ordered_P"                
action_path = "../targets_P"
save_model_path = "./ResNetCRNN_ckpt_attention_map/"
csv_path = "../CHI_PhoneLog_gap.csv"




user = ['P10','P11','P16','P17','P18','P19','P23','P24','P25','P26','P28','P29','P30','P31','P32','P33','P35','P36','P37','P38','P40','P41','P42','P43','P44','P45','P46','P47','P48','P49','P50','P51','P52','P53','P54','P55']

epoch = {
    'group1' : {
        '1': '4',
        '2': '4',
        '3': '4'
     },
    'group2' : {
        '1': '3',
        '2': '3',
        '3': '5'
     },
    'group3' : {
        '1': '9',
        '2': '3',
        '3': '4'
     },
    'group4' : {
        '1': '9',
        '2': '5',
        '3': '8'
     },
    'all' : {
        '1': '6',
        '2': '7',
        '3': '7'
     },
    'Group1_2' : {
        '1': '5',
        '2': '6',
        '3': '4'
     },
    'Group2' : {
        '1': '10',
        '2': '10',
        '3': '10'
     },
    'Group3' : {
        '1': '5',
        '2': '4',
        '3': '8'
     },'Group4_2' : {
        '1': '6',
        '2': '7',
        '3': '7'
     },'Group5' : {
        '1': '9',
        '2': '10',
        '3': '9'
     },'Group6_2' : {
        '1': '7',
        '2': '10',
        '3': '7'
     }
}
    


checkpoint_path = 'rnn_decoder_fusion'+fold+'_day_55_'+dataset+'_weekend_random_epoch'+epoch[dataset][fold]+'.pth'
save_csv_path = './predictionByPerson/predictionfusion_'+fold+'_'+dataset+'_weekend_random_prob.csv'
h5_test_path = "../../../../work/u7002555/CHI_images_users_by_day_55_"+dataset+"_weekend_testSet_fold"+fold+".h5"

# use same encoder CNN saved!
CNN_fc_hidden1, CNN_fc_hidden2 = 1024, 768
CNN_embed_dim = 2048   # latent dim extracted by 2D CNN
res_size = 224        # ResNet image size
dropout_p = 0.3      # dropout probability
# use same decoder RNN saved!
RNN_hidden_layers = 3
RNN_hidden_nodes = 512
RNN_hidden_nodes_mlp = 512
RNN_FC_dim = 256
mlp_dim = 128
# training parameters
k = 2             # number of target category
batch_size = 256
# Select which frame to begin & end in videos
begin_frame, end_frame, skip_frame = 1, 7, 1
# data loading parameters
use_cuda = torch.cuda.is_available()                   # check if GPU exists
device = torch.device("cuda" if use_cuda else "cpu")   # use CPU or GPU
params = {'batch_size': batch_size, 'shuffle': False, 'num_workers': 4, 'pin_memory': True} if use_cuda else {}

transform = transforms.Compose(transforms.ToTensor())
selected_frames = np.arange(begin_frame, end_frame, skip_frame).tolist()
df = pd.read_csv(csv_path, index_col="file_name", low_memory=False)
df = df[df['kill_time'].notna()]
df.kill_time = df.kill_time.astype(int)
df = df[df['PID'].isin(user)]
df = df.drop(columns=['Unnamed: 0', 'PID' ,'screen_status', 'record_time', 'is_screenshotted','kill_time', 'cdma_signal_strength', 'lte_signal_strength_dbm']) #8

cnn_encoder = ResCNNEncoder(fc_hidden1=CNN_fc_hidden1, fc_hidden2=CNN_fc_hidden2, drop_p=dropout_p, CNN_embed_dim=CNN_embed_dim).to(device)
rnn_decoder = DecoderRNN_varlen(CNN_embed_dim=CNN_embed_dim, h_RNN_layers=RNN_hidden_layers, h_RNN=RNN_hidden_nodes,
                         h_FC_dim=RNN_FC_dim, drop_p=dropout_p, num_classes=k,feature=True).to(device)

MLP = MLPEncoder(mlp_dim, RNN_hidden_layers, RNN_hidden_nodes_mlp,
                         RNN_FC_dim, dropout_p, k, df, device,feature=True).to(device)
model = combineEncoder(cnn_encoder, rnn_decoder, MLP, dropout_p, num_classes=k).to(device)
del MLP, rnn_decoder,cnn_encoder
state_dict2 = torch.load(os.path.join(save_model_path, checkpoint_path))
new_state_dict2 = OrderedDict()
for k, v in state_dict2.items():
    name = k[7:] # remove `module.`
    new_state_dict2[name] = v
    # load params
model.load_state_dict(new_state_dict2)
print('load model...')

# reset data loader
params = {'batch_size': batch_size, 'shuffle': False, 'num_workers': 0, 'pin_memory': True,  'drop_last': True} if use_cuda else {}

if torch.cuda.device_count() > 1:
    print("Using", torch.cuda.device_count(), "GPUs!")
    model = nn.DataParallel(model)
    crnn_params = list(model.parameters())

elif torch.cuda.device_count() == 1:
    print("Using", torch.cuda.device_count(), "GPU!")
    # Combine all EncoderCNN + DecoderRNN parameters
    crnn_params = list(cnn_encoder.fc1.parameters()) + list(cnn_encoder.bn1.parameters()) + \
                  list(cnn_encoder.fc2.parameters()) + list(cnn_encoder.bn2.parameters()) + \
                  list(cnn_encoder.fc3.parameters()) + list(model.parameters())
# make all video predictions by reloaded model




pred=[]
y=[]
filename=[]
y=np.array(y)
pred=np.array(pred)
filename=np.array(filename)
for i in range(5):

    test_set = Dataset_h5(h5_test_path, i, transform=transform, train=False, filename = True)
    test_loader = data.DataLoader(test_set, **params)

    print('Predicting all {} videos:'.format(len(test_loader.dataset)))
    y_, pred_, filename_ = fusion_final_prediction(model, device, test_loader, prob = True)
    y = np.append(y,y_)
    pred = np.append(pred,pred_)
    filename = np.append(filename,filename_)
    del test_loader, test_set


df = pd.DataFrame(data={'filename':filename,'y': y, 'y_pred_Fusion': pred})
df.to_csv(save_csv_path, index=True)

print(checkpoint_path)
print('video prediction finished!',h5_test_path)
del model
# -


