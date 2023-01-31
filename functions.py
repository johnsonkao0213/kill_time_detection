import os
import numpy as np
from PIL import Image
from torch.utils import data
import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.models as models
import torchvision.transforms as transforms
from tqdm import tqdm
from sklearn.preprocessing import LabelEncoder, MinMaxScaler
from deepctr_torch.inputs import SparseFeat, DenseFeat, get_feature_names, combined_dnn_input
from deepfm import *
from sklearn.metrics import accuracy_score,confusion_matrix, classification_report,average_precision_score,recall_score,f1_score,roc_auc_score
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import h5py
from pprintpp import pprint as pp
#ImageFile.LOAD_TRUNCATED_IMAGES = True

## ------------------- label conversion tools ------------------ ##
def labels2cat(label_encoder, list):
    return label_encoder.transform(list)

def labels2onehot(OneHotEncoder, label_encoder, list):
    return OneHotEncoder.transform(label_encoder.transform(list).reshape(-1, 1)).toarray()

def onehot2labels(label_encoder, y_onehot):
    return label_encoder.inverse_transform(np.where(y_onehot == 1)[1]).tolist()

def cat2labels(label_encoder, y_cat):
    return label_encoder.inverse_transform(y_cat).tolist()

# +
# ## ---------------------- Dataloaders ---------------------- ##
# # for CRNN- varying lengths (frames)
# class Dataset_CRNN_varlen(data.Dataset):
#     "Characterizes a dataset for PyTorch"
#     def __init__(self, data_path, lists, labels, set_frame, transform=None):
#         "Initialization"
#         self.data_path = data_path
#         self.labels = labels
#         self.folders, self.video_len = list(zip(*lists))
#         self.set_frame = set_frame
#         self.transform = transform

#     def __len__(self):
#         "Denotes the total number of samples"
#         return len(self.folders)


#     def __getitem__(self, index):
#         "Generates one sample of data"
#         # select sample
#         selected_folder = self.folders[index]
#         video_len = self.video_len[index]
#         select = np.arange(self.set_frame['begin'], self.set_frame['end'] + 1, self.set_frame['skip'])
#         img_size = self.transform.__dict__['transforms'][0].__dict__['size']       # get image resize from Transformation
#         channels = len(self.transform.__dict__['transforms'][2].__dict__['mean'])  # get number of channels from Transformation
# #         print(np.arange(1, int(float(video_len)) + 1))
# #         print(select)
#         selected_frames = np.intersect1d(np.arange(1, int(float(video_len)) + 1), select) if self.set_frame['begin'] <= int(float(video_len)) else []

#         # Load video frames
#         X_padded = torch.zeros((len(select), channels, img_size[0], img_size[1]))   # input size: (frames, channels, image size x, image size y)

#         img_dir = os.listdir(os.path.join(self.data_path+ selected_folder))
#         img_dir.sort()
#         for i, f in enumerate(selected_frames):
#             frame = Image.open(os.path.join(self.data_path+ selected_folder, img_dir[int(f)-1]))
#             frame = self.transform(frame) if self.transform is not None else frame  # impose transformation if exists
#             X_padded[i, :, :, :] = frame

#         y = torch.LongTensor([self.labels[index]])  # (labels) LongTensor are for int64 instead of FloatTensor
#         video_len = torch.LongTensor([int(float(video_len))])
# #         print(video_len, y)
#         return X_padded, video_len, y
# -

class Dataset_h5_CNN(torch.utils.data.Dataset):
    def __init__(self, in_file, epoch, transform, train = True, filename = False):
        super(Dataset_h5_CNN, self).__init__()
        
        file = h5py.File(in_file, 'r')
        self.transform = transform

        self.filename = filename
        if epoch!=None:
            if train:
                l = int(file["img"].shape[0] / 7)
                self.len = l
                i = epoch % 7
            else:
                l = int(file["img"].shape[0] / 5)
                self.len = l
                i = epoch % 5
        else:
            l = int(file["img"].shape[0])
            self.len = l
            i = 0

            
        self.preload_img = file['img'][i*l:(i+1)*l,...]
#         self.preload_log = file['log'][i*l:(i+1)*l,...]
        self.preload_y = file['y'][i*l:(i+1)*l,...]
        self.preload_length = file['lengths'][i*l:(i+1)*l,...]
        if self.filename:
            self.preload_path = file["path"][i*l:(i+1)*l,...]
        print("Load data from .h5 file...")
    def __getitem__(self, index):
        
        X = torch.tensor(self.preload_img[index][...])
#         log = torch.from_numpy(self.preload_log[index][...])
        y = torch.LongTensor(self.preload_y[index][...])
        length = torch.LongTensor(self.preload_length[index][...])
        if self.filename: 
            path = self.preload_path[index][...][0].decode("ascii")
            return X, length, y, path[-22:-4]
        return X, length, y
#         return X, log, length, y
    
    def __len__(self):
        return self.len


class Dataset_h5(torch.utils.data.Dataset):
    def __init__(self, in_file, epoch, transform, train = True, filename = False):
        super(Dataset_h5, self).__init__()
        
        file = h5py.File(in_file, 'r')
        self.transform = transform
        #self.user = user
        self.filename = filename
        if epoch!=None:
            if train:
                l = int(file["img"].shape[0] / 7)
                self.len = l
                i = epoch % 7
            else:
                l = int(file["img"].shape[0] / 5)
                self.len = l
                i = epoch % 5
        else:
            l = int(file["img"].shape[0])
            self.len = l
            i = 0

            
        self.preload_img = file['img'][i*l:(i+1)*l,...]
        self.preload_log = file['log'][i*l:(i+1)*l,...]
        self.preload_y = file['y'][i*l:(i+1)*l,...]
        self.preload_length = file['lengths'][i*l:(i+1)*l,...]
        if self.filename:
            self.preload_path = file["path"][i*l:(i+1)*l,...]
        print("Load data from .h5 file...")
    def __getitem__(self, index):
        
        X = torch.tensor(self.preload_img[index][...])
        log = torch.from_numpy(self.preload_log[index][...])
        y = torch.LongTensor(self.preload_y[index][...])
        length = torch.LongTensor(self.preload_length[index][...])
        if self.filename: 
            path = self.preload_path[index][...][0].decode("ascii")
#             return X, log, length, y, path[-22:-4]
            return X, log, length, y, path
        return X, log, length, y
    
    def __len__(self):
        return self.len


class Dataset_MLP_h5(torch.utils.data.Dataset):
    def __init__(self, in_file, epoch,filename = False):
        super(Dataset_MLP_h5, self).__init__()
        
        file = h5py.File(in_file, 'r')
        if epoch!=None:
            l = int(file["log"].shape[0] / 3)
            self.len = l
            i = epoch % 3
        else:
            l = int(file["log"].shape[0])
#             print(l)
            self.len = l
            i = 0
        self.filename = filename
        self.preload_log = file['log'][i*l:(i+1)*l,...]
        self.preload_y = file['y'][i*l:(i+1)*l,...]
        self.preload_length = file['lengths'][i*l:(i+1)*l,...]
        if self.filename:
            self.preload_path = file["path"][i*l:(i+1)*l,...]
        print("Load data from .h5 file...")
    def __getitem__(self, index):
        
        log = torch.from_numpy(self.preload_log[index][...])
        length = torch.LongTensor(self.preload_length[index][...])
        y = torch.LongTensor(self.preload_y[index][...])
        if self.filename: 
            path = self.preload_path[index][...][0].decode("ascii")
            return log, length, y, path[-22:-4]
        
        return log, length, y

    def __len__(self):
        return self.len


