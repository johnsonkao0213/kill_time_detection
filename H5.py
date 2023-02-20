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
from utils.functions import *
from utils.ALSTM import *
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




use_cuda = torch.cuda.is_available()   
res_size = 224        # ResNet image size
data_path = "./datasets/frames/raw_frame_U"    # define image RGB data path
begin_frame, end_frame, skip_frame = 1, 7, 1
batch_size = 288
num_workers = 32


csv_path =  './datasets/csv/encoded_test_data.csv'
user = ['U00'] 

df = pd.read_csv(csv_path, index_col="file_name", low_memory=False)
df = df[df['kill_time'].notna()]
df.kill_time = df.kill_time.astype(int)
df = df[df['PID'].isin(user)]
df = df.drop(columns=['PID', 'screen_status', 'record_time','kill_time']) #8 #5



dataset_X_path = "./datasets/valSet_X_fold1.npy"
dataset_Y_path = "./datasets/valSet_Y_fold1.npy"
h5_path = "./datasets/valSet_fold1.h5"



all_X_list = np.load(dataset_X_path)
all_y_list = np.load(dataset_Y_path)
np.random.shuffle(all_y_list)
transform = transforms.Compose([transforms.Resize([res_size, res_size]),
                                transforms.ToTensor(),
                                transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])])



selected_frames = {'begin': 1, 'end': 7, 'skip': 1}# data_set = Dataset_CRNN_varlen(data_path, all_X_list, all_y_list, selected_frames, df, transform=transform)
# try:
data_set = Dataset_CRNN_Log_varlen(data_path, all_X_list, all_y_list, selected_frames,df, transform=transform)
# except:
#     continue
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
    for i in range(batch_size):
        index = batch_idx*batch_size+i
        if index >= len(data_set):
            break
        ff["img"][index, ...] = X[i].numpy()
        ff["log"][index, ...] = X_log[i].numpy()
        ff["y"][index, ...] = y[i].numpy()
        ff["lengths"][index, ...] = lengths[i].numpy()
        ff["path"][index, ...] = np.expand_dims(path[i].encode("ascii"), axis=0)


ff.close()
print(h5_path)

