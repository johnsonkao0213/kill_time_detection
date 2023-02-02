import shutil
import pickle
import os
from tqdm import tqdm
import numpy as np
from sklearn import preprocessing
import pandas as pd

user = '45'
data_path = '../P'+user
length_path = 'frame_count_P'+user+'.pkl'
target_path = 'targets_P'+user+'.pkl'
paths = '../CHI_data/raw_frame_P'+user



IMG_EXTENSIONS = [
    '.jpg', '.JPG', '.jpeg', '.JPEG',
    '.png', '.PNG', '.ppm', '.PPM', '.bmp', '.BMP',
]

def is_image_file(filename):
    return any(filename.endswith(extension) for extension in IMG_EXTENSIONS)

def images_to_logData(path, df):
    #logData = []
    #imgs = []
    lengths = []
    targets = []
    cnt=0

    for i in tqdm(df.index):
        lengths.append(df['ITV_30'][i])
        targets.append(df['kill_time'][i])
        cnt+=1
        des = paths+'/'+(str(cnt).rjust(6,'0'))
        os.makedirs(des)        
        for j in df['combine_30s'][i].split(';'):
            item = data_path + j + '.jpg'
            if j.split('/')[2] in df.index:
                shutil.copy(item, des)
                
            
    with open(target_path, 'wb') as handle:
        pickle.dump(targets, handle, protocol=pickle.HIGHEST_PROTOCOL)  
    with open(length_path, 'wb') as handle:
        pickle.dump(lengths, handle, protocol=pickle.HIGHEST_PROTOCOL)  

try: 
    os.mkdir(paths) 
except OSError as error: 
    print(error) 
df = pd.read_csv('./CHI_PhoneLog_30_55.csv', index_col="file_name", low_memory=False)
df = df[df['kill_time'].notna()]
df.kill_time = df.kill_time.astype(int)
print(user)
print(df['PID'].value_counts())

images_to_logData(data_path, df[df['PID']=='P'+user])