class Dataset_CRNN_Log_varlen(data.Dataset):
    "Characterizes a dataset for PyTorch"
    def __init__(self, data_path, lists, labels, set_frame, df, transform=None):
        "Initialization"
        self.data_path = data_path
        self.labels = labels
        self.folders, self.video_len = list(zip(*lists))
        self.set_frame = set_frame
        self.transform = transform
        self.df = df
        self.sparse_features = ['battery_charging_state',
                                'network_type', 'is_mobile_available', 'is_mobile_connected',
       'is_network_available', 'is_wifi_available', 'is_wifi_connected',
       'transportation_mode', 'Weekday Name', 'eating_or_not', 'hour', 'weekend', 
        'traffic_move','audio_mode', 'fg_app_category', 
        'ringer_mode', 'is_connected', 'is_charging', 'orientation','call_state','fg_app']

        self.dense_features = ['strm_vol_music', 'strm_vol_noti', 'strm_vol_ring',
        'strm_vol_sys', 'strm_vol_voicecall','battery_percentage','TYPE_VIEW_FOCUSED_600',
       'TYPE_VIEW_HOVER_ENTER_600', 'TYPE_VIEW_CLICKED_600',
       'TYPE_VIEW_LONG_CLICKED_600', 'TYPE_VIEW_SCROLLED_600',
       'TYPE_VIEW_SELECTED_600', 'TYPE_VIEW_TEXT_CHANGED_600', 'TYPE_VIEW_FOCUSED_900',
       'TYPE_VIEW_HOVER_ENTER_900', 'TYPE_VIEW_CLICKED_900',
       'TYPE_VIEW_LONG_CLICKED_900', 'TYPE_VIEW_SCROLLED_900',
       'TYPE_VIEW_SELECTED_900', 'TYPE_VIEW_TEXT_CHANGED_900',
       'TYPE_VIEW_FOCUSED_1800', 'TYPE_VIEW_HOVER_ENTER_1800',
       'TYPE_VIEW_CLICKED_1800', 'TYPE_VIEW_LONG_CLICKED_1800',
       'TYPE_VIEW_SCROLLED_1800', 'TYPE_VIEW_SELECTED_1800',
       'TYPE_VIEW_TEXT_CHANGED_1800', 'TYPE_VIEW_FOCUSED_3600',
       'TYPE_VIEW_HOVER_ENTER_3600', 'TYPE_VIEW_CLICKED_3600',
       'TYPE_VIEW_LONG_CLICKED_3600', 'TYPE_VIEW_SCROLLED_3600',
       'TYPE_VIEW_SELECTED_3600', 'TYPE_VIEW_TEXT_CHANGED_3600',         
       'ACTION_SCREEN_ON_180', 'ACTION_SCREEN_ON_300', 'ACTION_SCREEN_ON_600',
       'ACTION_SCREEN_ON_900', 'ACTION_SCREEN_ON_1800', 'ACTION_SCREEN_ON_3600',
       'TYPE_VIEW_HOVER_ENTER_30', 'TYPE_VIEW_CLICKED_30',
       'TYPE_VIEW_LONG_CLICKED_30', 'TYPE_VIEW_SCROLLED_30',
       'TYPE_VIEW_SELECTED_30', 'TYPE_VIEW_TEXT_CHANGED_30','TYPE_VIEW_FOCUSED_30', 
        'TYPE_VIEW_FOCUSED_60', 'TYPE_VIEW_HOVER_ENTER_60',
       'TYPE_VIEW_CLICKED_60', 'TYPE_VIEW_LONG_CLICKED_60',
       'TYPE_VIEW_SCROLLED_60', 'TYPE_VIEW_SELECTED_60',
       'TYPE_VIEW_TEXT_CHANGED_60','TYPE_VIEW_FOCUSED_180',
       'TYPE_VIEW_HOVER_ENTER_180', 'TYPE_VIEW_CLICKED_180',
       'TYPE_VIEW_LONG_CLICKED_180', 'TYPE_VIEW_SCROLLED_180',
       'TYPE_VIEW_SELECTED_180', 'TYPE_VIEW_TEXT_CHANGED_180',
       'TYPE_VIEW_FOCUSED_300', 'TYPE_VIEW_HOVER_ENTER_300',
       'TYPE_VIEW_CLICKED_300', 'TYPE_VIEW_LONG_CLICKED_300',
       'TYPE_VIEW_SCROLLED_300', 'TYPE_VIEW_SELECTED_300',
       'TYPE_VIEW_TEXT_CHANGED_300',
       'cnt_screen_on'                       ,'freq_screen_on'                      ,'sum_screen_time'                     ,'avg_screen_time'                                     ,'max_screen_time'                     ,'min_screen_time'                     ,'med_screen_time'                                                   ,'cnt_FOCUSED'                         ,'freq_FOCUSED'                                                            ,'cnt_HOVER_ENTER'                     ,'freq_HOVER_ENTER'                         ,'cnt_CLICKED'                         ,'freq_CLICKED'                                ,'cnt_LONG_CLICKED'                    ,'freq_LONG_CLICKED'                         ,'cnt_SCROLLED'                        ,'freq_SCROLLED'                               ,'cnt_SELECTED'                        ,'freq_SELECTED'                           ,'cnt_TEXT_CHANGED'                    ,'freq_TEXT_CHANGED'                      ,'avg_vol_music'                       ,'std_vol_music'                       ,'max_vol_music'                       ,'min_vol_music'                       ,'med_vol_music'                       ,'is_adjusted_vol_music'               ,'avg_vol_noti'                        ,'std_vol_noti'                        ,'max_vol_noti'                        ,'min_vol_noti'                        ,'med_vol_noti'                        ,'is_adjusted_vol_noti'                ,'avg_vol_ring'                        ,'std_vol_ring'                        ,'max_vol_ring'                        ,'min_vol_ring'                        ,'med_vol_ring'                        ,'is_adjusted_vol_ring'                ,'avg_vol_sys'                         ,'std_vol_sys'                         ,'max_vol_sys'                         ,'min_vol_sys'                         ,'med_vol_sys'                         ,'is_adjusted_vol_sys'                 ,'avg_vol_voicecall'                   ,'std_vol_voicecall'                   ,'max_vol_voicecall'                   ,'min_vol_voicecall'                   ,'med_vol_voicecall'                   ,'is_adjusted_vol_voicecall'           ,'avg_battery'                         ,'std_battery'                         ,'max_battery'                         ,'min_battery'                         ,'med_battery'                         ,'num_charging'                        ,'sum_charging_time'                   ,'dur_network_mobile'                  ,'dur_network_wifi'                    ,'dur_network_no_connection'           ,'dur_trans_in_vehicle'                ,'dur_trans_on_bicycle'                ,'dur_trans_on_foot'                   ,'dur_trans_static'                    ,'is_moving'                           ,'dur_audio_InCall'                    ,'dur_audio_InCommunicaiton'           ,'dur_audio_Normal'                    ,'dur_audio_Ringtone'                  ,'num_call'                            ,'dur_ringer_Normal'                   ,'dur_ringer_Silent'                   ,'dur_ringer_Vibrate'                  ,'is_adjusted_ringer'                  ,'num_switch_apps'                     ,'freq_switch_apps'                    ,'num_used_apps'                       ,'dur_Launcher'                        ,'dur_IM'                              ,'dur_SOCIAL'                          ,'dur_VIDEO_PLAYERS'                   ,'dur_EVENTS'                          ,'dur_BROWSER'                         ,'dur_SYSTEM'                          ,'dur_SHOPPING'                        ,'dur_BUSINESS'                        ,'dur_GAME'                            ,'dur_TOOLS'                           ,'dur_PHOTOGRAPHY'                     ,'dur_PHONE_and_SMS'                   ,'dur_Stock'                           ,'dur_MAPS_AND_NAVIGATION'             ,'dur_OTHERS'                                     ]
        
        for feat in self.sparse_features:
            lbe = LabelEncoder()
            self.df[feat] = lbe.fit_transform(self.df[feat])
           
        self.df.replace([np.inf, -np.inf], np.nan, inplace=True)
        self.df[self.dense_features] = self.df[self.dense_features].fillna(0)
        
        mms = MinMaxScaler(feature_range=(0, 1))
        self.df[self.dense_features] = mms.fit_transform(self.df[self.dense_features])
        
        self.df = self.df[self.sparse_features+self.dense_features]
#         print(self.df.info())
    def __len__(self):
        "Denotes the total number of samples"
        return len(self.folders)


    def __getitem__(self, index):
        "Generates one sample of data"
        # Select sample
        selected_folder = self.folders[index]
        video_len = self.video_len[index]
        select = np.arange(self.set_frame['begin'], self.set_frame['end'] + 1, self.set_frame['skip'])
        img_size = self.transform.__dict__['transforms'][0].__dict__['size']       # get image resize from Transformation
        feature_size = len(self.dense_features + self.sparse_features)
        selected_frames = np.intersect1d(np.arange(1, int(float(video_len)) + 1), select) if self.set_frame['begin'] <= int(float(video_len)) else []
        channels = len(self.transform.__dict__['transforms'][2].__dict__['mean'])  # get number of channels from Transformation

        # Load video frames
        Log_padded = torch.zeros((len(select), feature_size))   # input size: (frames, channels, image size x, image size y)
        X_padded = torch.zeros((len(select), channels, img_size[0], img_size[1]))   # input size: (frames, channels, image size x, image size y)

        img_dir = os.listdir(os.path.join(self.data_path+ selected_folder))
        img_dir.sort()
#         users = []
        for i, f in enumerate(selected_frames):
            try:
                frame = Image.open(os.path.join(self.data_path+ selected_folder, img_dir[int(f)-1]))
                user = os.path.join(self.data_path+ selected_folder, img_dir[int(f)-1])
#                 users.append(user)
            except:
                break
            frame = self.transform(frame) if self.transform is not None else frame  # impose transformation if exists
            X_padded[i, :, :, :] = frame
            idx = img_dir[int(f)-1].split('.')[0]
            try:
#                 pd.set_option('display.max_rows', None)
#                 print(self.df.loc[idx])
                Log_padded[i, :] = torch.from_numpy(self.df.loc[idx].values.astype('float32'))
                
            except:
                pass
        y = torch.LongTensor([self.labels[index]])                  # (labels) LongTensor are for int64 instead of FloatTensor

        video_len = torch.LongTensor([int(float(video_len))])

        return X_padded, Log_padded, video_len, y, user


