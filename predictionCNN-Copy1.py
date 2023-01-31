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




# +
# set path
data_path = "../../poster_data/raw_frame_ordered_P"                # define UCF-101 RGB data path
action_path = "../targets_P"
save_model_path = "./ResNetCRNN_ckpt_attention_map/"
epoch = {
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
}
for dataset in ['Group1_2']:
    for fold in ['1','2','3']:
# csv_path = '../CHI_PhoneLog_30_55.csv'
# dataset_X_path = "./poster_dataset_6_people/poster_testSet_X_4.npy"
# dataset_Y_path = "./poster_dataset_6_people/poster_testSet_Y_4.npy"
# h5_test_path = './CHI_30images_users_testSet_fold1.h5'
# h5_test_path = './CHI_users_testSet_fold2.h5'
# h5_test_path = '../../../../work/u7002555/CHI_images_users_by_day_55_testSet_fold'+fold+'.h5'
# h5_test_path = '../../../../work/u7002555/CHI_images_users_by_day_testSet_fold'+fold+'.h5'

# h5_test_path = '../../../../work/u7002555/CHI_gen1_users_testSet_fold'+fold+'.h5'
# user = ['P10','P11','P14','P16','P17','P18','P19','P22','P23','P24','P25','P26','P27','P28','P29','P30','P31','P32','P33','P35','P36','P37','P38','P39','P40','P41','P42','P43','P44','P45','P46','P47','P48','P49','P50','P51','P52','P53','P54','P55']
# user=['P11','P14','P23','P24','P25','P27','P35']
        rnn_checkpoint_path = 'rnn_decoder_CRNN'+fold+'_day_55_'+dataset+'_weekend_epoch'+epoch[dataset][fold]+'.pth'
        cnn_checkpoint_path = 'cnn_encoder_CRNN'+fold+'_day_55_'+dataset+'_weekend_epoch'+epoch[dataset][fold]+'.pth'
        h5_test_path = "../../../../work/u7002555/CHI_images_users_by_day_55_"+dataset+"_weekend_testSet_fold"+fold+".h5"
        save_csv_path = './predictionByPerson/predictionCNN_'+fold+'_'+dataset+'_weekend_prob.csv'
        print(rnn_checkpoint_path)
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
        batch_size = 256
        # Select which frame to begin & end in videos
        begin_frame, end_frame, skip_frame = 1, 7, 1
        # data loading parameters
        use_cuda = torch.cuda.is_available()                   # check if GPU exists
        device = torch.device("cuda" if use_cuda else "cpu")   # use CPU or GPU
        transform = transforms.Compose([transforms.ToTensor()
                                       ,transforms.GaussianBlur((5, 9), sigma=(1.0, 1.0))
                                       ])
        selected_frames = np.arange(begin_frame, end_frame, skip_frame).tolist()

        # df = pd.read_csv(csv_path, index_col="file_name", low_memory=False)
        # df = df[df['kill_time'].notna()]
        # df.kill_time = df.kill_time.astype(int)
        # df = df[df['PID'].isin(user)]
        # df = df.drop(columns=['Unnamed: 0', 'PID' ,'screen_status', 'record_time', 'is_screenshotted','kill_time', 'cdma_signal_strength', 'lte_signal_strength_dbm']) #8

        # reload CRNN model

        cnn_encoder = ResCNNEncoder(fc_hidden1=CNN_fc_hidden1, fc_hidden2=CNN_fc_hidden2, drop_p=dropout_p, CNN_embed_dim=CNN_embed_dim).to(device)
        rnn_decoder = DecoderRNN_varlen(CNN_embed_dim=CNN_embed_dim, h_RNN_layers=RNN_hidden_layers, h_RNN=RNN_hidden_nodes,
                                 h_FC_dim=RNN_FC_dim, drop_p=dropout_p, num_classes=k).to(device)


        state_dict1 = torch.load(os.path.join(save_model_path, rnn_checkpoint_path))
        new_state_dict1 = OrderedDict()
        for k, v in state_dict1.items():
            name = k[7:] # remove `module.`
            new_state_dict1[name] = v
        # load params
        rnn_decoder.load_state_dict(new_state_dict1)
        print('load combine model...')

        state_dict2 = torch.load(os.path.join(save_model_path, cnn_checkpoint_path ))
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




        # make all video predictions by reloaded model
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

# -


































# cnn_encoder = nn.DataParallel(cnn_encoder)
# rnn_decoder = nn.DataParallel(rnn_decoder)
# create new OrderedDict that does not contain `module.`









# ig = IntegratedGradients(rnn_decoder)
# X.requires_grad_()
# attr, delta = ig.attribute(X, target=1, return_convergence_delta=True)
# attr = attr.detach().cpu().numpy()
# visualize_importances(feature_names, np.mean(np.sum(attr, axis=1), axis=0))





