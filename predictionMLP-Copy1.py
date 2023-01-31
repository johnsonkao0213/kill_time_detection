# -*- coding: utf-8 -*-
import os
import numpy as np
import pandas as pd
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
from captum.attr import IntegratedGradients, LayerIntegratedGradients, GuidedBackprop, Saliency
from captum.attr import LayerConductance
from captum.attr import NeuronConductance
from collections import OrderedDict




# +
# set path
data_path = "../../poster_data/raw_frame_P"                # define UCF-101 RGB data path
action_path = "../targets_P"
save_model_path = "./ResNetCRNN_ckpt_attention_map/"
csv_path = "../CHI_PhoneLog_gap.csv"
user = ['P10','P11','P16','P17','P18','P19','P23','P24','P25','P26','P28','P29','P30','P31','P32','P33','P35','P36','P37','P38','P40','P41','P42','P43','P44','P45','P46','P47','P48','P49','P50','P51','P52','P53','P54','P55']

epoch = {
    'group1' : {
        '1': '25',
        '2': '8',
        '3': '4'
     },
    'group2' : {
        '1': '5',
        '2': '5',
        '3': '4'
     },
    'group3' : {
        '1': '10',
        '2': '6',
        '3': '2'
     },
    'group4' : {
        '1': '19',
        '2': '3',
        '3': '12'
     },
    'all' : {
        '1': '2',
        '2': '4',
        '3': '3'
     },
    'group1(2)' : {
        '1': '15',
        '2': '8',
        '3': '5'
     },'Group1' : {
        '1': '7',
        '2': '4',
        '3': ''
     },'Group2' : {
        '1': '8',
        '2': '19',
        '3': '13'
     },'Group3' : {
        '1': '6',
        '2': '4',
        '3': '8'
     },'Group4' : {
        '1': '16',
        '2': '13',
        '3': '3'
     },'Group5' : {
        '1': '9',
        '2': '13',
        '3': '7'
     },'Group1_2' : {
        '1': '6',
        '2': '6',
        '3': '8'
     },'Group4_2' : {
        '1': '9',
        '2': '5',
        '3': '2'
     },'Group6_2' : {
        '1': '11',
        '2': '2',
        '3': '3'
     },
}
for dataset in ['Group1_2']:
    for fold in ['1','2']:

        checkpoint_path = 'rnn_decoder_mlp'+fold+'_day_55_'+dataset+'_weekend_epoch'+epoch[dataset][fold]+'.pth'
        h5_test_path = '../../../../work/u7002555/CHI_images_users_by_day_55_'+dataset+'_weekend_testSet_fold'+fold+'.h5'
        save_csv_path = './predictionByPerson/predictionMLP_'+fold+'_55_weekend_'+dataset+'_prob.csv'
        print(checkpoint_path)
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
        #device = "cpu"
        #params = {'batch_size': batch_size, 'shuffle': False, 'num_workers': 4, 'pin_memory': True} if use_cuda else {}
        transform = transforms.Compose(transforms.ToTensor())
        selected_frames = np.arange(begin_frame, end_frame, skip_frame).tolist()
        df = pd.read_csv(csv_path, index_col="file_name", low_memory=False)
        df = df[df['kill_time'].notna()]
        df.kill_time = df.kill_time.astype(int)
        df = df[df['PID'].isin(user)]
        df = df.drop(columns=['Unnamed: 0', 'PID' ,'screen_status', 'record_time', 'is_screenshotted',
                              'kill_time', 'cdma_signal_strength', 'lte_signal_strength_dbm']) #8
        rnn_decoder = MLPEncoder(mlp_dim, RNN_hidden_layers, RNN_hidden_nodes,
                                RNN_FC_dim, dropout_p, k, df, device).to(device)

        state_dict1 = torch.load(os.path.join(save_model_path, checkpoint_path))

        new_state_dict1 = OrderedDict()
        for k, v in state_dict1.items():
            name = k[7:] # remove `module.`
            new_state_dict1[name] = v
        # load params
        rnn_decoder.load_state_dict(new_state_dict1)
        print('load combine model...')
        # reset data loader
        params = {'batch_size': batch_size, 'shuffle': False, 'num_workers': 0, 'pin_memory': True,  'drop_last': True} if use_cuda else {}
        if torch.cuda.device_count() > 1:
            print("Using", torch.cuda.device_count(), "GPUs!")
            #cnn_encoder = nn.DataParallel(cnn_encoder)
            rnn_decoder = nn.DataParallel(rnn_decoder)
            #crnn_params = list(rnn_decoder.parameters())

        elif torch.cuda.device_count() == 1:
            print("Using", torch.cuda.device_count(), "GPU!")
            # Combine all EncoderCNN + DecoderRNN parameters
            #crnn_params = list(rnn_decoder.parameters())

        # make all video predictions by reloaded model



        pred=[]
        y=[]
        y=np.array(y)
        pred=np.array(pred)

        test_set = Dataset_MLP_h5(h5_test_path, None, filename = True)
        test_loader = data.DataLoader(test_set, **params)
        y, pred, filename = MLP_final_prediction(rnn_decoder, device, test_loader, prob = True)


        dff = pd.DataFrame(data={'filename': filename, 'y': y, 'y_pred_MLP': pred})
        dff.to_csv(save_csv_path, index=True) 
        print('video prediction finished!',h5_test_path)
        del rnn_decoder


# -