class Dataset_Log_varlen(data.Dataset):
    def __init__(self, data_path, lists, labels, set_frame, df, transform=None):
        self.data_path = data_path
        self.labels = labels
        self.folders, self.video_len = list(zip(*lists))
        self.set_frame = set_frame
        self.transform = transform
        self.df = df
        self.sparse_features = ['battery_charging_state',
                                'network_type', 'is_mobile_available', 'is_mobile_connected',
       'is_network_available', 'is_wifi_available', 'is_wifi_connected',
       'transportation_mode', 'Weekday Name', 'eating_or_not', 'hour', 'weekend', 
        'traffic_move','audio_mode', 'fg_app_category', 
        'ringer_mode', 'is_connected', 'is_charging', 'orientation','call_state','fg_app']

        self.dense_features = ['strm_vol_music', 'strm_vol_noti', 'strm_vol_ring',
        'strm_vol_sys', 'strm_vol_voicecall','battery_percentage','TYPE_VIEW_FOCUSED_600',
       'TYPE_VIEW_HOVER_ENTER_600', 'TYPE_VIEW_CLICKED_600',
       'TYPE_VIEW_LONG_CLICKED_600', 'TYPE_VIEW_SCROLLED_600',
       'TYPE_VIEW_SELECTED_600', 'TYPE_VIEW_TEXT_CHANGED_600', 'TYPE_VIEW_FOCUSED_900',
       'TYPE_VIEW_HOVER_ENTER_900', 'TYPE_VIEW_CLICKED_900',
       'TYPE_VIEW_LONG_CLICKED_900', 'TYPE_VIEW_SCROLLED_900',
       'TYPE_VIEW_SELECTED_900', 'TYPE_VIEW_TEXT_CHANGED_900',
       'TYPE_VIEW_FOCUSED_1800', 'TYPE_VIEW_HOVER_ENTER_1800',
       'TYPE_VIEW_CLICKED_1800', 'TYPE_VIEW_LONG_CLICKED_1800',
       'TYPE_VIEW_SCROLLED_1800', 'TYPE_VIEW_SELECTED_1800',
       'TYPE_VIEW_TEXT_CHANGED_1800', 'TYPE_VIEW_FOCUSED_3600',
       'TYPE_VIEW_HOVER_ENTER_3600', 'TYPE_VIEW_CLICKED_3600',
       'TYPE_VIEW_LONG_CLICKED_3600', 'TYPE_VIEW_SCROLLED_3600',
       'TYPE_VIEW_SELECTED_3600', 'TYPE_VIEW_TEXT_CHANGED_3600',         
       'ACTION_SCREEN_ON_180', 'ACTION_SCREEN_ON_300', 'ACTION_SCREEN_ON_600',
       'ACTION_SCREEN_ON_900', 'ACTION_SCREEN_ON_1800', 'ACTION_SCREEN_ON_3600',
       'TYPE_VIEW_HOVER_ENTER_30', 'TYPE_VIEW_CLICKED_30',
       'TYPE_VIEW_LONG_CLICKED_30', 'TYPE_VIEW_SCROLLED_30',
       'TYPE_VIEW_SELECTED_30', 'TYPE_VIEW_TEXT_CHANGED_30','TYPE_VIEW_FOCUSED_30', 
        'TYPE_VIEW_FOCUSED_60', 'TYPE_VIEW_HOVER_ENTER_60',
       'TYPE_VIEW_CLICKED_60', 'TYPE_VIEW_LONG_CLICKED_60',
       'TYPE_VIEW_SCROLLED_60', 'TYPE_VIEW_SELECTED_60',
       'TYPE_VIEW_TEXT_CHANGED_60','TYPE_VIEW_FOCUSED_180',
       'TYPE_VIEW_HOVER_ENTER_180', 'TYPE_VIEW_CLICKED_180',
       'TYPE_VIEW_LONG_CLICKED_180', 'TYPE_VIEW_SCROLLED_180',
       'TYPE_VIEW_SELECTED_180', 'TYPE_VIEW_TEXT_CHANGED_180',
       'TYPE_VIEW_FOCUSED_300', 'TYPE_VIEW_HOVER_ENTER_300',
       'TYPE_VIEW_CLICKED_300', 'TYPE_VIEW_LONG_CLICKED_300',
       'TYPE_VIEW_SCROLLED_300', 'TYPE_VIEW_SELECTED_300',
       'TYPE_VIEW_TEXT_CHANGED_300',
       'cnt_screen_on'                       ,'freq_screen_on'                      ,'sum_screen_time'                     ,'avg_screen_time'                                     ,'max_screen_time'                     ,'min_screen_time'                     ,'med_screen_time'                                                   ,'cnt_FOCUSED'                         ,'freq_FOCUSED'                                                            ,'cnt_HOVER_ENTER'                     ,'freq_HOVER_ENTER'                         ,'cnt_CLICKED'                         ,'freq_CLICKED'                                ,'cnt_LONG_CLICKED'                    ,'freq_LONG_CLICKED'                         ,'cnt_SCROLLED'                        ,'freq_SCROLLED'                               ,'cnt_SELECTED'                        ,'freq_SELECTED'                           ,'cnt_TEXT_CHANGED'                    ,'freq_TEXT_CHANGED'                      ,'avg_vol_music'                       ,'std_vol_music'                       ,'max_vol_music'                       ,'min_vol_music'                       ,'med_vol_music'                       ,'is_adjusted_vol_music'               ,'avg_vol_noti'                        ,'std_vol_noti'                        ,'max_vol_noti'                        ,'min_vol_noti'                        ,'med_vol_noti'                        ,'is_adjusted_vol_noti'                ,'avg_vol_ring'                        ,'std_vol_ring'                        ,'max_vol_ring'                        ,'min_vol_ring'                        ,'med_vol_ring'                        ,'is_adjusted_vol_ring'                ,'avg_vol_sys'                         ,'std_vol_sys'                         ,'max_vol_sys'                         ,'min_vol_sys'                         ,'med_vol_sys'                         ,'is_adjusted_vol_sys'                 ,'avg_vol_voicecall'                   ,'std_vol_voicecall'                   ,'max_vol_voicecall'                   ,'min_vol_voicecall'                   ,'med_vol_voicecall'                   ,'is_adjusted_vol_voicecall'           ,'avg_battery'                         ,'std_battery'                         ,'max_battery'                         ,'min_battery'                         ,'med_battery'                         ,'num_charging'                        ,'sum_charging_time'                   ,'dur_network_mobile'                  ,'dur_network_wifi'                    ,'dur_network_no_connection'           ,'dur_trans_in_vehicle'                ,'dur_trans_on_bicycle'                ,'dur_trans_on_foot'                   ,'dur_trans_static'                    ,'is_moving'                           ,'dur_audio_InCall'                    ,'dur_audio_InCommunicaiton'           ,'dur_audio_Normal'                    ,'dur_audio_Ringtone'                  ,'num_call'                            ,'dur_ringer_Normal'                   ,'dur_ringer_Silent'                   ,'dur_ringer_Vibrate'                  ,'is_adjusted_ringer'                  ,'num_switch_apps'                     ,'freq_switch_apps'                    ,'num_used_apps'                       ,'dur_Launcher'                        ,'dur_IM'                              ,'dur_SOCIAL'                          ,'dur_VIDEO_PLAYERS'                   ,'dur_EVENTS'                          ,'dur_BROWSER'                         ,'dur_SYSTEM'                          ,'dur_SHOPPING'                        ,'dur_BUSINESS'                        ,'dur_GAME'                            ,'dur_TOOLS'                           ,'dur_PHOTOGRAPHY'                     ,'dur_PHONE_and_SMS'                   ,'dur_Stock'                           ,'dur_MAPS_AND_NAVIGATION'             ,'dur_OTHERS'                             ]
        
        for feat in self.sparse_features:
            lbe = LabelEncoder()
            self.df[feat] = lbe.fit_transform(self.df[feat])
            
        self.df.replace([np.inf, -np.inf], np.nan, inplace=True)
        self.df[self.dense_features] = self.df[self.dense_features].fillna(0)
        mms = MinMaxScaler(feature_range=(0, 1))
        self.df[self.dense_features] = mms.fit_transform(self.df[self.dense_features])
        
        self.df = self.df[self.sparse_features+self.dense_features]

    def __len__(self):
        "Denotes the total number of samples"
        return len(self.folders)


    def __getitem__(self, index):
        "Generates one sample of data"
        # Select sample
        selected_folder = self.folders[index]
        video_len = self.video_len[index]
        select = np.arange(self.set_frame['begin'], self.set_frame['end'] + 1, self.set_frame['skip'])
        feature_size = len(self.dense_features + self.sparse_features)
        selected_frames = np.intersect1d(np.arange(1, int(float(video_len)) + 1), select) if self.set_frame['begin'] <= int(float(video_len)) else []


        # Load video frames
        Log_padded = torch.zeros((len(select), feature_size))   # input size: (frames, channels, image size x, image size y)

        img_dir = os.listdir(os.path.join(self.data_path+ selected_folder))
        img_dir.sort()
        user = None
        for i, f in enumerate(selected_frames):
            
            try:
                idx = img_dir[i].split('.')[0]
                Log_padded[i, :] = torch.from_numpy(self.df.loc[idx].values.astype('float32'))
            except:
                pass
        y = torch.LongTensor([self.labels[index]])                  # (labels) LongTensor are for int64 instead of FloatTensor

        video_len = torch.LongTensor([int(float(video_len))])

        return Log_padded, video_len, y






