#!/usr/bin/env python
# coding: utf-8
# %%

# %%
import os
import numpy as np
import torch
import torchvision.transforms as transforms
import torch.utils.data as data
import matplotlib.pyplot as plt
# from functions import *
from sklearn.preprocessing import OneHotEncoder, LabelEncoder
from sklearn.metrics import accuracy_score,confusion_matrix, classification_report,average_precision_score,recall_score
import pandas as pd
import pickle
# from ALSTM import *
from sklearn.utils import resample


# %%
all_users = ['00']
data_path = "./datasets/frames/raw_frame_U"                
action_name_ = './datasets/targets_U'
frame_slice = './datasets/frame_count_U'
file_name = './datasets/'


from sklearn.model_selection import KFold
import numpy as np
sample_size=100
fold1_trainSet_X = []
fold1_testSet_X = []
fold1_valSet_X = []
fold1_trainSet_Y = []
fold1_testSet_Y = []
fold1_valSet_Y = []
fold2_trainSet_X = []
fold2_testSet_X = []
fold2_valSet_X = []
fold2_trainSet_Y = []
fold2_testSet_Y = []
fold2_valSet_Y = []
fold3_trainSet_X = []
fold3_testSet_X = []
fold3_valSet_X = []
fold3_trainSet_Y = []
fold3_testSet_Y = []
fold3_valSet_Y = []

for user in all_users:
    actions = []
    all_names = []
    all_length = []
    print(user)
    
   
    action_name_path = action_name_ + str(user) + ".pkl"
    frame_slice_file = frame_slice + str(user) + ".pkl"

    data_name_path = data_path + str(user)
    with open(action_name_path, 'rb') as f:
        action_name = pickle.load(f)
    with open(frame_slice_file, 'rb') as f:
        slice_count = pickle.load(f)
    print(data_name_path)

    fnames = os.listdir(data_name_path)
    fnames = np.sort(np.array(fnames))

    for fname in fnames:
        actions.append(action_name[int(fname)-1])
        all_names.append(str(user)+'/'+fname)
        if slice_count[int(fname)-1]<=1:
            print(fname)
        all_length.append(slice_count[int(fname)-1])
    
    all_names = np.array(list(zip(all_names, all_length)))
    actions = np.array(actions)
    
    
    kf = KFold(n_splits=3, random_state=None, shuffle=False)
    
    for i, (train_index, test_index) in enumerate(kf.split(all_names)):
        val_index, test_index = np.array_split(test_index, 2)
#         print('fold', i ,"TRAIN:", train_index, "VAL:", val_index ,"TEST:", test_index)
        X_train, X_val, X_test = all_names[train_index], all_names[val_index], all_names[test_index]
        y_train, y_val, y_test = actions[train_index], actions[val_index], actions[test_index]
        
        nonkill_index = np.where(y_train == 0)
        kill_index = np.where(y_train == 1)
        y_train_nonkill = y_train[nonkill_index]
        y_train_kill = y_train[kill_index]
        X_train_nonkill = X_train[nonkill_index]
        X_train_kill = X_train[kill_index]
        if (len(X_train_nonkill)!=0):
            if (len(X_train_nonkill)<sample_size): 
                X_train_nonkill, y_train_nonkill = resample(X_train_nonkill, y_train_nonkill, #up sample 
                                     replace=True,  
                                     n_samples=sample_size)
            else:
                X_train_nonkill, y_train_nonkill = resample(X_train_nonkill, y_train_nonkill,  # down sample
                                     replace=False,  
                                     n_samples=sample_size)
        if (len(X_train_kill)!=0):
            if (len(X_train_kill)<sample_size): 
                X_train_kill, y_train_kill = resample(X_train_kill, y_train_kill, #up sample 
                                     replace=True,  
                                     n_samples=sample_size)
            else:
                X_train_kill, y_train_kill = resample(X_train_kill, y_train_kill,  # down sample
                                     replace=False,  
                                     n_samples=sample_size)

        X_train = np.concatenate((X_train_nonkill,X_train_kill))
        y_train = np.concatenate((y_train_nonkill,y_train_kill))

#         X_train, y_train = resample(X_train, y_train, random_state=None , n_samples=len(y_train), stratify=y_train, replace=True)
        X_val, y_val = resample(X_val, y_val, random_state=None , n_samples=len(y_val), stratify=y_val)
        X_test, y_test = resample(X_test, y_test, random_state=None , n_samples=len(y_test))
       
            
        if i==0 :
            fold1_trainSet_X.extend(X_train)
            fold1_testSet_X.extend(X_test)
            fold1_valSet_X.extend(X_val)
            fold1_trainSet_Y.extend(y_train)
            fold1_testSet_Y.extend(y_test)
            fold1_valSet_Y.extend(y_val)
        if i==1 :
            fold2_trainSet_X.extend(X_train)
            fold2_testSet_X.extend(X_test)
            fold2_valSet_X.extend(X_val)
            fold2_trainSet_Y.extend(y_train)
            fold2_testSet_Y.extend(y_test)
            fold2_valSet_Y.extend(y_val)
        if i==2 :
            fold3_trainSet_X.extend(X_train)
            fold3_testSet_X.extend(X_test)
            fold3_valSet_X.extend(X_val)
            fold3_trainSet_Y.extend(y_train)
            fold3_testSet_Y.extend(y_test)
            fold3_valSet_Y.extend(y_val)

np.save(file_name+'trainSet_X_fold1.npy', fold1_trainSet_X)
np.save(file_name+'testSet_X_fold1.npy', fold1_testSet_X)
np.save(file_name+'valSet_X_fold1.npy', fold1_valSet_X)
np.save(file_name+'trainSet_Y_fold1.npy', fold1_trainSet_Y)
np.save(file_name+'testSet_Y_fold1.npy', fold1_testSet_Y)
np.save(file_name+'valSet_Y_fold1.npy', fold1_valSet_Y)

# np.save(file_name+'_trainSet_X_fold2.npy', fold2_trainSet_X)
# np.save(file_name+'_testSet_X_fold2.npy', fold2_testSet_X)
# np.save(file_name+'_valSet_X_fold2.npy', fold2_valSet_X)
# np.save(file_name+'_trainSet_Y_fold2.npy', fold2_trainSet_Y)
# np.save(file_name+'_testSet_Y_fold2.npy', fold2_testSet_Y)
# np.save(file_name+'_valSet_Y_fold2.npy', fold2_valSet_Y)

# np.save(file_name+'_trainSet_X_fold3.npy', fold3_trainSet_X)
# np.save(file_name+'_testSet_X_fold3.npy', fold3_testSet_X)
# np.save(file_name+'_valSet_X_fold3.npy', fold3_valSet_X)
# np.save(file_name+'_trainSet_Y_fold3.npy', fold3_trainSet_Y)
# np.save(file_name+'_testSet_Y_fold3.npy', fold3_testSet_Y)
# np.save(file_name+'_valSet_Y_fold3.npy', fold3_valSet_Y)

