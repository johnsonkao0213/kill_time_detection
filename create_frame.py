import shutil
import pickle
import os
from tqdm import tqdm
import numpy as np
from sklearn import preprocessing
import pandas as pd

user = '00'
data_path = './datasets/screenshots/U'+user
length_path = './datasets/frame_count_U'+user+'.pkl'
target_path = './datasets/targets_U'+user+'.pkl'
paths = './datasets/frames/raw_frame_U'+user
by_day_paths = './datasets/frames_by_day/'



IMG_EXTENSIONS = [
    '.jpg', '.JPG', '.jpeg', '.JPEG',
    '.png', '.PNG', '.ppm', '.PPM', '.bmp', '.BMP',
]

def is_image_file(filename):
    return any(filename.endswith(extension) for extension in IMG_EXTENSIONS)

# +
def images_to_logData_by_day(path, df):
    #logData = []
    #imgs = []
    lengths = []
    targets = []
    cnt=0
    ### day
    days=[]
    le = preprocessing.LabelEncoder()
    
    for i in tqdm(df.index):
        days.append(i[10:12])
    le.fit(days) 
    ###
    for i in tqdm(df.index):
        lengths.append(df['ITV_30'][i])
        targets.append(df['kill_time'][i])
        cnt+=1
        ###day
        day = le.transform([i[10:12]])    
        des = by_day_paths+(str(day[0]))+'/raw_frame_U'+user+'/'+(str(cnt).rjust(6,'0'))
        ###
        os.makedirs(des)        
        for j in df['combine_30s'][i].split(';'):
            item = data_path + j + '.jpg'
            if j.split('/')[2] in df.index:
                shutil.copy(item, des)
                

    with open(target_path, 'wb') as handle:
        pickle.dump(targets, handle, protocol=pickle.HIGHEST_PROTOCOL)  
    with open(length_path, 'wb') as handle:
        pickle.dump(lengths, handle, protocol=pickle.HIGHEST_PROTOCOL)  
        
def images_to_logData(path, df):
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


# -

try: 
    os.mkdir(paths) 
    os.mkdir(by_day_paths) 
except OSError as error: 
    print(error) 
df = pd.read_csv('./datasets/csv/test_data.csv', index_col="file_name", low_memory=False)
df = df[df['kill_time'].notna()]
df.kill_time = df.kill_time.astype(int)
print(user)
print(df['PID'].value_counts())

images_to_logData(data_path, df[df['PID']=='U'+user])
images_to_logData_by_day(data_path, df[df['PID']=='U'+user])