# +
## -------------------- (reload) model prediction ---------------------- ##
# def CRNN_final_prediction(model, device, loader):
#     cnn_encoder, rnn_decoder = model
#     cnn_encoder.eval()
#     rnn_decoder.eval()

#     all_y_pred = []
#     with torch.no_grad():
#         for batch_idx, (X, y) in enumerate(tqdm(loader)):
#             # distribute data to device
#             X = X.to(device)
#             output = rnn_decoder(cnn_encoder(X))
#             y_pred = output.max(1, keepdim=True)[1]  # location of max log-probability as prediction
#             all_y_pred.extend(y_pred.cpu().data.squeeze().numpy().tolist())

#     return all_y_pred
# -

# # -------------------- end of model prediction ---------------------- ##



# # ------------------------ CRNN module ---------------------- ##

def conv2D_output_size(img_size, padding, kernel_size, stride):
    # compute output shape of conv2D
    outshape = (np.floor((img_size[0] + 2 * padding[0] - (kernel_size[0] - 1) - 1) / stride[0] + 1).astype(int),
                np.floor((img_size[1] + 2 * padding[1] - (kernel_size[1] - 1) - 1) / stride[1] + 1).astype(int))
    return outshape


# 2D CNN encoder train from scratch (no transfer learning)
class EncoderCNN(nn.Module):
    def __init__(self, img_x=90, img_y=120, fc_hidden1=512, fc_hidden2=512, drop_p=0.3, CNN_embed_dim=300):
        super(EncoderCNN, self).__init__()

        self.img_x = img_x
        self.img_y = img_y
        self.CNN_embed_dim = CNN_embed_dim

        # CNN architechtures
        self.ch1, self.ch2, self.ch3, self.ch4 = 32, 64, 128, 256
        self.k1, self.k2, self.k3, self.k4 = (5, 5), (3, 3), (3, 3), (3, 3)      # 2d kernal size
        self.s1, self.s2, self.s3, self.s4 = (2, 2), (2, 2), (2, 2), (2, 2)      # 2d strides
        self.pd1, self.pd2, self.pd3, self.pd4 = (0, 0), (0, 0), (0, 0), (0, 0)  # 2d padding

        # conv2D output shapes
        self.conv1_outshape = conv2D_output_size((self.img_x, self.img_y), self.pd1, self.k1, self.s1)  # Conv1 output shape
        self.conv2_outshape = conv2D_output_size(self.conv1_outshape, self.pd2, self.k2, self.s2)
        self.conv3_outshape = conv2D_output_size(self.conv2_outshape, self.pd3, self.k3, self.s3)
        self.conv4_outshape = conv2D_output_size(self.conv3_outshape, self.pd4, self.k4, self.s4)

        # fully connected layer hidden nodes
        self.fc_hidden1, self.fc_hidden2 = fc_hidden1, fc_hidden2
        self.drop_p = drop_p

        self.conv1 = nn.Sequential(
            nn.Conv2d(in_channels=3, out_channels=self.ch1, kernel_size=self.k1, stride=self.s1, padding=self.pd1),
            nn.BatchNorm2d(self.ch1, momentum=0.01),
            nn.ReLU(inplace=True),                      
            # nn.MaxPool2d(kernel_size=2),
        )
        self.conv2 = nn.Sequential(
            nn.Conv2d(in_channels=self.ch1, out_channels=self.ch2, kernel_size=self.k2, stride=self.s2, padding=self.pd2),
            nn.BatchNorm2d(self.ch2, momentum=0.01),
            nn.ReLU(inplace=True),
            # nn.MaxPool2d(kernel_size=2),
        )

        self.conv3 = nn.Sequential(
            nn.Conv2d(in_channels=self.ch2, out_channels=self.ch3, kernel_size=self.k3, stride=self.s3, padding=self.pd3),
            nn.BatchNorm2d(self.ch3, momentum=0.01),
            nn.ReLU(inplace=True),
            # nn.MaxPool2d(kernel_size=2),
        )

        self.conv4 = nn.Sequential(
            nn.Conv2d(in_channels=self.ch3, out_channels=self.ch4, kernel_size=self.k4, stride=self.s4, padding=self.pd4),
            nn.BatchNorm2d(self.ch4, momentum=0.01),
            nn.ReLU(inplace=True),
            # nn.MaxPool2d(kernel_size=2),
        )

        self.drop = nn.Dropout2d(self.drop_p)
        self.pool = nn.MaxPool2d(2)
        self.fc1 = nn.Linear(self.ch4 * self.conv4_outshape[0] * self.conv4_outshape[1], self.fc_hidden1)   # fully connected layer, output k classes
        self.fc2 = nn.Linear(self.fc_hidden1, self.fc_hidden2)
        self.fc3 = nn.Linear(self.fc_hidden2, self.CNN_embed_dim)   # output = CNN embedding latent variables

    def forward(self, x_3d):
        cnn_embed_seq = []
        for t in range(x_3d.size(1)):
            # CNNs
            x = self.conv1(x_3d[:, t, :, :, :])
            x = self.conv2(x)
            x = self.conv3(x)
            x = self.conv4(x)
            x = x.view(x.size(0), -1)           # flatten the output of conv

            # FC layers
            x = F.relu(self.fc1(x))
            y = x
            # x = F.dropout(x, p=self.drop_p, training=self.training)
            x = F.relu(self.fc2(x))
            x = F.dropout(x, p=self.drop_p, training=self.training)
            x = self.fc3(x)
            cnn_embed_seq.append(x)

        # swap time and sample dim such that (sample dim, time dim, CNN latent dim)
        cnn_embed_seq = torch.stack(cnn_embed_seq, dim=0).transpose_(0, 1)
        # cnn_embed_seq: shape=(batch, time_step, input_size)
        
        return cnn_embed_seq, y


# 2D CNN encoder using ResNet-152 pretrained
class ResCNNEncoder(nn.Module):
    def __init__(self, fc_hidden1=512, fc_hidden2=512, drop_p=0.3, CNN_embed_dim=300):
        """Load the pretrained ResNet-152 and replace top fc layer."""
        super(ResCNNEncoder, self).__init__()

        self.fc_hidden1, self.fc_hidden2 = fc_hidden1, fc_hidden2
        self.drop_p = drop_p

        resnet = models.resnet101(pretrained=True)
        modules = list(resnet.children())[:-1]      # delete the last fc layer.
        self.resnet = nn.Sequential(*modules)
#         self.fc1 = nn.Linear(resnet.fc.in_features, fc_hidden1)
#         self.bn1 = nn.BatchNorm1d(fc_hidden1, momentum=0.01)
#         self.fc2 = nn.Linear(fc_hidden1, fc_hidden2)
#         self.bn2 = nn.BatchNorm1d(fc_hidden2, momentum=0.01)
#         self.fc3 = nn.Linear(fc_hidden2, CNN_embed_dim)
        self.fc4 = nn.Linear(resnet.fc.in_features, CNN_embed_dim)
    def forward(self, x_3d):
        cnn_embed_seq = []
        #print(x_3d.size(1))
        for t in range(x_3d.size(1)):
            # ResNet CNN
#             with torch.no_grad():
            #print(x_3d[:, t, :, :, :].shape)
            x = self.resnet(x_3d[:, t, :, :, :])  # ResNet
            x = x.view(x.size(0), -1)             # flatten output of conv

            # FC layers
#             x = self.bn1(self.fc1(x))
#             x = F.relu(x)
#             x = self.bn2(self.fc2(x))
#             x = F.relu(x)
#             x = F.dropout(x, p=self.drop_p, training=self.training)
#             x = self.fc3(x)
            x = self.fc4(x)
            cnn_embed_seq.append(x)

        # swap time and sample dim such that (sample dim, time dim, CNN latent dim)
        cnn_embed_seq = torch.stack(cnn_embed_seq, dim=0).transpose_(0, 1)
        # cnn_embed_seq: shape=(batch, time_step, input_size)
        
        return cnn_embed_seq


