# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.14.1
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

import os
import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.models as models
import torchvision.transforms as transforms
import torch.utils.data as data
import torchvision
from torch.autograd import Variable
import matplotlib.pyplot as plt
from functions import *
from ALSTM import *
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder, LabelEncoder
from sklearn.metrics import accuracy_score
import pickle
from torch.optim.lr_scheduler import StepLR
from collections import OrderedDict
import time
from torch.utils.data import random_split
import h5py
from torch.utils.data import WeightedRandomSampler



# +
use_cuda = torch.cuda.is_available()   
res_size = 224        # ResNet image size
data_path = "../../CHI_data/raw_frame_P"    # define image RGB data path
begin_frame, end_frame, skip_frame = 1, 7, 1
batch_size = 288
num_workers = 32
# ./dataset/CHI_images_users_by_day
folds = ['1']
# all_users = ['10','11','16','17','18','19','22','23','24','25','26','28','29','30','31','32','33','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52','53','54','55'] 

csv_path =  '../CHI_PhoneLog_gap.csv'
user = ['P10','P11','P16','P17','P18','P19','P23','P24','P25','P26','P28','P29','P30','P31','P32','P33','P35','P36','P37','P38','P40','P41','P42','P43','P44','P45','P46','P47','P48','P49','P50','P51','P52','P53','P54','P55'] 

df = pd.read_csv(csv_path, index_col="file_name", low_memory=False)
df = df[df['kill_time'].notna()]
df.kill_time = df.kill_time.astype(int)
df = df[df['PID'].isin(user)]
df = df.drop(columns=['Unnamed: 0', 'PID', 'screen_status', 'record_time', 'is_screenshotted','kill_time', 'cdma_signal_strength', 'lte_signal_strength_dbm']) #8

for dataset in ['val']:
    for fold in folds:
        for k in ['all']:
            dataset_X_path = "./dataset/CHI_images_users_by_day_55_weekend_"+dataset+"Set_X_fold"+fold+".npy"
            dataset_Y_path = "./dataset/CHI_images_users_by_day_55_weekend_"+dataset+"Set_Y_fold"+fold+".npy"
            h5_path = "../../../../work/u7002555/CHI_images_users_by_day_55_"+k+"_weekend_random_"+dataset+"Set_fold"+fold+".h5"



            all_X_list = np.load(dataset_X_path)
            all_y_list = np.load(dataset_Y_path)
            np.random.shuffle(all_y_list)
            transform = transforms.Compose([transforms.Resize([res_size, res_size]),
                                            transforms.ToTensor(),
                                            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])])



            selected_frames = {'begin': 1, 'end': 7, 'skip': 1}# data_set = Dataset_CRNN_varlen(data_path, all_X_list, all_y_list, selected_frames, df, transform=transform)
            try:
                data_set = Dataset_CRNN_Log_varlen(data_path, all_X_list, all_y_list, selected_frames,df, transform=transform)
            except:
                continue
            params = {'batch_size': batch_size
                      , 'num_workers': num_workers, 'pin_memory': True
            #           , 'drop_last': True
                      , 'shuffle': True
            #           , 'sampler': sampler
                     } if use_cuda else {}
            train_loader = data.DataLoader(data_set, **params)

            ff = h5py.File(h5_path, mode='w')

            ff.create_dataset("img", (len(data_set),7,3,224,224), dtype=np.float32)
            ff.create_dataset("log", (len(data_set),7,183), dtype=np.float32)
            ff.create_dataset("y", (len(data_set),1), dtype=np.float32)
            ff.create_dataset('path', (len(data_set),1),'S70')
            ff.create_dataset("lengths", (len(data_set),1), dtype=np.float32)
            filname = []
            print('len',len(data_set))
            for batch_idx, (X, X_log, lengths, y, path) in tqdm(enumerate(train_loader)):
            # for batch_idx, (X, lengths, y ) in tqdm(enumerate(train_loader)):
        #             print(time.asctime(time.localtime(time.time())))
                for i in range(batch_size):
                    index = batch_idx*batch_size+i
                    if index >= len(data_set):
                        break
                    ff["img"][index, ...] = X[i].numpy()
                    ff["log"][index, ...] = X_log[i].numpy()
                    ff["y"][index, ...] = y[i].numpy()
            #         print(ff["lengths"][index, ...])
                    ff["lengths"][index, ...] = lengths[i].numpy()
            #         print(ff["lengths"][index, ...])
                    ff["path"][index, ...] = np.expand_dims(path[i].encode("ascii"), axis=0)
            #         filname.append(path[i])

        #                 if index % 1000 == 0:
        #                     print(index,'/',len(data_set))
            ff.close()
            print(h5_path)


# -




# +
# dataset_X_path = "./dataset/CHI_images_users_by_day_55_group1(2)_weekend_testSet_X_fold1.npy"
# dataset_Y_path = "./dataset/CHI_images_users_by_day_55_group3_weekend_testSet_Y_fold2.npy"




# all_X_list = np.load(dataset_X_path)
# all_y_list = np.load(dataset_Y_path)

# +
# pd.DataFrame(all_X_list)[0].apply(lambda x: x[:2]).value_counts()
# -


# Group 1 ->size: 11 users: ['P54', 'P53', 'P52', 'P49', 'P48', 'P43', 'P33', 'P32', 'P26', 'P18', 'P11']
# Group 2 ->size: 11 users: ['P55', 'P50', 'P46', 'P44', 'P42', 'P41', 'P36', 'P35', 'P30', 'P29', 'P10']
# Group 3 ->size: 9 users: ['P51', 'P47', 'P37', 'P28', 'P24', 'P23', 'P19', 'P17', 'P16']
# Group 4 ->size: 5 users: ['P45', 'P40', 'P38', 'P31', 'P25']
#
# group1=['54', '53', '52', '49', '48', '43', '33', '32', '26', '18', '11']
# group2=['55', '50', '46', '44', '42', '41', '36', '35', '30', '29', '10']
# group3=['51', '47', '37', '28', '24', '23', '19', '17', '16']
# group4=['45', '40', '38', '31', '25']
#
# 54    18000
# 53    18000
# 26    18000
# 18    18000
# 48    17000
# 33    16000
# 52    15000
# 49    14000
# 43    14000
# 32    14000
# 11    14000