class DecoderRNN_varlen(nn.Module):
    def __init__(self, CNN_embed_dim=300, h_RNN_layers=3, h_RNN=256, h_FC_dim=128, drop_p=0.3, num_classes=50,feature=False):
        super(DecoderRNN_varlen, self).__init__()

        self.RNN_input_size = CNN_embed_dim
        self.h_RNN_layers = h_RNN_layers   # RNN hidden layers
        self.h_RNN = h_RNN                 # RNN hidden nodes
        self.h_FC_dim = h_FC_dim
        self.drop_p = drop_p
        self.num_classes = num_classes
        self.feature = feature
        self.LSTM = nn.LSTM(
            input_size=self.RNN_input_size,
            hidden_size=self.h_RNN,        
            num_layers=h_RNN_layers,
            dropout = drop_p,
            batch_first=True,       # input & output will has batch size as 1s dimension. e.g. (batch, time_step, input_size)
        )

        self.fc1 = nn.Linear(self.h_RNN, self.h_FC_dim)
        self.fc2 = nn.Linear(self.h_FC_dim, self.num_classes)

    def forward(self, x_RNN, x_lengths):        
        N, T, n = x_RNN.size()
        #print('x_RNN.size:', x_RNN.shape, 'x_lengths:', x_lengths)
        #print('x_RNN.size:', x_RNN.shape, 'x_lengths:', x_lengths)
# range
        #for i in range(N):
        #    if x_lengths[i] < T:
                #tmp = x_RNN[i, :x_lengths[i], :]
                #print(tmp.shape)
                #print(x_RNN.shape)
                #x_RNN[i, :, :] = torch.cat((tmp, torch.zeros(T - x_lengths[i], n, dtype=torch.float, device=x_RNN.device)),1)
                #print(x_RNN.shape)
                #x_RNN[i, x_lengths[i]:, :] = torch.zeros(T - x_lengths[i], n, dtype=torch.float, device=x_RNN.device)
        #print("pass")
        x_lengths[x_lengths > T] = T
        #x_lengths[x_lengths <= 0] = 1
        lengths_ordered, perm_idx = x_lengths.sort(0, descending=True)
        #print(lengths_ordered)
        #lengths_ordered = torch.LongTensor(lengths_ordered)
        # use input of descending length
#         try:
        packed_x_RNN = torch.nn.utils.rnn.pack_padded_sequence(x_RNN[perm_idx], lengths_ordered.cpu(), batch_first=True)
#         if self.feature:
#             print(packed_x_RNN.data)
#             return packed_x_RNN.data, 0
    #         except:
#             lengths_ordered = 0
#             packed_x_RNN = torch.nn.utils.rnn.pack_padded_sequence(x_RNN[perm_idx], lengths_ordered.cpu(), batch_first=True)
        self.LSTM.flatten_parameters()
        packed_RNN_out, (h_n_sorted, h_c_sorted) = self.LSTM(packed_x_RNN, None)
        """ h_n shape (n_layers, batch, hidden_size), h_c shape (n_layers, batch, hidden_size) """ 
        """ None represents zero initial hidden state. RNN_out has shape=(batch, time_step, output_size) """

        RNN_out, out_lengths = torch.nn.utils.rnn.pad_packed_sequence(packed_RNN_out, batch_first=True)
        #RNN_out, _ = torch.nn.utils.rnn.pad_packed_sequence(packed_RNN_out, batch_first=True)
        RNN_out = RNN_out.contiguous()
        # RNN_out = RNN_out.view(-1, RNN_out.size(2))
        last_out = []
        for i, length in enumerate(out_lengths):
            last_out.append(RNN_out[i][length - 1])
        last_out = torch.stack(last_out)
        # reverse back to original sequence order
        _, unperm_idx = perm_idx.sort(0)
        RNN_out = last_out[unperm_idx]
        #RNN_out = RNN_out[unperm_idx]
#         if self.feature:
#             return RNN_out[:, -1, :]
        # FC layers
        x = self.fc1(RNN_out)
        #x = self.fc1(RNN_out[:, -1, :])   # choose RNN_out at the last time step
        y = x
        x = F.relu(x)
        x = F.dropout(x, p=self.drop_p, training=self.training)
        x = self.fc2(x)
        if self.feature:
            return y
        #return RNN_out[:, -1, :]
        return x


class ResCNN(nn.Module):
    def __init__(self, fc_hidden1=512, fc_hidden2=512, drop_p=0.3, CNN_embed_dim=300):
        """Load the pretrained ResNet-152 and replace top fc layer."""
        super(ResCNN, self).__init__()

        self.fc_hidden1, self.fc_hidden2 = fc_hidden1, fc_hidden2
        self.drop_p = drop_p

        resnet = models.resnet101(pretrained=True)
        modules = list(resnet.children())[:-1]      # delete the last fc layer.
        self.resnet = nn.Sequential(*modules)
        self.fc1 = nn.Linear(resnet.fc.in_features, fc_hidden1)
        self.bn1 = nn.BatchNorm1d(fc_hidden1, momentum=0.01)
        self.fc2 = nn.Linear(fc_hidden1, fc_hidden2)
        self.bn2 = nn.BatchNorm1d(fc_hidden2, momentum=0.01)
        self.fc3 = nn.Linear(fc_hidden2, CNN_embed_dim)
#         self.fc4 = nn.Linear(resnet.fc.in_features, CNN_embed_dim)
    def forward(self, x_3d):

        # ResNet CNN
        with torch.no_grad():
            x = self.resnet(x_3d[:, -1, :, :, :])  # ResNet
            x = x.view(x.size(0), -1)             # flatten output of conv

        # FC layers
        x = self.bn1(self.fc1(x))
        x = F.relu(x)
        x = self.bn2(self.fc2(x))
        x = F.relu(x)
        x = F.dropout(x, p=self.drop_p, training=self.training)
        x = self.fc3(x)
#         x = self.fc4(x)


        
        return x

# # ---------------------- end of CRNN module ---------------------- ##



# # -------------------- Fusion ---------------------- ##

# +
class combineEncoder(nn.Module):
    def __init__(self, cnn_encoder, rnn_decoder, mlp, drop_p, num_classes):
        super().__init__()
        

        self.drop_p = drop_p
        self.num_classes = num_classes
        self.cnn_encoder = cnn_encoder
        self.rnn_decoder = rnn_decoder
        self.mlp = mlp
        
        self.mlp_features_projection = nn.Linear(256, 128) #hidden_layer[-1]

#         self.fc_MLP = nn.Linear(512, 256)
        self.fc1 = nn.Linear(256*4, 256) #256
        self.fc2 = nn.Linear(256, self.num_classes)
        self.fc3 = nn.Linear(512, 1) #256
        self.fc4 = nn.Linear(256, 1)
        self.neck = nn.Sequential(nn.BatchNorm1d(256*4),
                                    nn.Linear(256*4, 256*4),
                                    nn.BatchNorm1d(256*4),  
                                )
        self.bn1 = nn.BatchNorm1d(256)
        self.bn2 = nn.BatchNorm1d(256)


    def forward(self, x, x_log, x_lengths):
        
        cnn_embed_seq = self.cnn_encoder(x)
        N, T, n = cnn_embed_seq.size()
        
        for i in range(N):
            if x_lengths[i] < T:
                cnn_embed_seq[i, x_lengths[i]:, :] = torch.zeros(T - x_lengths[i], n, dtype=torch.float, device=cnn_embed_seq.device)
        
        img_embed = self.rnn_decoder(cnn_embed_seq, x_lengths) #batch_size*256
        #img_embed2 = self.mlp_features_projection(img_embed)
        RNN_out = self.mlp(x_log, x_lengths) #batch_size*128
#         RNN_out = self.fc_MLP(RNN_out)
        #attention_input = torch.cat((RNN_out, img_embed), 1)
        #attention_score = self.fc3(attention_input)
        #attention_score = F.softmax(self.fc4(attention_score), dim=-1)
        #mlp_rnn_out = self.fc3(RNN_out)
        #img_embed = self.bn1(img_embed)
        #RNN_out = self.bn2(RNN_out)
        #print(img_embed.shape)
        img_embed_s = img_embed.unsqueeze(1)
        #print(img_embed_s.shape)
        #print(RNN_out.shape)
        RNN_out_s = RNN_out.unsqueeze(2) 
        #print(RNN_out_s.shape)
        atten_weight = torch.bmm(img_embed_s, RNN_out_s).squeeze(-1)
        atten_weight = torch.sigmoid(atten_weight).repeat(1, 256)
        #img_atten_weight = F.softmax(img_embed, dim=-1) # shape: (batch, 128)
        #mlp_atten_weight = F.softmax(RNN_out, dim=-1)
        img_attn_feat = img_embed + img_embed * atten_weight
        mlp_attn_feat = atten_weight * RNN_out + RNN_out
        #print(img_attn_feat.shape)
        #print(mlp_attn_feat.shape)
        #mlp_attn_feat = img_atten_weight * RNN_out + RNN_out
        #img_attn_feat = mlp_atten_weight * img_embed + img_embed
        
        fused_embedding = torch.cat((img_attn_feat, mlp_attn_feat, RNN_out, img_embed), 1)
        #fused_embedding = torch.cat((img_attn_feat, mlp_attn_feat), 1)
#         fused_embedding = self.neck(fused_embedding)
        fused_embedding = F.dropout(fused_embedding, p=self.drop_p, training=self.training)
        encoder_feat = self.fc1(fused_embedding)
        encoder_feat = self.fc2(encoder_feat)
        
        return encoder_feat


# -

# # -------------------- MLP(DeepFM) ---------------------- ##

class MLPEncoder(nn.Module):
    def __init__(self, mlp_dim, RNN_hidden_layers, RNN_hidden_nodes, h_FC_dim, drop_p, num_classes, df, device,feature=False):
        super().__init__()
        #make mlp_dim to lstm_hidden_size
        sparse_features = ['battery_charging_state',
                                'network_type', 'is_mobile_available', 'is_mobile_connected',
       'is_network_available', 'is_wifi_available', 'is_wifi_connected',
       'transportation_mode', 'Weekday Name', 'eating_or_not', 'hour', 'weekend', 
        'traffic_move','audio_mode', 'fg_app_category', 
        'ringer_mode', 'is_connected', 'is_charging', 'orientation','call_state','fg_app']

        dense_features = ['strm_vol_music', 'strm_vol_noti', 'strm_vol_ring',
        'strm_vol_sys', 'strm_vol_voicecall','battery_percentage','TYPE_VIEW_FOCUSED_600',
       'TYPE_VIEW_HOVER_ENTER_600', 'TYPE_VIEW_CLICKED_600',
       'TYPE_VIEW_LONG_CLICKED_600', 'TYPE_VIEW_SCROLLED_600',
       'TYPE_VIEW_SELECTED_600', 'TYPE_VIEW_TEXT_CHANGED_600', 'TYPE_VIEW_FOCUSED_900',
       'TYPE_VIEW_HOVER_ENTER_900', 'TYPE_VIEW_CLICKED_900',
       'TYPE_VIEW_LONG_CLICKED_900', 'TYPE_VIEW_SCROLLED_900',
       'TYPE_VIEW_SELECTED_900', 'TYPE_VIEW_TEXT_CHANGED_900',
       'TYPE_VIEW_FOCUSED_1800', 'TYPE_VIEW_HOVER_ENTER_1800',
       'TYPE_VIEW_CLICKED_1800', 'TYPE_VIEW_LONG_CLICKED_1800',
       'TYPE_VIEW_SCROLLED_1800', 'TYPE_VIEW_SELECTED_1800',
       'TYPE_VIEW_TEXT_CHANGED_1800', 'TYPE_VIEW_FOCUSED_3600',
       'TYPE_VIEW_HOVER_ENTER_3600', 'TYPE_VIEW_CLICKED_3600',
       'TYPE_VIEW_LONG_CLICKED_3600', 'TYPE_VIEW_SCROLLED_3600',
       'TYPE_VIEW_SELECTED_3600', 'TYPE_VIEW_TEXT_CHANGED_3600',         
       'ACTION_SCREEN_ON_180', 'ACTION_SCREEN_ON_300', 'ACTION_SCREEN_ON_600',
       'ACTION_SCREEN_ON_900', 'ACTION_SCREEN_ON_1800', 'ACTION_SCREEN_ON_3600',
       'TYPE_VIEW_HOVER_ENTER_30', 'TYPE_VIEW_CLICKED_30',
       'TYPE_VIEW_LONG_CLICKED_30', 'TYPE_VIEW_SCROLLED_30',
       'TYPE_VIEW_SELECTED_30', 'TYPE_VIEW_TEXT_CHANGED_30','TYPE_VIEW_FOCUSED_30', 
        'TYPE_VIEW_FOCUSED_60', 'TYPE_VIEW_HOVER_ENTER_60',
       'TYPE_VIEW_CLICKED_60', 'TYPE_VIEW_LONG_CLICKED_60',
       'TYPE_VIEW_SCROLLED_60', 'TYPE_VIEW_SELECTED_60',
       'TYPE_VIEW_TEXT_CHANGED_60','TYPE_VIEW_FOCUSED_180',
       'TYPE_VIEW_HOVER_ENTER_180', 'TYPE_VIEW_CLICKED_180',
       'TYPE_VIEW_LONG_CLICKED_180', 'TYPE_VIEW_SCROLLED_180',
       'TYPE_VIEW_SELECTED_180', 'TYPE_VIEW_TEXT_CHANGED_180',
       'TYPE_VIEW_FOCUSED_300', 'TYPE_VIEW_HOVER_ENTER_300',
       'TYPE_VIEW_CLICKED_300', 'TYPE_VIEW_LONG_CLICKED_300',
       'TYPE_VIEW_SCROLLED_300', 'TYPE_VIEW_SELECTED_300',
       'TYPE_VIEW_TEXT_CHANGED_300',
       'cnt_screen_on'                       ,'freq_screen_on'                      ,'sum_screen_time'                     ,'avg_screen_time'                                     ,'max_screen_time'                     ,'min_screen_time'                     ,'med_screen_time'                                                   ,'cnt_FOCUSED'                         ,'freq_FOCUSED'                                                            ,'cnt_HOVER_ENTER'                     ,'freq_HOVER_ENTER'                         ,'cnt_CLICKED'                         ,'freq_CLICKED'                                ,'cnt_LONG_CLICKED'                    ,'freq_LONG_CLICKED'                         ,'cnt_SCROLLED'                        ,'freq_SCROLLED'                               ,'cnt_SELECTED'                        ,'freq_SELECTED'                           ,'cnt_TEXT_CHANGED'                    ,'freq_TEXT_CHANGED'                      ,'avg_vol_music'                       ,'std_vol_music'                       ,'max_vol_music'                       ,'min_vol_music'                       ,'med_vol_music'                       ,'is_adjusted_vol_music'               ,'avg_vol_noti'                        ,'std_vol_noti'                        ,'max_vol_noti'                        ,'min_vol_noti'                        ,'med_vol_noti'                        ,'is_adjusted_vol_noti'                ,'avg_vol_ring'                        ,'std_vol_ring'                        ,'max_vol_ring'                        ,'min_vol_ring'                        ,'med_vol_ring'                        ,'is_adjusted_vol_ring'                ,'avg_vol_sys'                         ,'std_vol_sys'                         ,'max_vol_sys'                         ,'min_vol_sys'                         ,'med_vol_sys'                         ,'is_adjusted_vol_sys'                 ,'avg_vol_voicecall'                   ,'std_vol_voicecall'                   ,'max_vol_voicecall'                   ,'min_vol_voicecall'                   ,'med_vol_voicecall'                   ,'is_adjusted_vol_voicecall'           ,'avg_battery'                         ,'std_battery'                         ,'max_battery'                         ,'min_battery'                         ,'med_battery'                         ,'num_charging'                        ,'sum_charging_time'                   ,'dur_network_mobile'                  ,'dur_network_wifi'                    ,'dur_network_no_connection'           ,'dur_trans_in_vehicle'                ,'dur_trans_on_bicycle'                ,'dur_trans_on_foot'                   ,'dur_trans_static'                    ,'is_moving'                           ,'dur_audio_InCall'                    ,'dur_audio_InCommunicaiton'           ,'dur_audio_Normal'                    ,'dur_audio_Ringtone'                  ,'num_call'                            ,'dur_ringer_Normal'                   ,'dur_ringer_Silent'                   ,'dur_ringer_Vibrate'                  ,'is_adjusted_ringer'                  ,'num_switch_apps'                     ,'freq_switch_apps'                    ,'num_used_apps'                       ,'dur_Launcher'                        ,'dur_IM'                              ,'dur_SOCIAL'                          ,'dur_VIDEO_PLAYERS'                   ,'dur_EVENTS'                          ,'dur_BROWSER'                         ,'dur_SYSTEM'                          ,'dur_SHOPPING'                        ,'dur_BUSINESS'                        ,'dur_GAME'                            ,'dur_TOOLS'                           ,'dur_PHOTOGRAPHY'                     ,'dur_PHONE_and_SMS'                   ,'dur_Stock'                           ,'dur_MAPS_AND_NAVIGATION'             ,'dur_OTHERS'                                       ]
        
        self.df = df
        for feat in sparse_features:
            lbe = LabelEncoder()
            self.df[feat] = lbe.fit_transform(self.df[feat])
        mms = MinMaxScaler(feature_range=(0, 1))
        
        self.df.replace([np.inf, -np.inf], np.nan, inplace=True)
        self.df[dense_features] = self.df[dense_features].fillna(0)
        self.df[dense_features] = mms.fit_transform(self.df[dense_features])
        
        self.df = self.df[sparse_features+dense_features]
        
        fixlen_feature_columns = [SparseFeat(feat, self.df[feat].nunique(),embedding_dim=24)
                                  for feat in sparse_features] + [DenseFeat(feat, 1, )
                                                                  for feat in dense_features]
#         pp(fixlen_feature_columns)
        self.dnn_feature_columns = fixlen_feature_columns
        self.linear_feature_columns = fixlen_feature_columns
       
        self.mlp_dim = mlp_dim
        self.RNN_hidden_layers = RNN_hidden_layers
        self.RNN_hidden_nodes = RNN_hidden_nodes
        #self.h_RNN = h_RNN                 # RNN hidden nodes
        self.h_FC_dim = h_FC_dim
        self.device = device
        self.drop_p = drop_p
        self.num_classes = num_classes
        self.feature = feature
        
        self.mlp = DeepFMChannelSize(linear_feature_columns = self.linear_feature_columns, dnn_feature_columns = self.dnn_feature_columns, task='binary', l2_reg_embedding=1e-5, device = self.device)
        
        self.LSTM = nn.LSTM(
            input_size=self.mlp_dim,
            hidden_size=self.RNN_hidden_nodes,        
            num_layers=self.RNN_hidden_layers,
#             dropout = drop_p,
            batch_first=True,
        )
        
        self.fc1 = nn.Linear(self.RNN_hidden_nodes, self.h_FC_dim)
        self.fc2 = nn.Linear(self.h_FC_dim, self.num_classes)
        
    def forward(self, x, x_lengths):
        seq_len = x.size(1)
        mlp_embed_seq = []
        for t in range(seq_len):
            mlp_embed = self.mlp(x[:, t, :])
            mlp_embed_seq.append(mlp_embed)
        
        mlp_embed_seq = torch.stack(mlp_embed_seq, dim=1) # shape: (batch, 7, 128)
        
        N, T, n = mlp_embed_seq.size()
        
        for i in range(N):
            if x_lengths[i] < T:
                mlp_embed_seq[i, x_lengths[i]:, :] = torch.zeros(T - x_lengths[i], n, dtype=torch.float, device=mlp_embed_seq.device)

        x_lengths[x_lengths > T] = T
        lengths_ordered, perm_idx = x_lengths.sort(0, descending=True)

        # use input of descending length
        packed_x_RNN = torch.nn.utils.rnn.pack_padded_sequence(mlp_embed_seq[perm_idx], lengths_ordered.cpu(), batch_first=True)
        self.LSTM.flatten_parameters()
        packed_RNN_out, (h_n_sorted, h_c_sorted) = self.LSTM(packed_x_RNN, None)
        """ h_n shape (n_layers, batch, hidden_size), h_c shape (n_layers, batch, hidden_size) """ 
        """ None represents zero initial hidden state. RNN_out has shape=(batch, time_step, output_size) """

        RNN_out, out_lengths = torch.nn.utils.rnn.pad_packed_sequence(packed_RNN_out, batch_first=True)
        #RNN_out, _ = torch.nn.utils.rnn.pad_packed_sequence(packed_RNN_out, batch_first=True)
        RNN_out = RNN_out.contiguous()
        # RNN_out = RNN_out.view(-1, RNN_out.size(2))
        last_out = []
        for i, length in enumerate(out_lengths):
            last_out.append(RNN_out[i][length - 1])
        last_out = torch.stack(last_out)
        # reverse back to original sequence order
        _, unperm_idx = perm_idx.sort(0)
        RNN_out = last_out[unperm_idx]
        #RNN_out = RNN_out[unperm_idx]
#         if self.feature:
#             return RNN_out[:, -1, :]
        # FC layers
        x = self.fc1(RNN_out)
        #x = self.fc1(RNN_out[:, -1, :])   # choose RNN_out at the last time step
        y = x
        x = F.relu(x)
        x = F.dropout(x, p=self.drop_p, training=self.training)
        x = self.fc2(x)
        if self.feature:
            return y 
        return x


class MLP(nn.Module):
    def __init__(self, mlp_dim, RNN_hidden_layers, RNN_hidden_nodes, h_FC_dim, drop_p, num_classes, df, device,feature=False):
        super().__init__()
        #make mlp_dim to lstm_hidden_size
        #(batch, time_step, output_size)
        self.df = df
        
        sparse_features = ['battery_charging_state',
                                'network_type', 'is_mobile_available', 'is_mobile_connected',
       'is_network_available', 'is_wifi_available', 'is_wifi_connected',
       'transportation_mode', 'Weekday Name', 'eating_or_not', 'hour', 'weekend', 
        'traffic_move','audio_mode', 'fg_app_category', 
        'ringer_mode', 'is_connected', 'is_charging', 'orientation','call_state','fg_app']

        dense_features = ['strm_vol_music', 'strm_vol_noti', 'strm_vol_ring',
        'strm_vol_sys', 'strm_vol_voicecall','battery_percentage','TYPE_VIEW_FOCUSED_600',
       'TYPE_VIEW_HOVER_ENTER_600', 'TYPE_VIEW_CLICKED_600',
       'TYPE_VIEW_LONG_CLICKED_600', 'TYPE_VIEW_SCROLLED_600',
       'TYPE_VIEW_SELECTED_600', 'TYPE_VIEW_TEXT_CHANGED_600', 'TYPE_VIEW_FOCUSED_900',
       'TYPE_VIEW_HOVER_ENTER_900', 'TYPE_VIEW_CLICKED_900',
       'TYPE_VIEW_LONG_CLICKED_900', 'TYPE_VIEW_SCROLLED_900',
       'TYPE_VIEW_SELECTED_900', 'TYPE_VIEW_TEXT_CHANGED_900',
       'TYPE_VIEW_FOCUSED_1800', 'TYPE_VIEW_HOVER_ENTER_1800',
       'TYPE_VIEW_CLICKED_1800', 'TYPE_VIEW_LONG_CLICKED_1800',
       'TYPE_VIEW_SCROLLED_1800', 'TYPE_VIEW_SELECTED_1800',
       'TYPE_VIEW_TEXT_CHANGED_1800', 'TYPE_VIEW_FOCUSED_3600',
       'TYPE_VIEW_HOVER_ENTER_3600', 'TYPE_VIEW_CLICKED_3600',
       'TYPE_VIEW_LONG_CLICKED_3600', 'TYPE_VIEW_SCROLLED_3600',
       'TYPE_VIEW_SELECTED_3600', 'TYPE_VIEW_TEXT_CHANGED_3600',         
       'ACTION_SCREEN_ON_180', 'ACTION_SCREEN_ON_300', 'ACTION_SCREEN_ON_600',
       'ACTION_SCREEN_ON_900', 'ACTION_SCREEN_ON_1800', 'ACTION_SCREEN_ON_3600',
       'TYPE_VIEW_HOVER_ENTER_30', 'TYPE_VIEW_CLICKED_30',
       'TYPE_VIEW_LONG_CLICKED_30', 'TYPE_VIEW_SCROLLED_30',
       'TYPE_VIEW_SELECTED_30', 'TYPE_VIEW_TEXT_CHANGED_30','TYPE_VIEW_FOCUSED_30', 
        'TYPE_VIEW_FOCUSED_60', 'TYPE_VIEW_HOVER_ENTER_60',
       'TYPE_VIEW_CLICKED_60', 'TYPE_VIEW_LONG_CLICKED_60',
       'TYPE_VIEW_SCROLLED_60', 'TYPE_VIEW_SELECTED_60',
       'TYPE_VIEW_TEXT_CHANGED_60','TYPE_VIEW_FOCUSED_180',
       'TYPE_VIEW_HOVER_ENTER_180', 'TYPE_VIEW_CLICKED_180',
       'TYPE_VIEW_LONG_CLICKED_180', 'TYPE_VIEW_SCROLLED_180',
       'TYPE_VIEW_SELECTED_180', 'TYPE_VIEW_TEXT_CHANGED_180',
       'TYPE_VIEW_FOCUSED_300', 'TYPE_VIEW_HOVER_ENTER_300',
       'TYPE_VIEW_CLICKED_300', 'TYPE_VIEW_LONG_CLICKED_300',
       'TYPE_VIEW_SCROLLED_300', 'TYPE_VIEW_SELECTED_300',
       'TYPE_VIEW_TEXT_CHANGED_300',
       'cnt_screen_on'                       ,'freq_screen_on'                      ,'sum_screen_time'                     ,'avg_screen_time'                                     ,'max_screen_time'                     ,'min_screen_time'                     ,'med_screen_time'                                                   ,'cnt_FOCUSED'                         ,'freq_FOCUSED'                                                            ,'cnt_HOVER_ENTER'                     ,'freq_HOVER_ENTER'                         ,'cnt_CLICKED'                         ,'freq_CLICKED'                                ,'cnt_LONG_CLICKED'                    ,'freq_LONG_CLICKED'                         ,'cnt_SCROLLED'                        ,'freq_SCROLLED'                               ,'cnt_SELECTED'                        ,'freq_SELECTED'                           ,'cnt_TEXT_CHANGED'                    ,'freq_TEXT_CHANGED'                      ,'avg_vol_music'                       ,'std_vol_music'                       ,'max_vol_music'                       ,'min_vol_music'                       ,'med_vol_music'                       ,'is_adjusted_vol_music'               ,'avg_vol_noti'                        ,'std_vol_noti'                        ,'max_vol_noti'                        ,'min_vol_noti'                        ,'med_vol_noti'                        ,'is_adjusted_vol_noti'                ,'avg_vol_ring'                        ,'std_vol_ring'                        ,'max_vol_ring'                        ,'min_vol_ring'                        ,'med_vol_ring'                        ,'is_adjusted_vol_ring'                ,'avg_vol_sys'                         ,'std_vol_sys'                         ,'max_vol_sys'                         ,'min_vol_sys'                         ,'med_vol_sys'                         ,'is_adjusted_vol_sys'                 ,'avg_vol_voicecall'                   ,'std_vol_voicecall'                   ,'max_vol_voicecall'                   ,'min_vol_voicecall'                   ,'med_vol_voicecall'                   ,'is_adjusted_vol_voicecall'           ,'avg_battery'                         ,'std_battery'                         ,'max_battery'                         ,'min_battery'                         ,'med_battery'                         ,'num_charging'                        ,'sum_charging_time'                   ,'dur_network_mobile'                  ,'dur_network_wifi'                    ,'dur_network_no_connection'           ,'dur_trans_in_vehicle'                ,'dur_trans_on_bicycle'                ,'dur_trans_on_foot'                   ,'dur_trans_static'                    ,'is_moving'                           ,'dur_audio_InCall'                    ,'dur_audio_InCommunicaiton'           ,'dur_audio_Normal'                    ,'dur_audio_Ringtone'                  ,'num_call'                            ,'dur_ringer_Normal'                   ,'dur_ringer_Silent'                   ,'dur_ringer_Vibrate'                  ,'is_adjusted_ringer'                  ,'num_switch_apps'                     ,'freq_switch_apps'                    ,'num_used_apps'                       ,'dur_Launcher'                        ,'dur_IM'                              ,'dur_SOCIAL'                          ,'dur_VIDEO_PLAYERS'                   ,'dur_EVENTS'                          ,'dur_BROWSER'                         ,'dur_SYSTEM'                          ,'dur_SHOPPING'                        ,'dur_BUSINESS'                        ,'dur_GAME'                            ,'dur_TOOLS'                           ,'dur_PHOTOGRAPHY'                     ,'dur_PHONE_and_SMS'                   ,'dur_Stock'                           ,'dur_MAPS_AND_NAVIGATION'             ,'dur_OTHERS'                                       ]
        
        for feat in sparse_features:
            lbe = LabelEncoder()
            self.df[feat] = lbe.fit_transform(self.df[feat])
            
        self.df.replace([np.inf, -np.inf], np.nan, inplace=True)
        self.df[dense_features] = self.df[dense_features].fillna(0)
        mms = MinMaxScaler(feature_range=(0, 1))
        self.df[dense_features] = mms.fit_transform(self.df[dense_features])
        
        self.df = self.df[sparse_features+dense_features]
        
        fixlen_feature_columns = [SparseFeat(feat, self.df[feat].nunique(),embedding_dim = 24) 
                                  for feat in sparse_features] + [DenseFeat(feat, 1, )
                                                                  for feat in dense_features]
#         pp(fixlen_feature_columns)
        self.dnn_feature_columns = fixlen_feature_columns
        self.linear_feature_columns = fixlen_feature_columns
       
        self.mlp_dim = mlp_dim
        self.RNN_hidden_layers = RNN_hidden_layers
        self.RNN_hidden_nodes = RNN_hidden_nodes
        #self.h_RNN = h_RNN                 # RNN hidden nodes
        self.h_FC_dim = h_FC_dim
        self.device = device
        self.drop_p = drop_p
        self.num_classes = num_classes
        self.feature = feature
        
        self.mlp = DeepFMChannelSize(linear_feature_columns = self.linear_feature_columns, dnn_feature_columns = self.dnn_feature_columns, task='binary', l2_reg_embedding=1e-5, device = self.device)
        

        self.fc1 = nn.Linear(128, 64)
        self.fc2 = nn.Linear(64, self.num_classes)
        
    def forward(self, x, x_lengths):
        seq_len = x.size(1)


        mlp_embed = self.mlp(x[:, seq_len-1, :])
        
        x = self.fc1(mlp_embed)
        x = F.relu(x)
        x = F.dropout(x, p=self.drop_p, training=self.training)
        x = self.fc2(x)
        return x


# # ---------------------- end of MLP (DeepFM) ---------------------- ##

# +
def MLP_final_prediction(model, device, loader,prob = False):
    #cnn_encoder, rnn_decoder = model
    rnn_decoder = model
    #cnn_encoder.eval()
    rnn_decoder.eval()
    all_y = []
    all_y_pred = []
    all_path = []
    with torch.no_grad():
        for X, X_lengths, y, path in tqdm(loader):
#         for X, X_lengths, y in tqdm(loader):
            # distribute data to device
            X, X_lengths, y = X.to(device), X_lengths.to(device).view(-1, ), y.to(device).view(-1, )

            
            output = rnn_decoder(X, X_lengths) 
            y_pred = output.max(1, keepdim=True)[1]  # (y_pred != output) get the index of the max log-probability
            
            if prob:
                y_pred = rnn_decoder(X, X_lengths) 
                y_pred = F.softmax(y_pred, dim=-1)[:,1]
            # collect all y and y_pred in all batches
            all_y.extend(y)
            all_y_pred.extend(y_pred)
            all_path.extend(path)
        
    all_y = torch.stack(all_y, dim=0)
    all_y_pred = torch.stack(all_y_pred, dim=0)

    return all_y.cpu().data.squeeze().numpy(), all_y_pred.cpu().data.squeeze().numpy(), all_path
    if prob:
        return all_y.cpu().data.squeeze().numpy(), all_y_pred.cpu().data.squeeze().numpy(), all_path

def show_confusion_matrix(confusion_matrix, class_names, name='./confusion_matrix.png'):
    
    cm = confusion_matrix.copy()

    cell_counts = cm.flatten()

    cm_row_norm = cm / cm.sum(axis=1)[:, np.newaxis]

    row_percentages = ["{0:.2f}".format(value) for value in cm_row_norm.flatten()]

    cell_labels = [f"{cnt}\n{per}" for cnt, per in zip(cell_counts, row_percentages)]
    cell_labels = np.asarray(cell_labels).reshape(cm.shape[0], cm.shape[1])

    df_cm = pd.DataFrame(cm_row_norm, index=class_names, columns=class_names)

    hmap = sns.heatmap(df_cm, annot=cell_labels, fmt="", cmap="Blues")
    hmap.yaxis.set_ticklabels(hmap.yaxis.get_ticklabels(), rotation=0, ha='right')
    hmap.xaxis.set_ticklabels(hmap.xaxis.get_ticklabels(), rotation=30, ha='right')
    plt.ylabel('True Sign')
    plt.xlabel('Predicted Sign')

    plt.savefig(name)
    plt.close('all')

def CRNN_final_prediction(model, device, loader, prob = False):
    cnn_encoder, rnn_decoder = model

    cnn_encoder.eval()
    rnn_decoder.eval()
    all_y = []
    all_y_pred = []
    all_path = []

    with torch.no_grad():
#         for X, X_lengths, y in tqdm(loader):
        for X, X_lengths, y ,path in tqdm(loader):
            # distribute data to device
            X, X_lengths, y = X.to(device), X_lengths.to(device).view(-1, ), y.to(device).view(-1, )
            
            cnn_embed_seq = cnn_encoder(X)
            N, T, n = cnn_embed_seq.size()
        
            for i in range(N):
                if X_lengths[i] < T:
                    cnn_embed_seq[i, X_lengths[i]:, :] = torch.zeros(T - X_lengths[i], n, dtype=torch.float, device=cnn_embed_seq.device)
            
            if prob:
                y_pred = rnn_decoder(cnn_embed_seq, X_lengths)
                y_pred = F.softmax(y_pred, dim=-1)[:,1]

            
            else:
                output = rnn_decoder(cnn_embed_seq, X_lengths)   # output has dim = (batch, number of classes)
                y_pred = output.max(1, keepdim=True)[1]  # (y_pred != output) get the index of the max log-probability
          
            # collect all y and y_pred in all batches
            all_y.extend(y)
            all_y_pred.extend(y_pred)
            all_path.extend(path)

    


    all_y = torch.stack(all_y, dim=0)
    all_y_pred = torch.stack(all_y_pred, dim=0)
    
    
    return all_y.cpu().data.squeeze().numpy(), all_y_pred.cpu().data.squeeze().numpy(),all_path

def fusion_final_prediction(model, device, loader, prob = False):
    
    model.eval()

    all_y = []
    all_y_pred = []
    all_path = []
    with torch.no_grad():
        for X, X_log,X_lengths, y, path in tqdm(loader):
            # distribute data to device
            X,X_log ,X_lengths, y = X.to(device),X_log.to(device) ,X_lengths.to(device).view(-1, ), y.to(device).view(-1, )
            
            if prob:
                y_pred = model(X,X_log,X_lengths)
                y_pred = F.softmax(y_pred, dim=-1)[:,1]
            else:
                output = model(X,X_log,X_lengths)
                y_pred = output.max(1, keepdim=True)[1]  # (y_pred != output) get the index of the max log-probability

            # collect all y and y_pred in all batches
            all_y.extend(y)
            all_y_pred.extend(y_pred)
            all_path.extend(path)
    


    all_y = torch.stack(all_y, dim=0)
    all_y_pred = torch.stack(all_y_pred, dim=0)
    
    
    return all_y.cpu().data.squeeze().numpy(), all_y_pred.cpu().data.squeeze().numpy(),all_path

