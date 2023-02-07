#!/usr/bin/env python
# coding: utf-8

# In[3]:


import sqlite3
from sqlite3 import Error
from datetime import datetime, timedelta
import pandas as pd
from sqlalchemy import create_engine # database connection

import numpy as np
from scipy.signal import argrelextrema

pd.options.mode.chained_assignment = None  # default='warn'


# PATH config
DB_PATH =  './db/killing_time.db'
IMAGES_PATH = './phone_raw_images/'


def select_all_users(conn):
    """
    Query all rows in the users table
    :param conn: the Connection object
    :return: an user list
    """
    users = []
    cur = conn.cursor()
    cur.execute("SELECT DISTINCT PID from user_experiment;")

    rows = cur.fetchall()
    for row in rows:
        users.append(row[0]) 
    
    return users

def ini_experiment_data(conn):
    """
    Query all users' experiment date, and then update the beginning and data valid time each date
    :param conn: the Connection object
    :return:
    """
    cur = conn.cursor()
    cur.execute("INSERT OR IGNORE INTO user_experiment (PID, date) SELECT DISTINCT PID, substr(record_time, 1, 10) AS date FROM phone_log;")
    conn.commit()
    
    cur.execute("SELECT PID, date FROM user_experiment;")
    rows = cur.fetchall()
    for row in rows:
        cur.execute("UPDATE user_experiment SET (start_time, valid_time) = (table_b.start_time, table_b.valid_time) FROM (SELECT record_time AS start_time, DATETIME(record_time, '+60 minutes') AS valid_time FROM phone_log WHERE PID = ? AND substr(record_time, 1, 10) = ? ORDER BY record_time LIMIT 1) table_b;", (row[0], row[1]))
        conn.commit()


def cal_screenshot_size_in_past_30s(conn):
    """
    Calculate the number of the screenshots sequences in past 30s
    :param conn: the Connection object
    :return:
    """
    cur = conn.cursor()
    cur.execute("DELETE FROM _screenshots_validation;")
    conn.commit()
    
    """
    ---SQL--- 
    INSERT OR IGNORE INTO _screenshots_validation (PID, record_time, ITV_30, combine_30s) 
    SELECT PID, record_time, COUNT(*) AS ITV_30, GROUP_CONCAT(file_name,';') AS combine_30s
    FROM (SELECT tbl.PID, tbl.record_time, ('/' || screenshots.label || '/' || screenshots.file_name) AS file_name FROM screenshots tbl 
    LEFT JOIN screenshots ON screenshots.PID= tbl.PID AND screenshots.record_time BETWEEN DATETIME(tbl.record_time, '-30 seconds') AND tbl.record_time) tbl_b
    GROUP BY tbl_b.PID, tbl_b.record_time;
    """
    cur.execute("INSERT OR IGNORE INTO _screenshots_validation (PID, record_time, ITV_30, combine_30s) SELECT PID, record_time, COUNT(*) AS ITV_30, GROUP_CONCAT(file_name,';') AS combine_30s FROM (SELECT tbl.PID, tbl.record_time, ('/' || screenshots.label || '/' || screenshots.file_name) AS file_name FROM screenshots tbl LEFT JOIN screenshots ON screenshots.PID= tbl.PID AND screenshots.record_time BETWEEN DATETIME(tbl.record_time, '-30 seconds') AND tbl.record_time) tbl_b GROUP BY tbl_b.PID, tbl_b.record_time;")
    conn.commit()

def cal_accessibility_N_intent_count(conn, PID):
    """
    for calculate the count of each accessibility type in the past few seconds
    :param conn: the Connection object, PID
    :return:
    """
    acc_CountByTime =[30, 60, 180, 300, 600, 900, 1800, 3600] # units: seconds
    acc_TypeList = ['TYPE_VIEW_FOCUSED','TYPE_VIEW_HOVER_ENTER', 'TYPE_VIEW_CLICKED', 'TYPE_VIEW_LONG_CLICKED','TYPE_VIEW_SCROLLED','TYPE_VIEW_SELECTED','TYPE_VIEW_TEXT_CHANGED']
    intent_CountByTime =[180, 300, 600, 900, 1800, 3600] # units: seconds
    intent_TypeList = ['ACTION_SCREEN_ON']

    """
    ---Queries records for which accessibility event and intent frequencies are not counted.--- 
    SELECT record_time from phone_log 
    WHERE PID=? AND NOT EXISTS (
        SELECT * FROM _action_count 
        WHERE _action_count.PID =phone_log.PID and _action_count.record_time = phone_log.record_time 
    );
    """
    cur = conn.cursor()
    cur.execute("SELECT record_time from phone_log WHERE PID=? AND NOT EXISTS (SELECT * FROM _action_count WHERE _action_count.PID =phone_log.PID and _action_count.record_time = phone_log.record_time )", (PID,))

    minuku_rows = cur.fetchall()
    TypeList = acc_TypeList
    CountByTime = acc_CountByTime
    cur = conn.cursor()
    
    records = []
    timeStr_acc = '-' + str(acc_CountByTime[len(acc_CountByTime)-1])+' seconds'
    timeStr_int = '-' + str(intent_CountByTime[len(intent_CountByTime)-1])+' seconds'
    for row in minuku_rows:
        record_time = row[0]
        
        # Count the number of individual type of accessibility events in intervals of different interval
        Json = {}
        TypeList = acc_TypeList
        CountByTime = acc_CountByTime
        for acc_type in TypeList:
            for time in CountByTime:
                Json[acc_type+'_'+ str(time)] = 0
        """
        ---Queries accessibility records by time --- 
        SELECT accessibility.detect_time, accessibility.type 
        FROM accessibility 
        WHERE accessibility.PID = ? AND ? >=accessibility.detect_time and datetime(?, ?) <=accessibility.detect_time;
        """
        sql = "SELECT accessibility.detect_time,accessibility.type FROM accessibility WHERE accessibility.PID =? AND ? >=accessibility.detect_time and datetime(?, ?) <=accessibility.detect_time"
        cur.execute(sql, (PID, record_time, record_time, timeStr_acc))
        cnt_rows = cur.fetchall()
        baseTime = datetime.strptime(record_time, '%Y-%m-%d %H:%M:%S')
        for cnt_row in cnt_rows:
            if cnt_row[1] in TypeList:
                dTime = datetime.strptime(cnt_row[0], '%Y-%m-%d %H:%M:%S.%f')
                #print(str((baseTime-dTime).total_seconds()))
                for time in CountByTime:
                    if (time*1000) >= int((baseTime-dTime).total_seconds() * 1000):
                        Json[cnt_row[1]+'_'+ str(time)] = Json[cnt_row[1]+'_'+ str(time)] +1
                        
        # Count the number of intent event of accessibility events in intervals of different interval
        TypeList = intent_TypeList
        CountByTime = intent_CountByTime
        for intent_type in TypeList:
            for time in CountByTime:
                Json[intent_type+'_'+ str(time)] =0

        """
        ---Queries intent event (i.e., screen on and off) by time --- 
        SELECT intent_action.detect_time,intent_action.action 
        FROM intent_action 
        WHERE intent_action.PID =? AND ? >=intent_action.detect_time and datetime(?, ?) <=intent_action.detect_time;
        """
        sql = "SELECT intent_action.detect_time,intent_action.action FROM intent_action WHERE intent_action.PID =? AND ? >=intent_action.detect_time and datetime(?, ?) <=intent_action.detect_time"
        cur.execute(sql, (PID, record_time, record_time, timeStr_int))
        cnt_rows = cur.fetchall()
        baseTime = datetime.strptime(record_time, '%Y-%m-%d %H:%M:%S')
        for cnt_row in cnt_rows:
            if cnt_row[1] in TypeList:
                dTime = datetime.strptime(cnt_row[0], '%Y-%m-%d %H:%M:%S.%f')
                #print(str((baseTime-dTime).total_seconds()))
                for time in CountByTime:
                    if (time*1000) >= int((baseTime-dTime).total_seconds() * 1000):
                        Json[cnt_row[1]+'_'+ str(time)] = Json[cnt_row[1]+'_'+ str(time)] +1
        
        records.append((PID, record_time,Json['TYPE_VIEW_FOCUSED_30'],Json['TYPE_VIEW_HOVER_ENTER_30'],Json['TYPE_VIEW_CLICKED_30'],Json['TYPE_VIEW_LONG_CLICKED_30'],Json['TYPE_VIEW_SCROLLED_30'],Json['TYPE_VIEW_SELECTED_30'],Json['TYPE_VIEW_TEXT_CHANGED_30'],Json['TYPE_VIEW_FOCUSED_60'],Json['TYPE_VIEW_HOVER_ENTER_60'],Json['TYPE_VIEW_CLICKED_60'],Json['TYPE_VIEW_LONG_CLICKED_60'],Json['TYPE_VIEW_SCROLLED_60'],Json['TYPE_VIEW_SELECTED_60'],Json['TYPE_VIEW_TEXT_CHANGED_60'],Json['TYPE_VIEW_FOCUSED_180'],Json['TYPE_VIEW_HOVER_ENTER_180'],Json['TYPE_VIEW_CLICKED_180'],Json['TYPE_VIEW_LONG_CLICKED_180'],Json['TYPE_VIEW_SCROLLED_180'],Json['TYPE_VIEW_SELECTED_180'],Json['TYPE_VIEW_TEXT_CHANGED_180'],Json['TYPE_VIEW_FOCUSED_300'],Json['TYPE_VIEW_HOVER_ENTER_300'],Json['TYPE_VIEW_CLICKED_300'],Json['TYPE_VIEW_LONG_CLICKED_300'],Json['TYPE_VIEW_SCROLLED_300'],Json['TYPE_VIEW_SELECTED_300'],Json['TYPE_VIEW_TEXT_CHANGED_300'],Json['TYPE_VIEW_FOCUSED_600'],Json['TYPE_VIEW_HOVER_ENTER_600'],Json['TYPE_VIEW_CLICKED_600'],Json['TYPE_VIEW_LONG_CLICKED_600'],Json['TYPE_VIEW_SCROLLED_600'],Json['TYPE_VIEW_SELECTED_600'],Json['TYPE_VIEW_TEXT_CHANGED_600'],Json['TYPE_VIEW_FOCUSED_900'],Json['TYPE_VIEW_HOVER_ENTER_900'],Json['TYPE_VIEW_CLICKED_900'],Json['TYPE_VIEW_LONG_CLICKED_900'],Json['TYPE_VIEW_SCROLLED_900'],Json['TYPE_VIEW_SELECTED_900'],Json['TYPE_VIEW_TEXT_CHANGED_900'],Json['TYPE_VIEW_FOCUSED_1800'],Json['TYPE_VIEW_HOVER_ENTER_1800'],Json['TYPE_VIEW_CLICKED_1800'],Json['TYPE_VIEW_LONG_CLICKED_1800'],Json['TYPE_VIEW_SCROLLED_1800'],Json['TYPE_VIEW_SELECTED_1800'],Json['TYPE_VIEW_TEXT_CHANGED_1800'],Json['TYPE_VIEW_FOCUSED_3600'],Json['TYPE_VIEW_HOVER_ENTER_3600'],Json['TYPE_VIEW_CLICKED_3600'],Json['TYPE_VIEW_LONG_CLICKED_3600'],Json['TYPE_VIEW_SCROLLED_3600'],Json['TYPE_VIEW_SELECTED_3600'],Json['TYPE_VIEW_TEXT_CHANGED_3600'],Json['ACTION_SCREEN_ON_180'],Json['ACTION_SCREEN_ON_300'],Json['ACTION_SCREEN_ON_600'],Json['ACTION_SCREEN_ON_900'],Json['ACTION_SCREEN_ON_1800'],Json['ACTION_SCREEN_ON_3600']))
    print('-----------')   
    #insert multiple records in a single query
    cur.executemany('INSERT INTO _action_count VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);',records);
    #print('All records of', PID, 'are', str(len(minuku_rows)))
    print('And we have inserted', cur.rowcount, 'records to the _action_count table.')


    #commit the changes to db			
    conn.commit()

def checkSessionsValid(time_before, time_after):
    D = time_after.date()
    str_bound = D.strftime('%Y-%m-%d') + ' 05:00:00.000'
    bound = datetime.strptime(str_bound,'%Y-%m-%d %H:%M:%S.%f')
    if time_before < bound and time_after > bound:
        print(time_before, time_after)
        return False
    else:
        return True
    
def cal_screen_time (conn, PID):

    # Delete the old data
    cur = conn.cursor()
    cur.execute("DELETE FROM _screen_time where PID = ?",(PID,))
    conn.commit()
    
    """
    ---Queries screen on and off intent by user --- 
    SELECT * FROM intent_action 
    WHERE ( intent_action.action = 'ACTION_SCREEN_ON' OR intent_action.action = 'ACTION_SCREEN_OFF') 
    AND intent_action.PID = ? 
    ORDER by intent_action.detect_time;
    """ 
    param = (PID,)
    df_screen = pd.read_sql_query("SELECT * FROM intent_action WHERE ( intent_action.action = 'ACTION_SCREEN_ON' OR intent_action.action = 'ACTION_SCREEN_OFF') AND intent_action.PID = ? ORDER by intent_action.detect_time;", disk_engine, params=param )
    
    record = []
    last_time = ''
    last_action = ''
    
    # pair the screen on and off 
    for index, row in df_screen.iterrows():
        if last_action =='' and  df_screen["action"][index] =='ACTION_SCREEN_OFF':
            continue
            
        if last_action =='':
            last_action = df_screen["action"][index]
            last_time = df_screen['detect_time'][index]
            continue

        if df_screen["action"][index] == 'ACTION_SCREEN_ON':
            last_action = df_screen["action"][index]
            last_time = df_screen['detect_time'][index]
            continue
        elif df_screen["action"][index] == 'ACTION_SCREEN_OFF':
            if last_action == 'ACTION_SCREEN_ON':
                tb = datetime.strptime( last_time, '%Y-%m-%d %H:%M:%S.%f')
                ta = datetime.strptime( df_screen['detect_time'][index], '%Y-%m-%d %H:%M:%S.%f')
                diff = ta-tb
                lapsed_time = diff.total_seconds()
                if checkSessionsValid(tb, ta) :
                    record.append([PID,last_time,df_screen['detect_time'][index],lapsed_time])
            
            last_action = df_screen["action"][index]
            last_time = df_screen['detect_time'][index]
            continue
            
    # insert into _screen_time table
    df = pd.DataFrame(record, columns=['PID', 'start_time','end_time','duration'])
    df.to_sql('_screen_time', con=disk_engine, if_exists='append', index=False)
    
    
    

# ---- main----
conn = sqlite3.connect(DB_PATH)
disk_engine = create_engine('sqlite:///' + DB_PATH)

ini_experiment_data(conn)
cal_screenshot_size_in_past_30s(conn)

Users = select_all_users(conn)
for user in Users:
    # for calculate the count of each accessibility type in the past few seconds
    cal_accessibility_N_intent_count(conn, user)
    
    # cal the screen time
    cal_screen_time(conn, user)
    cur = conn.cursor()
    cur.execute("UPDATE phone_log SET use_time = tbl1.use_time FROM ( SELECT * FROM (SELECT tbl.PID, tbl.record_time, _screen_time.start_time,((JULIANDAY(tbl.record_time) - JULIANDAY(_screen_time.start_time)) * 86400) AS use_time FROM ( SELECT phone_log.* FROM phone_log WHERE phone_log.PID = ?  ) tbl LEFT JOIN _screen_time ON _screen_time.PID = tbl.PID AND tbl.record_time BETWEEN _screen_time.start_time AND _screen_time.end_time) t WHERE t.start_time is not NULL ) tbl1 WHERE tbl1.PID = phone_log.PID AND tbl1.record_time = phone_log.record_time;",(user,))
    conn.commit()

conn.close()


# # Get Screen and Generate Sessions by Method

# In[11]:


def getSessions(PID,  data, threshold):
    data['duration'] = (data['end_time']- data['start_time']).dt.total_seconds()
    data['gap_duration'] = np.nan
    data["session_start_time"] = np.nan
    data["session_id"] = -1
    data["screen_on_id"] = -1
    df = pd.DataFrame(columns = ['start_time','end_time','duration','time_from_last_session','hour','is_weekend','time_of_a_day','cnt_screen_on','freq_screen_on','sum_screen_time','avg_screen_time','std_screen_time','max_screen_time','min_screen_time','med_screen_time','cnt_FOCUSED','freq_FOCUSED','cnt_HOVER_ENTER','freq_HOVER_ENTER','cnt_CLICKED','freq_CLICKED','cnt_LONG_CLICKED','freq_LONG_CLICKED','cnt_SCROLLED','freq_SCROLLED','cnt_SELECTED','freq_SELECTED','cnt_TEXT_CHANGED','freq_TEXT_CHANGED','avg_vol_music','std_vol_music','max_vol_music','min_vol_music','med_vol_music','is_adjusted_vol_music','avg_vol_noti','std_vol_noti','max_vol_noti','min_vol_noti','med_vol_noti','is_adjusted_vol_noti','avg_vol_ring','std_vol_ring','max_vol_ring','min_vol_ring','med_vol_ring','is_adjusted_vol_ring','avg_vol_sys','std_vol_sys','max_vol_sys','min_vol_sys','med_vol_sys','is_adjusted_vol_sys','avg_vol_voicecall','std_vol_voicecall','max_vol_voicecall','min_vol_voicecall','med_vol_voicecall','is_adjusted_vol_voicecall','avg_battery','std_battery','max_battery','min_battery','med_battery','num_charging','sum_charging_time','dur_network_mobile','dur_network_wifi','dur_network_no_connection','dur_trans_in_vehicle','dur_trans_on_bicycle','dur_trans_on_foot','dur_trans_static','is_moving','dur_audio_InCall','dur_audio_InCommunicaiton','dur_audio_Normal','dur_audio_Ringtone','num_call','dur_ringer_Normal','dur_ringer_Silent','dur_ringer_Vibrate','is_adjusted_ringer','num_switch_apps','freq_switch_apps','num_used_apps','dur_Launcher','dur_IM','dur_SOCIAL','dur_VIDEO_PLAYERS','dur_EVENTS','dur_BROWSER','dur_SYSTEM','dur_SHOPPING','dur_BUSINESS','dur_GAME','dur_TOOLS','dur_PHOTOGRAPHY','dur_PHONE_and_SMS','dur_Stock','dur_MAPS_AND_NAVIGATION','dur_OTHERS'])
    session_id = 0
    start = None
    end = None
    for index, row in data.iterrows():
        data["screen_on_id"][index] = index
        if index > 0:
            data['gap_duration'][index] = (data['start_time'][index] - data['end_time'][index-1]).total_seconds()
            if data['gap_duration'][index] <= threshold: 
                end = data['end_time'][index]
                data["session_id"][index] = session_id
                data["session_start_time"][index] =  start
            else:
                dict = {'start_time': start, 'end_time': end, 'session_id': session_id}
                df = df.append(dict,ignore_index=True)
                start = data['start_time'][index]
                end = data['end_time'][index]
                session_id = session_id + 1
                data["session_id"][index] = session_id
                data["session_start_time"][index] =  start
                
        else:
            start = data['start_time'][index]
            end = data['end_time'][index]
            session_id = 0
            data["session_id"][index] = session_id
            data["session_start_time"][index] =  start

    df['duration'] = (df['end_time']- df['start_time']).dt.total_seconds()
    df['time_from_last_session'] = np.nan
    
    for index, row in df.iterrows():
        df_list = pd.DataFrame
        df_list = data[data['session_id'] == df['session_id'][index]].copy()
        df_list.iloc[0, df_list.columns.get_loc('gap_duration')] = np.nan  
        #print(df_list)
        df["cnt_screen_on"][index] = df_list.shape[0]
        df["freq_screen_on"][index] = df_list.shape[0]/df['duration'][index]
        df["sum_screen_time"][index] = df_list['duration'].sum()
        df["avg_screen_time"][index] = df_list['duration'].mean()
        df["std_screen_time"][index] = df_list['duration'].std()
        df["max_screen_time"][index] = df_list['duration'].max()
        df["min_screen_time"][index] = df_list['duration'].min()
        df["med_screen_time"][index] = df_list['duration'].median()
        
        
        if index > 0:
            df['time_from_last_session'][index] = (df['start_time'][index] - df['end_time'][index-1]).total_seconds()
        
        df_list = df_list.iloc[0:0]  
        #else:
    
    return df,data

def getScreenTime(PID, start, end, disk_engine):
    """
    ---Queries screen time sessions.--- 
    SELECT start_time, end_time 
    FROM _screen_time 
    WHERE _screen_time.PID = ? AND (_screen_time.start_time BETWEEN ? AND ? OR _screen_time.end_time BETWEEN ? AND ?)
    """
    param = (PID,start,end,start,end)
    df_all_screen_on = pd.read_sql_query("SELECT start_time, end_time FROM _screen_time WHERE _screen_time.PID = ? AND (_screen_time.start_time BETWEEN ? AND ? OR _screen_time.end_time BETWEEN ? AND ?)", disk_engine, params=param )
    
    num = df_all_screen_on.shape[0]
    if num== 0:
        """
        ---Queries screen time sessions.--- 
        SELECT start_time, end_time 
        FROM _screen_time 
        WHERE _screen_time.PID = ? AND ? BETWEEN _screen_time.start_time AND _screen_time.end_time;
        """
        param = (PID,start)
        df_all_screen_on = pd.read_sql_query("SELECT start_time, end_time FROM _screen_time WHERE _screen_time.PID = ? AND ? BETWEEN _screen_time.start_time AND _screen_time.end_time;", disk_engine, params=param )
        num = df_all_screen_on.shape[0]
        
        if num== 0:
            return []
        
    df_all_screen_on['start_time'] = pd.to_datetime(df_all_screen_on['start_time'])
    df_all_screen_on['end_time'] = pd.to_datetime(df_all_screen_on['end_time'])
    df_all_screen_on.sort_values(by='start_time')
    # ck start
    sT = df_all_screen_on['start_time'][0]
    target_start_time = datetime.strptime( start , '%Y-%m-%d %H:%M:%S.%f')

    if (target_start_time - sT).total_seconds() > 0:
        eT = df_all_screen_on['end_time'][0]
        df_all_screen_on.at[0,'start_time'] = start
    # ck end
    eT = df_all_screen_on.iloc[-1]['end_time']
    target_end_time = datetime.strptime( end , '%Y-%m-%d %H:%M:%S.%f')
    if (target_end_time - eT).total_seconds() < 0:
        df_all_screen_on.at[num-1,'end_time'] = end
    df_all_screen_on = df_all_screen_on.reindex(columns = df_all_screen_on.columns.tolist() + ['time_from_last_session','cnt_screen_on','freq_screen_on','sum_screen_time','avg_screen_time','std_screen_time','max_screen_time','min_screen_time','med_screen_time','cnt_FOCUSED','cnt_HOVER_ENTER','cnt_CLICKED','cnt_LONG_CLICKED','cnt_SCROLLED','cnt_SELECTED','cnt_TEXT_CHANGED','avg_vol_music','std_vol_music','max_vol_music','min_vol_music','med_vol_music','is_adjusted_vol_music','avg_vol_noti','std_vol_noti','max_vol_noti','min_vol_noti','med_vol_noti','is_adjusted_vol_noti','avg_vol_ring','std_vol_ring','max_vol_ring','min_vol_ring','med_vol_ring','is_adjusted_vol_ring','avg_vol_sys','std_vol_sys','max_vol_sys','min_vol_sys','med_vol_sys','is_adjusted_vol_sys','avg_vol_voicecall','std_vol_voicecall','max_vol_voicecall','min_vol_voicecall','med_vol_voicecall','is_adjusted_vol_voicecall','avg_battery','std_battery','max_battery','min_battery','med_battery','num_charging','dur_network_mobile','dur_network_wifi','dur_network_no_connection','dur_trans_in_vehicle','dur_trans_on_bicycle','dur_trans_on_foot','dur_trans_static','is_moving','dur_audio_InCall','dur_audio_InCommunicaiton','dur_audio_Normal','dur_audio_Ringtone','num_call','dur_ringer_Normal','dur_ringer_Silent','dur_ringer_Vibrate','is_adjusted_ringer','num_switch_apps','freq_switch_apps','num_used apps','dur_Launcher','dur_IM','dur_SOCIAL','dur_VIDEO_PLAYERS','dur_EVENTS','dur_BROWSER','dur_SYSTEM','dur_SHOPPING','dur_BUSINESS','dur_GAME','dur_TOOLS','dur_PHOTOGRAPHY','dur_PHONE_and_SMS','dur_Stock','dur_MAPS_AND_NAVIGATION','dur_OTHERS'])
    return df_all_screen_on

def getScreenTime_Minuku(df, df_screen):
    for index, row in df.iterrows():
        df_list = pd.DataFrame
        df_list = df_screen[(df_screen['start_time'] >= df['start_time'][index]) & (df_screen['start_time'] <= df['record_time'][index])].copy().reset_index()
        if df_list.shape[0] >0:
            df_list.iloc[-1, df_list.columns.get_loc('end_time')] = df['record_time'][index]
            df_list.iloc[0, df_list.columns.get_loc('gap_duration')] = np.nan 
            df_list['duration'] = (df_list['end_time']- df_list['start_time']).dt.total_seconds()

            df["cnt_screen_on"][index] = df_list.shape[0]
            df["freq_screen_on"][index] = df_list.shape[0]/df['use_time'][index]
            df["sum_screen_time"][index] = df_list['duration'].sum()
            df["avg_screen_time"][index] = df_list['duration'].mean()
            df["std_screen_time"][index] = df_list['duration'].std()
            df["max_screen_time"][index] = df_list['duration'].max()
            df["min_screen_time"][index] = df_list['duration'].min()
            df["med_screen_time"][index] = df_list['duration'].median()

            df_list = df_list.iloc[0:0]
    return df


# # Get Minuku , Images, Acc Data

# In[12]:


def getAcc(PID, df_screen_on, disk_engine):
    df_acc=pd.DataFrame()
    for index, row in df_screen_on.iterrows():
        start = df_screen_on['start_time'][index].strftime('%Y-%m-%d %H:%M:%S.%f')
        end = df_screen_on['end_time'][index].strftime('%Y-%m-%d %H:%M:%S.%f')

        
        """
        ---Queries accessibility data.--- 
        SELECT * FROM accessibility 
        WHERE accessibility.PID = ? AND (accessibility.detect_time BETWEEN ? AND ?) 
        AND package != \'labelingStudy.nctu.boredom_detection\'
        """
        df_sp=pd.DataFrame()
        param = (PID,start,end )
        df_sp = pd.read_sql_query("SELECT * FROM accessibility WHERE accessibility.PID = ? AND (accessibility.detect_time BETWEEN ? AND ?) AND package != \'labelingStudy.nctu.boredom_detection\'", disk_engine, params=param )
        
        if df_sp.shape[0] > 0:
            df_sp['session_id'] = df_screen_on['session_id'][index]
            df_sp['screen_on_id'] = df_screen_on['screen_on_id'][index]
            df_acc = pd.concat([df_acc, df_sp], ignore_index=True, sort=False)

    if df_acc.shape[0] > 0:
        df_acc['detect_time'] = pd.to_datetime(df_acc['detect_time'])
        df_acc['type'] = df_acc['type'].astype(str)
    return df_acc

def getPhoneLogNLabels(PID, df_session,  df_screen_on, disk_engine):    
    df_minuku=pd.DataFrame()
    df_minuku_sessions=pd.DataFrame()
    for index, row in df_screen_on.iterrows():
        start = df_screen_on['start_time'][index].strftime('%Y-%m-%d %H:%M:%S')
        end = df_screen_on['end_time'][index].strftime('%Y-%m-%d %H:%M:%S')
        
        """
        ---Queries phone log data.--- 
        SELECT * FROM (
            SELECT t.* , tbl_screenshots.kill_time, tbl_screenshots.is_available, tbl_screenshots.label
            FROM (
                SELECT phone_log.PID,phone_log.record_time,phone_log.screen_status,phone_log.is_charging,phone_log.battery_charging_state,phone_log.battery_level,phone_log.battery_percentage,phone_log.network_type,phone_log.is_connected,phone_log.is_mobile_available,phone_log.is_mobile_connected,phone_log.is_network_available,phone_log.is_wifi_available,phone_log.is_wifi_connected,phone_log.audio_mode,phone_log.ringer_mode,phone_log.strm_vol_music,phone_log.strm_vol_noti,phone_log.strm_vol_ring,phone_log.strm_vol_sys,phone_log.strm_vol_voicecall,phone_log.call_state,phone_log.network_operator,phone_log.phone_signal_type,phone_log.transportation_mode,phone_log.use_time,_app_category.category_group AS fg_app_category_group,_app_category.package AS fg_package,_app_category.category AS fg_app_category,_app_category.app AS fg_app 
                FROM phone_log,_app_category 
                WHERE phone_log.PID = ? AND (phone_log.record_time BETWEEN ? AND ? ) AND _app_category.package = phone_log.fg_package 
            ) t  
            LEFT JOIN (SELECT t.PID,t.record_time, t.kill_time, t.is_available, t.label FROM screenshots t) tbl_screenshots 
            ON t.PID =  tbl_screenshots.PID AND tbl_screenshots.record_time = t.record_time) tbl WHERE tbl.kill_time is not NULL;
        """
        df_sp=pd.DataFrame()
        param = (PID,start,end)
        df_sp = pd.read_sql_query("SELECT * FROM (SELECT t.* , tbl_screenshots.kill_time, tbl_screenshots.is_available, tbl_screenshots.label FROM (SELECT phone_log.PID,phone_log.record_time,phone_log.screen_status,phone_log.is_charging,phone_log.battery_charging_state,phone_log.battery_level,phone_log.battery_percentage,phone_log.network_type,phone_log.is_connected,phone_log.is_mobile_available,phone_log.is_mobile_connected,phone_log.is_network_available,phone_log.is_wifi_available,phone_log.is_wifi_connected,phone_log.audio_mode,phone_log.ringer_mode,phone_log.strm_vol_music,phone_log.strm_vol_noti,phone_log.strm_vol_ring,phone_log.strm_vol_sys,phone_log.strm_vol_voicecall,phone_log.call_state,phone_log.network_operator,phone_log.phone_signal_type,phone_log.transportation_mode,phone_log.use_time,_app_category.category_group AS fg_app_category_group,_app_category.package AS fg_package,_app_category.category AS fg_app_category,_app_category.app AS fg_app  FROM phone_log,_app_category  WHERE phone_log.PID = ? AND (phone_log.record_time BETWEEN ? AND ? ) AND _app_category.package = phone_log.fg_package ) t LEFT JOIN (SELECT t.PID,t.record_time, t.kill_time, t.is_available, t.label FROM screenshots t) tbl_screenshots ON t.PID =  tbl_screenshots.PID AND tbl_screenshots.record_time = t.record_time) tbl WHERE tbl.kill_time is not NULL;", disk_engine, params=param )

        if df_sp.shape[0] > 0:
            df_sp['record_time'] = pd.to_datetime(df_sp['record_time'])
            df_sp['session_id'] = df_screen_on['session_id'][index]
            df_sp['screen_on_id'] = df_screen_on['screen_on_id'][index]
            df_sp['session_start_time'] = df_screen_on['session_start_time'][index]
            
            df_sp['gap_duration_last'] = abs(df_sp['record_time'].diff(1).dt.total_seconds())/2
            df_sp['gap_duration_next'] = abs(df_sp['record_time'].diff(-1).dt.total_seconds())/2
            df_sp['gap_duration_last'] = pd.to_timedelta(df_sp['gap_duration_last'],'seconds')
            df_sp['gap_duration_next'] = pd.to_timedelta(df_sp['gap_duration_next'],'seconds')
            
            df_sp['start_time'] = df_sp['record_time']- df_sp['gap_duration_last']
            df_sp['end_time'] = df_sp['record_time']+ df_sp['gap_duration_next']
            
            df_sp['start_time'][0] = df_screen_on['session_start_time'][index]
            df_sp['start_time'] = pd.to_datetime(df_sp['start_time'])
            df_sp['end_time'] = pd.to_datetime(df_sp['end_time'])

            df_minuku = pd.concat([df_minuku, df_sp], ignore_index=True, sort=False)
            #print(df_sp)

    if df_minuku.shape[0] > 0:
        df_minuku = df_minuku.drop_duplicates(subset=['PID','record_time']).reset_index()
        df_minuku_sessions = df_minuku[['PID','record_time', 'session_id','screen_on_id','session_start_time']].copy()
        df_minuku_sessions.rename(columns = {'session_start_time':'start_time'}, inplace = True)
        df_minuku_sessions = df_minuku_sessions.reindex(columns = df_minuku_sessions.columns.tolist() + ['use_time','time_from_last_session','hour','is_weekend','time_of_a_day','cnt_screen_on','freq_screen_on','sum_screen_time','avg_screen_time','std_screen_time','max_screen_time','min_screen_time','med_screen_time','cnt_FOCUSED','freq_FOCUSED','cnt_HOVER_ENTER','freq_HOVER_ENTER','cnt_CLICKED','freq_CLICKED','cnt_LONG_CLICKED','freq_LONG_CLICKED','cnt_SCROLLED','freq_SCROLLED','cnt_SELECTED','freq_SELECTED','cnt_TEXT_CHANGED','freq_TEXT_CHANGED','avg_vol_music','std_vol_music','max_vol_music','min_vol_music','med_vol_music','is_adjusted_vol_music','avg_vol_noti','std_vol_noti','max_vol_noti','min_vol_noti','med_vol_noti','is_adjusted_vol_noti','avg_vol_ring','std_vol_ring','max_vol_ring','min_vol_ring','med_vol_ring','is_adjusted_vol_ring','avg_vol_sys','std_vol_sys','max_vol_sys','min_vol_sys','med_vol_sys','is_adjusted_vol_sys','avg_vol_voicecall','std_vol_voicecall','max_vol_voicecall','min_vol_voicecall','med_vol_voicecall','is_adjusted_vol_voicecall','avg_battery','std_battery','max_battery','min_battery','med_battery','num_charging','sum_charging_time','dur_network_mobile','dur_network_wifi','dur_network_no_connection','dur_trans_in_vehicle','dur_trans_on_bicycle','dur_trans_on_foot','dur_trans_static','is_moving','dur_audio_InCall','dur_audio_InCommunicaiton','dur_audio_Normal','dur_audio_Ringtone','num_call','dur_ringer_Normal','dur_ringer_Silent','dur_ringer_Vibrate','is_adjusted_ringer','num_switch_apps','freq_switch_apps','num_used_apps','dur_Launcher','dur_IM','dur_SOCIAL','dur_VIDEO_PLAYERS','dur_EVENTS','dur_BROWSER','dur_SYSTEM','dur_SHOPPING','dur_BUSINESS','dur_GAME','dur_TOOLS','dur_PHOTOGRAPHY','dur_PHONE_and_SMS','dur_Stock','dur_MAPS_AND_NAVIGATION','dur_OTHERS'])
    
    df_minuku_full =pd.DataFrame()
    for index, row in df_session.iterrows():
        start = df_session['start_time'][index].strftime('%Y-%m-%d %H:%M:%S')
        end = df_session['end_time'][index].strftime('%Y-%m-%d %H:%M:%S')
        
        """
        ---Queries phone log data.--- 
        SELECT * FROM (
            SELECT t.* , tbl_screenshots.kill_time, tbl_screenshots.is_available, tbl_screenshots.label
            FROM (
                SELECT phone_log.PID,phone_log.record_time,phone_log.screen_status,phone_log.is_charging,phone_log.battery_charging_state,phone_log.battery_level,phone_log.battery_percentage,phone_log.network_type,phone_log.is_connected,phone_log.is_mobile_available,phone_log.is_mobile_connected,phone_log.is_network_available,phone_log.is_wifi_available,phone_log.is_wifi_connected,phone_log.audio_mode,phone_log.ringer_mode,phone_log.strm_vol_music,phone_log.strm_vol_noti,phone_log.strm_vol_ring,phone_log.strm_vol_sys,phone_log.strm_vol_voicecall,phone_log.call_state,phone_log.network_operator,phone_log.phone_signal_type,phone_log.transportation_mode,phone_log.use_time,_app_category.category_group AS fg_app_category_group,_app_category.package AS fg_package,_app_category.category AS fg_app_category,_app_category.app AS fg_app 
                FROM phone_log,_app_category 
                WHERE phone_log.PID = ? AND (phone_log.record_time BETWEEN ? AND ? ) AND _app_category.package = phone_log.fg_package 
            ) t  
            LEFT JOIN (SELECT t.PID,t.record_time, t.kill_time, t.is_available, t.label FROM screenshots t) tbl_screenshots 
            ON t.PID =  tbl_screenshots.PID AND tbl_screenshots.record_time = t.record_time) tbl WHERE tbl.kill_time is not NULL;
        """
        df_sp=pd.DataFrame()
        param = (PID,start[0:19],end[0:19])
        df_sp = pd.read_sql_query("SELECT * FROM (SELECT t.* , tbl_screenshots.kill_time, tbl_screenshots.is_available, tbl_screenshots.label FROM (SELECT phone_log.PID,phone_log.record_time,phone_log.screen_status,phone_log.is_charging,phone_log.battery_charging_state,phone_log.battery_level,phone_log.battery_percentage,phone_log.network_type,phone_log.is_connected,phone_log.is_mobile_available,phone_log.is_mobile_connected,phone_log.is_network_available,phone_log.is_wifi_available,phone_log.is_wifi_connected,phone_log.audio_mode,phone_log.ringer_mode,phone_log.strm_vol_music,phone_log.strm_vol_noti,phone_log.strm_vol_ring,phone_log.strm_vol_sys,phone_log.strm_vol_voicecall,phone_log.call_state,phone_log.network_operator,phone_log.phone_signal_type,phone_log.transportation_mode,phone_log.use_time,_app_category.category_group AS fg_app_category_group,_app_category.package AS fg_package,_app_category.category AS fg_app_category,_app_category.app AS fg_app  FROM phone_log,_app_category  WHERE phone_log.PID = ? AND (phone_log.record_time BETWEEN ? AND ? ) AND _app_category.package = phone_log.fg_package ) t LEFT JOIN (SELECT t.PID,t.record_time, t.kill_time, t.is_available, t.label FROM screenshots t) tbl_screenshots ON t.PID =  tbl_screenshots.PID AND tbl_screenshots.record_time = t.record_time) tbl WHERE tbl.kill_time is not NULL;", disk_engine, params=param )
        
        if df_sp.shape[0] > 0:
            df_sp['record_time'] = pd.to_datetime(df_sp['record_time'])
            df_sp['session_id'] = df_session['session_id'][index]
            df_sp['gap_duration_last'] = abs(df_sp['record_time'].diff(1).dt.total_seconds())/2
            df_sp['gap_duration_next'] = abs(df_sp['record_time'].diff(-1).dt.total_seconds())/2
            df_sp['gap_duration_last'] = pd.to_timedelta(df_sp['gap_duration_last'],'seconds')
            df_sp['gap_duration_next'] = pd.to_timedelta(df_sp['gap_duration_next'],'seconds')
            df_sp['start_time'] = df_sp['record_time']- df_sp['gap_duration_last']
            df_sp['end_time'] = df_sp['record_time']+ df_sp['gap_duration_next']
            df_sp['start_time'][0] =  df_session['start_time'][index]
            df_sp['start_time'] = pd.to_datetime(df_sp['start_time'])
            df_sp['end_time'] = pd.to_datetime(df_sp['end_time'])
            df_minuku_full = pd.concat([df_minuku_full, df_sp], ignore_index=True, sort=False)
    return df_minuku, df_minuku_full,df_minuku_sessions


# ## Tran, Audio, Ringer, Network, Vol, Battery

# In[13]:


from itertools import groupby 

def getRingerDur(start, end , df_subMinuku, df_minuku_sessions,idx_list):
    item_name = 'ringer_mode'
    item_details = ['Normal','Silent','Vibrate']
    items = ['dur_ringer_Normal','dur_ringer_Silent','dur_ringer_Vibrate','is_adjusted_ringer']
    
    df_period = get_continuous_period_by_item( start, end, df_subMinuku, item_name)
    val = get_item_duration(df_period, item_name,item_details) 

    # is_adjusted_ringer...
    is_adjusted_ringer = None if df_period.shape[0]==0 else 1 if df_period.shape[0] > 1 else 0
            
    val_sessions = val.copy()
    for idx in reversed(idx_list):
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_next'])
        res = [i[0] for i in groupby(list(df_subMinuku[item_name]))] 
        is_adjusted_ringer_session = None if len(res)==0 else 1 if len(res) > 1 else 0
        df_minuku_sessions.iloc[idx, getColumnIdxList(items,df_minuku_sessions)] = val_sessions + [is_adjusted_ringer_session]
        
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_last'])
        df_subMinuku.drop(df_subMinuku.tail(1).index,inplace=True) # drop last n rows

    return items, val+ [is_adjusted_ringer],df_minuku_sessions

def getNetworkDur(start, end , df_subMinuku,df_minuku_sessions,idx_list):
    item_name = 'network'
    item_details = ['mobile','wifi','no_connection']
    items = ['dur_network_mobile','dur_network_wifi','dur_network_no_connection']
    
    df_subMinuku[item_name] = None
    df_subMinuku[item_name].iloc[df_subMinuku['is_mobile_connected']==1] ='mobile'
    df_subMinuku[item_name].iloc[df_subMinuku['is_wifi_connected']==1] ='wifi'
    df_subMinuku[item_name].iloc[df_subMinuku['is_connected']==0] ='no_connection'
    
    df_period = get_continuous_period_by_item( start, end, df_subMinuku, item_name)

    val = get_item_duration(df_period, item_name,item_details) 
    
    val_sessions = val.copy()
    for idx in reversed(idx_list):
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_next'])
    
        df_minuku_sessions.iloc[idx, getColumnIdxList(items,df_minuku_sessions)] = val_sessions
        
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_last'])
        df_subMinuku.drop(df_subMinuku.tail(1).index,inplace=True) # drop last n rows
    return items, val,df_minuku_sessions

def getTranDur(start, end , df_subMinuku,df_minuku_sessions,idx_list):
    item_name = 'transportation_mode'
    item_details = ['in_vehicle','on_bicycle','on_foot','static']
    items = ['dur_trans_in_vehicle','dur_trans_on_bicycle','dur_trans_on_foot','dur_trans_static','is_moving']
    
    df_period = get_continuous_period_by_item( start, end, df_subMinuku, item_name)
    val = get_item_duration(df_period, item_name,item_details) 

    # is_moving...
    is_moving = None
    if val[0] != None:
        if val[0] > val[3] or val[1]> val[3] or val[2]> val[3]:
            is_moving = 1
        else:
            is_moving = 0
            
    val_sessions = val.copy()
    for idx in reversed(idx_list):
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_next'])
        is_moving_sessions = None
        if val_sessions[0] != None:
            if val_sessions[0] > val_sessions[3] or val_sessions[1]> val_sessions[3] or val_sessions[2]> val_sessions[3]:
                is_moving_sessions = 1
            else:
                is_moving_sessions = 0        
        df_minuku_sessions.iloc[idx, getColumnIdxList(items,df_minuku_sessions)] = val_sessions + [is_moving_sessions]
        
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_last'])
        df_subMinuku.drop(df_subMinuku.tail(1).index,inplace=True) # drop last n rows

    return items, val+ [is_moving],df_minuku_sessions

def getAudioDur(start, end , df_subMinuku,df_minuku_sessions,idx_list):
    item_name = 'audio_mode'
    item_details = ['InCall','InCommunicaiton','Normal','Ringtone']
    items = ['dur_audio_InCall','dur_audio_InCommunicaiton','dur_audio_Normal','dur_audio_Ringtone', 'num_call']
    
    df_period = get_continuous_period_by_item(start, end, df_subMinuku, item_name)
    val = get_item_duration(df_period, item_name,item_details) 
   
    # num_call...
    num_call = None
    if df_period.shape[0] > 0:
        df_talking = df_period.apply(lambda row: row[df_period[item_name].isin(['InCall','InCommunicaiton'])])
        num_call = df_talking.shape[0]

    val_sessions = val.copy()
    
    for idx in reversed(idx_list):
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_next'])

        res = [i[0] for i in groupby(list(df_subMinuku[item_name]))] 
        num_call_sessions = None if len(res) == 0 else res.count('InCall') + res.count('InCommunicaiton')

        df_minuku_sessions.iloc[idx, getColumnIdxList(items,df_minuku_sessions)] = val_sessions + [num_call_sessions]
        
        val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_last'])
        df_subMinuku.drop(df_subMinuku.tail(1).index,inplace=True) # drop last n rows

    return items, val + [num_call],df_minuku_sessions


def getDur_VolAndBattery(df, filter_name, df_minuku, df_minuku_sessions):
    items_name = ['strm_vol_music','strm_vol_noti','strm_vol_ring','strm_vol_sys','strm_vol_voicecall','battery_level']
    items_vol = ['vol_music','vol_noti','vol_ring','vol_sys','vol_voicecall','battery']
 
    if df_minuku.shape[0] > 0:
        for index, row in df.iterrows():
            item_list = []
            val_list = []
            
            df_subMinuku = pd.DataFrame()
            df_subMinuku = df_minuku[df_minuku[filter_name] == df[filter_name][index]].copy()
            if df_subMinuku.shape[0] > 0:
                idx_list = list(df_subMinuku.index.values)

                df_subMinuku= df_subMinuku.reset_index()
                df_subMinuku.iloc[0, df_subMinuku.columns.get_loc('start_time')] = df['start_time'][index]
                df_subMinuku.iloc[-1, df_subMinuku.columns.get_loc('end_time')] = df['end_time'][index]
                
                tmp = pd.DataFrame()
                tmp['gap_duration_last'] = (df_subMinuku['record_time']-df_subMinuku['start_time']).dt.total_seconds()
                tmp['gap_duration_next'] = (df_subMinuku['end_time']-df_subMinuku['record_time']).dt.total_seconds()

                df_subMinuku['gap_duration_last'] = df_subMinuku['gap_duration_last'].dt.total_seconds()
                df_subMinuku['gap_duration_next'] = df_subMinuku['gap_duration_next'].dt.total_seconds()
                df_subMinuku.iloc[list(df_subMinuku.index.values)[0], df_subMinuku.columns.get_loc('gap_duration_last')] =  tmp.iloc[0]['gap_duration_last']
                df_subMinuku.iloc[-1, df_subMinuku.columns.get_loc('gap_duration_next')] =  tmp.iloc[-1]['gap_duration_next']
                tmp = tmp.iloc[0:0]
                
                df_subMinuku['duration'] = (df_subMinuku['end_time']-df_subMinuku['start_time']).dt.total_seconds()
                #print(df_subMinuku)
                #df_subMinuku = df_subMinuku.reset_index()
                # audio_mode
                items, val, df_minuku_sessions = getAudioDur( df['start_time'][index],df['end_time'][index], df_subMinuku.copy(), df_minuku_sessions,idx_list)
                #print(val)
                item_list += items
                val_list+=val

                # transportation_mode
                items, val, df_minuku_sessions = getTranDur( df['start_time'][index],df['end_time'][index], df_subMinuku.copy(), df_minuku_sessions,idx_list)
                item_list += items
                val_list+=val

                # network
                items, val, df_minuku_sessions = getNetworkDur( df['start_time'][index],df['end_time'][index], df_subMinuku.copy(), df_minuku_sessions,idx_list)
                item_list += items
                val_list+=val

                # network
                items, val, df_minuku_sessions = getRingerDur( df['start_time'][index],df['end_time'][index], df_subMinuku.copy(), df_minuku_sessions,idx_list)
                item_list += items
                val_list+=val

                df.iloc[index, getColumnIdxList(item_list,df)] = val_list

                
                # VolAndBattery
                for ele in ['avg_','std_','max_','min_','med_','is_adjusted_']:
                    item_tmp = []

                    for item in items_vol:
                        item_tmp.append(ele+item)
                    
                    if 'avg' in ele:
                        df.iloc[index, getColumnIdxList(item_tmp,df)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].mean().values] 
                    elif 'std' in ele:
                        df.iloc[index, getColumnIdxList(item_tmp,df)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].std().values]
                    elif 'max' in ele:
                        df.iloc[index, getColumnIdxList(item_tmp,df)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].max().values]
                    elif 'min' in ele:
                        df.iloc[index, getColumnIdxList(item_tmp,df)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].min().values]
                    elif 'med' in ele:
                        df.iloc[index, getColumnIdxList(item_tmp,df)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].median().values]
                    elif 'is_adjusted_' in ele:
                        sub_items_name = items_name.copy()
                        sub_items_name.pop()
                        item_tmp.pop()
                        df.iloc[index, getColumnIdxList(item_tmp,df)] = [int(x) if x !=None else None for x in (df_subMinuku[sub_items_name].nunique()>1).values]
                
                df_period = get_continuous_period_by_item( df['start_time'][index], df['end_time'][index], df_subMinuku, 'is_charging')
                item_details = [0,1]
                item_name = 'is_charging'
                val_sessions = get_item_duration(df_period, item_name,item_details) 
                df.iloc[index,df.columns.get_loc('num_charging')]= len(df_period[df_period[item_name]==1])
                df.iloc[index,df.columns.get_loc('sum_charging_time')] = df_period[df_period[item_name]==1]['duration'].sum()
                items_for_update = ['num_charging','sum_charging_time']
                for idx in reversed(idx_list):
                    val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_next'])
                    res = [i[0] for i in groupby(list(df_subMinuku[item_name]))] 
                    num_charging = None if len(res) == 0 else res.count(1)
                    df_minuku_sessions.iloc[idx, getColumnIdxList(items_for_update,df_minuku_sessions)] = [num_charging,val_sessions[item_details.index(1)]]

                    for ele in ['avg_','std_','max_','min_','med_','is_adjusted_']:
                        item_tmp = []

                        for item in items_vol:
                            item_tmp.append(ele+item)

                        if 'avg' in ele:
                            df_minuku_sessions.iloc[idx, getColumnIdxList(item_tmp,df_minuku_sessions)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].mean().values] 
                        elif 'std' in ele:
                            df_minuku_sessions.iloc[idx, getColumnIdxList(item_tmp,df_minuku_sessions)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].std().values]
                        elif 'max' in ele:
                            df_minuku_sessions.iloc[idx, getColumnIdxList(item_tmp,df_minuku_sessions)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].max().values]
                        elif 'min' in ele:
                            df_minuku_sessions.iloc[idx, getColumnIdxList(item_tmp,df_minuku_sessions)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].min().values]
                        elif 'med' in ele:
                            df_minuku_sessions.iloc[idx, getColumnIdxList(item_tmp,df_minuku_sessions)] = [float(x) if x !=None else None for x in df_subMinuku[items_name].median().values]
                        elif 'is_adjusted_' in ele:
                            sub_items_name = items_name.copy()
                            sub_items_name.pop()
                            item_tmp.pop()
                            df_minuku_sessions.iloc[idx, getColumnIdxList(item_tmp,df_minuku_sessions)] = [int(x) if x !=None else None for x in (df_subMinuku[sub_items_name].nunique()>1).values]

                    
                    
                    val_sessions[item_details.index(df_subMinuku.iloc[-1][item_name])] -=(df_subMinuku.iloc[-1]['gap_duration_last'])
                    df_subMinuku.drop(df_subMinuku.tail(1).index,inplace=True) # drop last n rows

                df_subMinuku = df_subMinuku.iloc[0:0]
    return df, df_minuku_sessions


# # Foreground Apps 

# # Acc

# In[18]:


def getAccFeatures(df, filter_name, df_acc, df_minuku,  df_minuku_sessions):
    item_name = 'type'
    item_name_detail = ['TYPE_VIEW_FOCUSED','TYPE_VIEW_HOVER_ENTER','TYPE_VIEW_CLICKED','TYPE_VIEW_LONG_CLICKED','TYPE_VIEW_SCROLLED','TYPE_VIEW_SELECTED','TYPE_VIEW_TEXT_CHANGED']
    items = ['FOCUSED','HOVER_ENTER','CLICKED','LONG_CLICKED','SCROLLED','SELECTED','TEXT_CHANGED']
    
    if df_acc.shape[0] > 0:
        for index, row in df.iterrows():
            df_subAcc = pd.DataFrame
            df_subAcc = df_acc[df_acc[filter_name] == df[filter_name][index]].copy()
            if df_minuku.shape[0] > 0:
                df_subMinuku_tmp = df_minuku[df_minuku[filter_name] == df[filter_name][index]].copy()
                idx_list = list(df_subMinuku_tmp.index.values)
            df_subAcc = df_subAcc.reset_index()
            session_duration = df['duration'][index]
            if df_subAcc.shape[0] > 0:
                for idx_item in range(len(items)):
                    df_acc_action = pd.DataFrame
                    df_acc_action = (df_subAcc[df_subAcc[item_name].str.contains(item_name_detail[idx_item])]).copy().sort_values(by='detect_time').reset_index()
                    df_acc_tmp = df_acc_action.copy()
                    if len(df_acc_action) > 1: 
                        df_acc_action['gap_duration'] = df_acc_action['detect_time'].diff().dt.total_seconds()
                        #df_acc_action = df_acc_action.drop([0])
                        for ele in ['cnt_']:
                            item_tmp =[ele+items[idx_item]]
                            if 'avg' in ele:
                                df.iloc[index, df.columns.get_loc(ele+items[idx_item])] = df_acc_action['gap_duration'].mean(skipna=True)
                            elif 'std' in ele:
                                df.iloc[index, df.columns.get_loc(ele+items[idx_item])] = df_acc_action['gap_duration'].std(skipna=True)
                            elif 'max' in ele:
                                df.iloc[index, df.columns.get_loc(ele+items[idx_item])] = float(df_acc_action['gap_duration'].max(skipna=True))
                            elif 'min' in ele:
                                df.iloc[index, df.columns.get_loc(ele+items[idx_item])] = float(df_acc_action['gap_duration'].min(skipna=True))
                            elif 'med' in ele:
                                df.iloc[index, df.columns.get_loc(ele+items[idx_item])] = float(df_acc_action['gap_duration'].median(skipna=True))
                            elif 'cnt' in ele:
                                df.iloc[index, df.columns.get_loc(ele+items[idx_item])]=len(df_acc_action)
                    else:
                        df.iloc[index, df.columns.get_loc('cnt_'+items[idx_item])]=len(df_acc_action)
                    df.iloc[index, df.columns.get_loc('freq_'+items[idx_item])]=float(len(df_acc_action)/session_duration)
                    
                    if df_minuku.shape[0] > 0:
                        if df_subMinuku_tmp.shape[0] > 0:
                            df_subMinuku = df_subMinuku_tmp.copy()
                            df_acc_tmp = df_acc_action.copy()
                            for idx in reversed(idx_list):
                                #print(df_subMinuku.tail(1)['record_time'])
                                #print(df_acc_tmp['detect_time'])
                                if len(df_acc_tmp) > 1: 
                                    for ele in ['cnt_']:
                                        item_tmp =[ele+items[idx_item]]
                                        if 'avg' in ele:
                                            df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc(ele+items[idx_item])] = df_acc_tmp['gap_duration'].mean(skipna=True)
                                        elif 'std' in ele:
                                            df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc(ele+items[idx_item])] = df_acc_tmp['gap_duration'].std(skipna=True)
                                        elif 'max' in ele:
                                            df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc(ele+items[idx_item])] = float(df_acc_tmp['gap_duration'].max(skipna=True))
                                        elif 'min' in ele:
                                            df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc(ele+items[idx_item])] = float(df_acc_tmp['gap_duration'].min(skipna=True))
                                        elif 'med' in ele:
                                            df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc(ele+items[idx_item])] = float(df_acc_tmp['gap_duration'].median(skipna=True))
                                        elif 'cnt' in ele:
                                            df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc(ele+items[idx_item])]=len(df_acc_tmp)
                                else:
                                    df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc('cnt_'+items[idx_item])]=len(df_acc_tmp)
                                df_minuku_sessions.iloc[idx, df_minuku_sessions.columns.get_loc('freq_'+items[idx_item])]=float(len(df_acc_tmp)/df_minuku_sessions.iloc[idx]['use_time'])

                                df_subMinuku.drop(df_subMinuku.tail(1).index,inplace=True) # drop last n rows
                                if df_subMinuku.shape[0]>0:
                                    if df_acc_tmp[(df_acc_tmp['detect_time'] > df_subMinuku.iloc[-1]['record_time'])].shape[0]>0:
                                        df_acc_tmp.drop(df_acc_tmp[(df_acc_tmp['detect_time'] > df_subMinuku.iloc[-1]['record_time'])].index,inplace=True) # drop last n rows
                        
            if df_minuku.shape[0] > 0:
                df_subMinuku_tmp = df_subMinuku_tmp.iloc[0:0]       
            df_subAcc = df_subAcc.iloc[0:0]  
    return df, df_minuku_sessions


# # Others

# In[19]:


def range_combine(starts, ends):
    combines = []
    for start, end in zip(starts, ends):
        if not combines or start > combines[-1][1]:
            combines.append([start, end])
        else:
            combines[-1][1] = max(combines[-1][1], end)
    return combines

def getColumnIdxList(col_list, df):
    output = []
    for col in col_list:
        output.append(df.columns.get_loc(col))
    return output

def get_item_duration(df,item_name, item_details):
    result = []
    if df.shape[0] == 0:
        for idx in range(len(item_details)):
            result.append(None)
        return result
    else:
        df_sum= df.groupby([item_name])['duration'].agg('sum').reset_index()
        for item in item_details:
            duration = 0.0 if df_sum[df_sum[item_name] == item].shape[0] == 0 else df_sum[df_sum[item_name] == item].iloc[0]['duration']
            result.append(duration)
        return result

def get_continuous_period_by_item(start, end, df, item_name ):
    df_result = pd.DataFrame(columns = ['start_time', 'end_time', item_name])
    if df.shape[0] > 0:
        df = df[['record_time','start_time','end_time', item_name]]
        df.iloc[df.index.argmin(), df.columns.get_loc('start_time')] = start
        df.iloc[-1, df.columns.get_loc('end_time')] = end
        df_result = df

        df_result = (df_result.groupby(item_name).apply(lambda df_result: range_combine(df_result['start_time'],df_result['end_time'])).explode().apply(pd.Series, index =['start_time','end_time'])).sort_values(by='start_time').reset_index()
        df_result['duration'] = (df_result['end_time']-df_result['start_time']).dt.total_seconds()
        df_result = df_result.reset_index(drop=True)
    return  df_result


# In[20]:


def accumulateDur(val, val1):
    if val[0] == None:
        return val1
    else:
        if val1[0] == None:
            return val
        else:
            return np.sum([val,val1],axis=0).tolist()
        
def getFgAppDur_screen_off(df, df_screen, df_minuku, df_minuku_sessions):
    item_name = 'fg_app_category_group'
    item_details = ['Launcher','IM','SOCIAL','VIDEO_PLAYERS','EVENTS','BROWSER','SYSTEM','SHOPPING','BUSINESS','GAME','TOOLS','PHOTOGRAPHY','PHONE_and_SMS','Stock','MAPS_AND_NAVIGATION','OTHERS']
    items = ['dur_Launcher','dur_IM','dur_SOCIAL','dur_VIDEO_PLAYERS','dur_EVENTS','dur_BROWSER','dur_SYSTEM','dur_SHOPPING','dur_BUSINESS','dur_GAME','dur_TOOLS','dur_PHOTOGRAPHY','dur_PHONE_and_SMS','dur_Stock','dur_MAPS_AND_NAVIGATION','dur_OTHERS']
    
    df_period = pd.DataFrame(columns = ['start_time', 'end_time', item_name])

    if df_minuku.shape[0] > 0:        
        for index_s, row_s in df.iterrows():
            df_subScreen = pd.DataFrame
            df_subScreen = df_screen[df_screen['session_id'] == df['session_id'][index_s]].copy().reset_index()
            accumulateDurList = []
            for idx in range(len(item_details)):
                accumulateDurList.append(None)
            
            
            fg_app_list = []
            idx_list = []
            for index, row in df_subScreen.iterrows():
                df_subMinuku = pd.DataFrame
    
                df_subMinuku = df_minuku[df_minuku['screen_on_id'] == df_subScreen['screen_on_id'][index]].copy()
                
                if df_subMinuku.shape[0] > 0:
                    idx_list += list(df_subMinuku.index.values)
                    fg_app_list += list(df_subMinuku['fg_app'])
                    df_subMinuku = df_subMinuku.reset_index()
                    #print(df_subMinuku)
                    df_subMinuku.iloc[0, df_subMinuku.columns.get_loc('start_time')] =  df_subScreen['start_time'][index]                
                    df_period = get_continuous_period_by_item( df_subScreen['start_time'][index],df_subScreen['end_time'][index], df_subMinuku, item_name)
                    val = get_item_duration(df_period, item_name,item_details) 
                    accumulateDurList = accumulateDur(accumulateDurList,val)
                df_subMinuku = df_subMinuku.iloc[0:0]  
                
            df.iloc[index_s, getColumnIdxList(items,df)] = accumulateDurList

            #num_switch_apps
            #num_used_apps
            df_subMinuku = pd.DataFrame
            df_subMinuku = df_minuku[df_minuku['session_id'] == df['session_id'][index_s]].copy().reset_index()
            if df_subMinuku.shape[0] > 0:
                df_subMinuku.iloc[0, df_subMinuku.columns.get_loc('start_time')] =  df['start_time'][index_s]
                df_period = get_continuous_period_by_item( df['start_time'][index_s], df['end_time'][index_s], df_subMinuku, 'fg_app')
                #df_period = df_period[df_period['fg_app'] == df['session_id'][index_s]]

                num_switch_apps = None
                num_used_apps = None
                if df_period.shape[0] > 0:
                    df_exclude_launcher = df_period.apply(lambda row: row[~df_period['fg_app'].isin(['Quickstep','System UI','ZenUI 桌面','懸浮球','Pixel 啟動器','Sense 首頁','第二螢幕','平行空間(原雙開大師)','系統桌面','懸浮球','系統桌面','Samsung DeX 系統使用者介面','One UI 首頁','Xperia主畫面','多視窗模式開關','Xperia主畫面','Xperia主畫面','Swiftly switch'])])
                    num_switch_apps = df_exclude_launcher.shape[0]
                    if df_exclude_launcher.shape[0] > 0:
                        df_sum = df_exclude_launcher.groupby(['fg_app'])['duration'].agg('sum').reset_index()
                        num_used_apps = df_sum.shape[0]
                    #num_used_apps
                df.iloc[index_s, getColumnIdxList(['num_switch_apps'],df)] = [num_switch_apps]
                if num_switch_apps is None:
                    df.iloc[index_s, getColumnIdxList(['freq_switch_apps'],df)] = [None]
                else:
                    df.iloc[index_s, getColumnIdxList(['freq_switch_apps'],df)] = [(num_switch_apps/df['sum_screen_time'][index_s])]
                df.iloc[index_s, getColumnIdxList(['num_used_apps'],df)] = [num_used_apps]
            
            
            for idx in reversed(idx_list):
                tmp_list = fg_app_list.copy()
                tmp_list = [e for e in tmp_list if e not in ('Quickstep','System UI','ZenUI 桌面','懸浮球','Pixel 啟動器','Sense 首頁','第二螢幕','平行空間(原雙開大師)','系統桌面','懸浮球','系統桌面','Samsung DeX 系統使用者介面','One UI 首頁','Xperia主畫面','多視窗模式開關','Xperia主畫面','Xperia主畫面','Swiftly switch')]
                res = [i[0] for i in groupby(tmp_list)] 
                #print(res)
                num_switch_apps = None if len(res) == 0 else len(res)
                
                df_minuku_sessions.iloc[idx, getColumnIdxList(['num_switch_apps'],df_minuku_sessions)] = [num_switch_apps]
                fg_app_list.pop()
            
            df_subScreen = df_subScreen.iloc[0:0]  
            df_subMinuku = df_subMinuku.iloc[0:0]  
    return df, df_minuku_sessions

def getFgAppDur_screen_off_Minuku(df, df_screen, df_minuku):
    item_name = 'fg_app_category_group'
    item_details = ['Launcher','IM','SOCIAL','VIDEO_PLAYERS','EVENTS','BROWSER','SYSTEM','SHOPPING','BUSINESS','GAME','TOOLS','PHOTOGRAPHY','PHONE_and_SMS','Stock','MAPS_AND_NAVIGATION','OTHERS']
    items = ['dur_Launcher','dur_IM','dur_SOCIAL','dur_VIDEO_PLAYERS','dur_EVENTS','dur_BROWSER','dur_SYSTEM','dur_SHOPPING','dur_BUSINESS','dur_GAME','dur_TOOLS','dur_PHOTOGRAPHY','dur_PHONE_and_SMS','dur_Stock','dur_MAPS_AND_NAVIGATION','dur_OTHERS']
    
    df_period = pd.DataFrame(columns = ['start_time', 'end_time', item_name])
    if df_minuku.shape[0] > 0:        
        for index_s, row_s in df.iterrows():
            df_subScreen = pd.DataFrame
            df_subScreen = df_screen[(df_screen['start_time'] >= df['start_time'][index_s]) & (df_screen['start_time'] <= df['record_time'][index_s])].copy()
            if df_subScreen.shape[0] ==0:
                continue
            df_subScreen.iloc[-1, df_subScreen.columns.get_loc('end_time')] = df['record_time'][index_s]
            
            accumulateDurList = []
            for idx in range(len(item_details)):
                accumulateDurList.append(None)
                
            for index, row in df_subScreen.iterrows():
                df_subMinuku = pd.DataFrame
                df_subMinuku = df_minuku[(df_minuku['record_time'] >= df_subScreen['start_time'][index]) & (df_minuku['record_time'] <= df_subScreen['end_time'][index])].copy()
                if df_subMinuku.shape[0] ==0:
                    continue
                df_subMinuku['gap_duration_last'] = abs(df_subMinuku['record_time'].diff(1).dt.total_seconds())/2
                df_subMinuku['gap_duration_next'] = abs(df_subMinuku['record_time'].diff(-1).dt.total_seconds())/2
                df_subMinuku['gap_duration_last'] = pd.to_timedelta(df_subMinuku['gap_duration_last'],'seconds')
                df_subMinuku['gap_duration_next'] = pd.to_timedelta(df_subMinuku['gap_duration_next'],'seconds')
                df_subMinuku['start_time'] = df_subMinuku['record_time']- df_subMinuku['gap_duration_last']
                df_subMinuku['end_time'] = df_subMinuku['record_time']+ df_subMinuku['gap_duration_next']
                df_subMinuku.iloc[df.index.argmin(), df_subMinuku.columns.get_loc('start_time')] = df_subScreen['start_time'][index]
            
                df_period = get_continuous_period_by_item( df_subScreen['start_time'][index],df_subScreen['end_time'][index], df_subMinuku, item_name)
                val = get_item_duration(df_period, item_name,item_details) 
                accumulateDurList = accumulateDur(accumulateDurList,val)
                df_subMinuku = df_subMinuku.iloc[0:0]
                
            df.iloc[index_s, getColumnIdxList(items,df)] = accumulateDurList

            #num_switch_apps
            #num_used_apps
            df_subMinuku = pd.DataFrame
            df_subMinuku = df_minuku[(df_minuku['record_time'] >= df['start_time'][index_s]) & (df_minuku['record_time'] <= df['record_time'][index_s])].copy()
            df_subMinuku['gap_duration_last'] = abs(df_subMinuku['record_time'].diff(1).dt.total_seconds())/2
            df_subMinuku['gap_duration_next'] = abs(df_subMinuku['record_time'].diff(-1).dt.total_seconds())/2
            df_subMinuku['gap_duration_last'] = pd.to_timedelta(df_subMinuku['gap_duration_last'],'seconds')
            df_subMinuku['gap_duration_next'] = pd.to_timedelta(df_subMinuku['gap_duration_next'],'seconds')
            df_subMinuku['start_time'] = df_subMinuku['record_time']- df_subMinuku['gap_duration_last']
            df_subMinuku['end_time'] = df_subMinuku['record_time']+ df_subMinuku['gap_duration_next']
            df_subMinuku.iloc[df.index.argmin(), df_subMinuku.columns.get_loc('start_time')] = df['start_time'][index_s]

            df_period = get_continuous_period_by_item( df['start_time'][index_s], df['record_time'][index_s], df_subMinuku, 'fg_app')
            #df_period = df_period[df_period['fg_app'] == df['session_id'][index_s]]

            num_switch_apps = None
            num_used_apps = None
            if df_period.shape[0] > 0:
                df_exclude_launcher = df_period.apply(lambda row: row[~df_period['fg_app'].isin(['Quickstep','System UI','ZenUI 桌面','懸浮球','Pixel 啟動器','Sense 首頁','第二螢幕','平行空間(原雙開大師)','系統桌面','懸浮球','系統桌面','Samsung DeX 系統使用者介面','One UI 首頁','Xperia主畫面','多視窗模式開關','Xperia主畫面','Xperia主畫面','Swiftly switch'])])
                num_switch_apps = df_exclude_launcher.shape[0]
                if df_exclude_launcher.shape[0] > 0:
                    df_sum = df_exclude_launcher.groupby(['fg_app'])['duration'].agg('sum').reset_index()
                    num_used_apps = df_sum.shape[0]
                #num_used_apps
            df.iloc[index_s, getColumnIdxList(['num_switch_apps'],df)] = [num_switch_apps]
            if num_switch_apps is None:
                df.iloc[index_s, getColumnIdxList(['freq_switch_apps'],df)] = [None]
            else:
                df.iloc[index_s, getColumnIdxList(['freq_switch_apps'],df)] = [(num_switch_apps/df['sum_screen_time'][index_s])]
            df.iloc[index_s, getColumnIdxList(['num_used_apps'],df)] = [num_used_apps]
            
            df_subScreen = df_subScreen.iloc[0:0]
            df_subMinuku = df_subMinuku.iloc[0:0]

            
    return df


# In[27]:


THRESHOLD = 45


conn = sqlite3.connect(DB_PATH)
runUsers = select_all_users(conn)

for PID in runUsers:
    # remove old data
    cur = conn.cursor()
    cur.execute("DELETE FROM _sessions where PID=?;",(PID,))
    conn.commit()

    cur = conn.cursor()
    cur.execute("DELETE FROM _minuku_sessions where PID=?;",(PID,))
    conn.commit()

    """
    ---Queries data records by user --- 
    SELECT * FROM user_experiment 
    WHERE user_experiment.PID = ? AND start_time is not NULL;    
    """
    param = (PID,)
    df_date = pd.read_sql_query("SELECT * FROM user_experiment WHERE user_experiment.PID = ? AND start_time is not NULL", disk_engine, params=param )


    num1 = df_date.shape[0]
    record = []
    for index, row in df_date.iterrows():
        day = df_date['date'][index]
        print(day)
        sT = day + ' 05:00:00.000'
        eT = (datetime.strptime( day , '%Y-%m-%d') + timedelta(days=1)).strftime('%Y-%m-%d') + ' 04:59:59.999'
        df_screen_time = getScreenTime(PID,sT,eT, disk_engine) 

        if not df_screen_time.empty:
            df,df_screen_time = getSessions(PID, df_screen_time, THRESHOLD)
            df_minuku, df_full_minuku, df_minuku_sessions = getPhoneLogNLabels(PID, df, df_screen_time, disk_engine)

            if df_minuku_sessions.shape[0]>0:
                df_minuku_sessions = getScreenTime_Minuku(df_minuku_sessions,df_screen_time)
                df_minuku_sessions['use_time'] = (df_minuku_sessions['record_time']-df_minuku_sessions['start_time']).dt.total_seconds()

            df, df_minuku_sessions = getDur_VolAndBattery(df, 'session_id', df_minuku, df_minuku_sessions) # Tran, Audio, Ringer, Network, VolAndBattery

            df, df_minuku_sessions = getFgAppDur_screen_off(df, df_screen_time,df_minuku, df_minuku_sessions)


            df_acc = getAcc(PID,df_screen_time, disk_engine)
            df, df_minuku_sessions = getAccFeatures(df, 'session_id', df_acc, df_minuku, df_minuku_sessions)

            if df_minuku_sessions.shape[0]>0:
                df_minuku_sessions = getFgAppDur_screen_off_Minuku(df_minuku_sessions, df_screen_time,df_minuku)

                df_minuku_sessions['freq_screen_on'] = df_minuku_sessions['cnt_screen_on']/df_minuku_sessions['use_time']
                df_minuku_sessions['freq_switch_apps'] = df_minuku_sessions['num_switch_apps']/df_minuku_sessions['sum_screen_time']
                df_minuku_sessions['PID'] = PID
                df_minuku_sessions['date']=day
                df_minuku_sessions['record_time'] = df_minuku_sessions['record_time'].dt.strftime('%Y-%m-%d %H:%M:%S')
                df_minuku_sessions['start_time'] = df_minuku_sessions['start_time'].dt.strftime('%Y-%m-%d %H:%M:%S.%f')
                df_minuku_sessions = df_minuku_sessions.drop(columns=['session_id','screen_on_id'])
                df_minuku_sessions.to_sql('_minuku_sessions', con=disk_engine, if_exists='append', index=False)

            df['PID'] = PID
            df['date']=day
            df['start_time'] = df['start_time'].dt.strftime('%Y-%m-%d %H:%M:%S.%f')
            df['end_time'] = df['end_time'].dt.strftime('%Y-%m-%d %H:%M:%S.%f')

            df = df.drop(columns=['session_id'])

            df.to_sql('_sessions', con=disk_engine, if_exists='append', index=False)



cur = conn.cursor()
cur.execute("Update _sessions SET hour = strftime('%H', _sessions.start_time);")
conn.commit()

cur = conn.cursor()
cur.execute("Update _sessions SET is_weekend = (case when strftime('%w', _sessions.start_time) in ('0', '6') then 1 else 0 end);")
conn.commit()

cur = conn.cursor()
cur.execute("Update _sessions SET time_of_a_day = (CASE    WHEN strftime('%H', _sessions.start_time) in ('05', '06', '07', '08') THEN 0   WHEN strftime('%H', _sessions.start_time) in ('09', '10', '11', '12') THEN 1   WHEN strftime('%H', _sessions.start_time) in ('13', '14', '15', '16') THEN 2   WHEN strftime('%H', _sessions.start_time) in ('17', '18', '19', '20') THEN 3   WHEN strftime('%H', _sessions.start_time) in ('21', '22', '23', '00') THEN 4   ELSE 5 END);")
conn.commit()

cur = conn.cursor()
cur.execute("Update _minuku_sessions SET hour = strftime('%H', _minuku_sessions.record_time);")
conn.commit()

cur = conn.cursor()
cur.execute("Update _minuku_sessions SET is_weekend = (case when strftime('%w', _minuku_sessions.record_time) in ('0', '6') then 1 else 0 end);")
conn.commit()

cur = conn.cursor()
cur.execute("Update _minuku_sessions SET time_of_a_day = (CASE    WHEN strftime('%H', _minuku_sessions.record_time) in ('05', '06', '07', '08') THEN 0   WHEN strftime('%H', _minuku_sessions.record_time) in ('09', '10', '11', '12') THEN 1   WHEN strftime('%H', _minuku_sessions.record_time) in ('13', '14', '15', '16') THEN 2   WHEN strftime('%H', _minuku_sessions.record_time) in ('17', '18', '19', '20') THEN 3   WHEN strftime('%H', _minuku_sessions.record_time) in ('21', '22', '23', '00') THEN 4   ELSE 5 END);")
conn.commit()


cur = conn.cursor()
cur.execute("UPDATE _minuku_sessions SET (time_from_last_session) = (tbl.time_from_last_session) FROM (SELECT  _minuku_sessions.PID , _minuku_sessions.record_time,_minuku_sessions.date,  _sessions.time_from_last_session FROM _minuku_sessions, _sessions where _sessions.PID = _minuku_sessions.PID AND _sessions.start_time = _minuku_sessions.start_time AND _sessions.date = _minuku_sessions.date ) tbl WHERE tbl.PID = _minuku_sessions.PID AND tbl.record_time = _minuku_sessions.record_time AND tbl.date = _minuku_sessions.date;")
conn.commit()

cur = conn.cursor()
cur.execute("DELETE FROM _phone_log ")
conn.commit()

cur = conn.cursor()
cur.execute("INSERT INTO _phone_log (PID, record_time, screen_status, fg_package, fg_app, fg_app_category, is_charging, battery_charging_state, battery_level, battery_percentage, network_type, is_connected, is_mobile_available, is_mobile_connected, is_network_available, is_wifi_available, is_wifi_connected, audio_mode, ringer_mode, strm_vol_music, strm_vol_noti, strm_vol_ring, strm_vol_sys, strm_vol_voicecall, call_state, network_operator, phone_signal_type, transportation_mode, use_time, TYPE_VIEW_FOCUSED_30, TYPE_VIEW_HOVER_ENTER_30, TYPE_VIEW_CLICKED_30, TYPE_VIEW_LONG_CLICKED_30, TYPE_VIEW_SCROLLED_30, TYPE_VIEW_SELECTED_30, TYPE_VIEW_TEXT_CHANGED_30, TYPE_VIEW_FOCUSED_60, TYPE_VIEW_HOVER_ENTER_60, TYPE_VIEW_CLICKED_60, TYPE_VIEW_LONG_CLICKED_60, TYPE_VIEW_SCROLLED_60, TYPE_VIEW_SELECTED_60, TYPE_VIEW_TEXT_CHANGED_60, TYPE_VIEW_FOCUSED_180, TYPE_VIEW_HOVER_ENTER_180, TYPE_VIEW_CLICKED_180, TYPE_VIEW_LONG_CLICKED_180, TYPE_VIEW_SCROLLED_180, TYPE_VIEW_SELECTED_180, TYPE_VIEW_TEXT_CHANGED_180, TYPE_VIEW_FOCUSED_300, TYPE_VIEW_HOVER_ENTER_300, TYPE_VIEW_CLICKED_300, TYPE_VIEW_LONG_CLICKED_300, TYPE_VIEW_SCROLLED_300, TYPE_VIEW_SELECTED_300, TYPE_VIEW_TEXT_CHANGED_300, TYPE_VIEW_FOCUSED_600, TYPE_VIEW_HOVER_ENTER_600, TYPE_VIEW_CLICKED_600, TYPE_VIEW_LONG_CLICKED_600, TYPE_VIEW_SCROLLED_600, TYPE_VIEW_SELECTED_600, TYPE_VIEW_TEXT_CHANGED_600, TYPE_VIEW_FOCUSED_900, TYPE_VIEW_HOVER_ENTER_900, TYPE_VIEW_CLICKED_900, TYPE_VIEW_LONG_CLICKED_900, TYPE_VIEW_SCROLLED_900, TYPE_VIEW_SELECTED_900, TYPE_VIEW_TEXT_CHANGED_900, TYPE_VIEW_FOCUSED_1800, TYPE_VIEW_HOVER_ENTER_1800, TYPE_VIEW_CLICKED_1800, TYPE_VIEW_LONG_CLICKED_1800, TYPE_VIEW_SCROLLED_1800, TYPE_VIEW_SELECTED_1800, TYPE_VIEW_TEXT_CHANGED_1800, TYPE_VIEW_FOCUSED_3600, TYPE_VIEW_HOVER_ENTER_3600, TYPE_VIEW_CLICKED_3600, TYPE_VIEW_LONG_CLICKED_3600, TYPE_VIEW_SCROLLED_3600, TYPE_VIEW_SELECTED_3600, TYPE_VIEW_TEXT_CHANGED_3600, ACTION_SCREEN_ON_180, ACTION_SCREEN_ON_300, ACTION_SCREEN_ON_600, ACTION_SCREEN_ON_900, ACTION_SCREEN_ON_1800, ACTION_SCREEN_ON_3600, kill_time, is_available, file_name, orientation, ITV_30, combine_30s, session_use_time, time_from_last_session, hour, is_weekend, time_of_a_day, cnt_screen_on, freq_screen_on, sum_screen_time, avg_screen_time, std_screen_time, max_screen_time, min_screen_time, med_screen_time, cnt_FOCUSED, freq_FOCUSED, cnt_HOVER_ENTER, freq_HOVER_ENTER, cnt_CLICKED, freq_CLICKED, cnt_LONG_CLICKED, freq_LONG_CLICKED, cnt_SCROLLED, freq_SCROLLED, cnt_SELECTED, freq_SELECTED, cnt_TEXT_CHANGED, freq_TEXT_CHANGED, avg_vol_music, std_vol_music, max_vol_music, min_vol_music, med_vol_music, is_adjusted_vol_music, avg_vol_noti, std_vol_noti, max_vol_noti, min_vol_noti, med_vol_noti, is_adjusted_vol_noti, avg_vol_ring, std_vol_ring, max_vol_ring, min_vol_ring, med_vol_ring, is_adjusted_vol_ring, avg_vol_sys, std_vol_sys, max_vol_sys, min_vol_sys, med_vol_sys, is_adjusted_vol_sys, avg_vol_voicecall, std_vol_voicecall, max_vol_voicecall, min_vol_voicecall, med_vol_voicecall, is_adjusted_vol_voicecall, avg_battery, std_battery, max_battery, min_battery, med_battery, num_charging, sum_charging_time, dur_network_mobile, dur_network_wifi, dur_network_no_connection, dur_trans_in_vehicle, dur_trans_on_bicycle, dur_trans_on_foot, dur_trans_static, is_moving, dur_audio_InCall, dur_audio_InCommunicaiton, dur_audio_Normal, dur_audio_Ringtone, num_call, dur_ringer_Normal, dur_ringer_Silent, dur_ringer_Vibrate, is_adjusted_ringer, num_switch_apps, freq_switch_apps, num_used_apps, dur_Launcher, dur_IM, dur_SOCIAL, dur_VIDEO_PLAYERS, dur_EVENTS, dur_BROWSER, dur_SYSTEM, dur_SHOPPING, dur_BUSINESS, dur_GAME, dur_TOOLS, dur_PHOTOGRAPHY, dur_PHONE_and_SMS, dur_Stock, dur_MAPS_AND_NAVIGATION, dur_OTHERS) SELECT phone_log.*, _action_count.TYPE_VIEW_FOCUSED_30, _action_count.TYPE_VIEW_HOVER_ENTER_30, _action_count.TYPE_VIEW_CLICKED_30, _action_count.TYPE_VIEW_LONG_CLICKED_30, _action_count.TYPE_VIEW_SCROLLED_30, _action_count.TYPE_VIEW_SELECTED_30, _action_count.TYPE_VIEW_TEXT_CHANGED_30, _action_count.TYPE_VIEW_FOCUSED_60, _action_count.TYPE_VIEW_HOVER_ENTER_60, _action_count.TYPE_VIEW_CLICKED_60, _action_count.TYPE_VIEW_LONG_CLICKED_60, _action_count.TYPE_VIEW_SCROLLED_60, _action_count.TYPE_VIEW_SELECTED_60, _action_count.TYPE_VIEW_TEXT_CHANGED_60, _action_count.TYPE_VIEW_FOCUSED_180, _action_count.TYPE_VIEW_HOVER_ENTER_180, _action_count.TYPE_VIEW_CLICKED_180, _action_count.TYPE_VIEW_LONG_CLICKED_180, _action_count.TYPE_VIEW_SCROLLED_180, _action_count.TYPE_VIEW_SELECTED_180, _action_count.TYPE_VIEW_TEXT_CHANGED_180, _action_count.TYPE_VIEW_FOCUSED_300, _action_count.TYPE_VIEW_HOVER_ENTER_300, _action_count.TYPE_VIEW_CLICKED_300, _action_count.TYPE_VIEW_LONG_CLICKED_300, _action_count.TYPE_VIEW_SCROLLED_300, _action_count.TYPE_VIEW_SELECTED_300, _action_count.TYPE_VIEW_TEXT_CHANGED_300, _action_count.TYPE_VIEW_FOCUSED_600, _action_count.TYPE_VIEW_HOVER_ENTER_600, _action_count.TYPE_VIEW_CLICKED_600, _action_count.TYPE_VIEW_LONG_CLICKED_600, _action_count.TYPE_VIEW_SCROLLED_600, _action_count.TYPE_VIEW_SELECTED_600, _action_count.TYPE_VIEW_TEXT_CHANGED_600, _action_count.TYPE_VIEW_FOCUSED_900, _action_count.TYPE_VIEW_HOVER_ENTER_900, _action_count.TYPE_VIEW_CLICKED_900, _action_count.TYPE_VIEW_LONG_CLICKED_900, _action_count.TYPE_VIEW_SCROLLED_900, _action_count.TYPE_VIEW_SELECTED_900, _action_count.TYPE_VIEW_TEXT_CHANGED_900, _action_count.TYPE_VIEW_FOCUSED_1800, _action_count.TYPE_VIEW_HOVER_ENTER_1800, _action_count.TYPE_VIEW_CLICKED_1800, _action_count.TYPE_VIEW_LONG_CLICKED_1800, _action_count.TYPE_VIEW_SCROLLED_1800, _action_count.TYPE_VIEW_SELECTED_1800, _action_count.TYPE_VIEW_TEXT_CHANGED_1800, _action_count.TYPE_VIEW_FOCUSED_3600, _action_count.TYPE_VIEW_HOVER_ENTER_3600, _action_count.TYPE_VIEW_CLICKED_3600, _action_count.TYPE_VIEW_LONG_CLICKED_3600, _action_count.TYPE_VIEW_SCROLLED_3600, _action_count.TYPE_VIEW_SELECTED_3600, _action_count.TYPE_VIEW_TEXT_CHANGED_3600, _action_count.ACTION_SCREEN_ON_180, _action_count.ACTION_SCREEN_ON_300, _action_count.ACTION_SCREEN_ON_600, _action_count.ACTION_SCREEN_ON_900, _action_count.ACTION_SCREEN_ON_1800, _action_count.ACTION_SCREEN_ON_3600,  screenshots.kill_time, screenshots.is_available, screenshots.file_name, screenshots.orientation, _screenshots_validation.ITV_30, _screenshots_validation.combine_30s,  _minuku_sessions.use_time AS session_use_time, _minuku_sessions.time_from_last_session, _minuku_sessions.hour, _minuku_sessions.is_weekend, _minuku_sessions.time_of_a_day, _minuku_sessions.cnt_screen_on, _minuku_sessions.freq_screen_on, _minuku_sessions.sum_screen_time, _minuku_sessions.avg_screen_time, _minuku_sessions.std_screen_time, _minuku_sessions.max_screen_time, _minuku_sessions.min_screen_time, _minuku_sessions.med_screen_time, _minuku_sessions.cnt_FOCUSED, _minuku_sessions.freq_FOCUSED, _minuku_sessions.cnt_HOVER_ENTER, _minuku_sessions.freq_HOVER_ENTER, _minuku_sessions.cnt_CLICKED, _minuku_sessions.freq_CLICKED, _minuku_sessions.cnt_LONG_CLICKED, _minuku_sessions.freq_LONG_CLICKED, _minuku_sessions.cnt_SCROLLED, _minuku_sessions.freq_SCROLLED, _minuku_sessions.cnt_SELECTED, _minuku_sessions.freq_SELECTED, _minuku_sessions.cnt_TEXT_CHANGED, _minuku_sessions.freq_TEXT_CHANGED, _minuku_sessions.avg_vol_music, _minuku_sessions.std_vol_music, _minuku_sessions.max_vol_music, _minuku_sessions.min_vol_music, _minuku_sessions.med_vol_music, _minuku_sessions.is_adjusted_vol_music, _minuku_sessions.avg_vol_noti, _minuku_sessions.std_vol_noti, _minuku_sessions.max_vol_noti, _minuku_sessions.min_vol_noti, _minuku_sessions.med_vol_noti, _minuku_sessions.is_adjusted_vol_noti, _minuku_sessions.avg_vol_ring, _minuku_sessions.std_vol_ring, _minuku_sessions.max_vol_ring, _minuku_sessions.min_vol_ring, _minuku_sessions.med_vol_ring, _minuku_sessions.is_adjusted_vol_ring, _minuku_sessions.avg_vol_sys, _minuku_sessions.std_vol_sys, _minuku_sessions.max_vol_sys, _minuku_sessions.min_vol_sys, _minuku_sessions.med_vol_sys, _minuku_sessions.is_adjusted_vol_sys, _minuku_sessions.avg_vol_voicecall, _minuku_sessions.std_vol_voicecall, _minuku_sessions.max_vol_voicecall, _minuku_sessions.min_vol_voicecall, _minuku_sessions.med_vol_voicecall, _minuku_sessions.is_adjusted_vol_voicecall, _minuku_sessions.avg_battery, _minuku_sessions.std_battery, _minuku_sessions.max_battery, _minuku_sessions.min_battery, _minuku_sessions.med_battery, _minuku_sessions.num_charging, _minuku_sessions.sum_charging_time, _minuku_sessions.dur_network_mobile, _minuku_sessions.dur_network_wifi, _minuku_sessions.dur_network_no_connection, _minuku_sessions.dur_trans_in_vehicle, _minuku_sessions.dur_trans_on_bicycle, _minuku_sessions.dur_trans_on_foot, _minuku_sessions.dur_trans_static, _minuku_sessions.is_moving, _minuku_sessions.dur_audio_InCall, _minuku_sessions.dur_audio_InCommunicaiton, _minuku_sessions.dur_audio_Normal, _minuku_sessions.dur_audio_Ringtone, _minuku_sessions.num_call, _minuku_sessions.dur_ringer_Normal, _minuku_sessions.dur_ringer_Silent, _minuku_sessions.dur_ringer_Vibrate, _minuku_sessions.is_adjusted_ringer, _minuku_sessions.num_switch_apps, _minuku_sessions.freq_switch_apps, _minuku_sessions.num_used_apps, _minuku_sessions.dur_Launcher, _minuku_sessions.dur_IM, _minuku_sessions.dur_SOCIAL, _minuku_sessions.dur_VIDEO_PLAYERS, _minuku_sessions.dur_EVENTS, _minuku_sessions.dur_BROWSER, _minuku_sessions.dur_SYSTEM, _minuku_sessions.dur_SHOPPING, _minuku_sessions.dur_BUSINESS, _minuku_sessions.dur_GAME, _minuku_sessions.dur_TOOLS, _minuku_sessions.dur_PHOTOGRAPHY, _minuku_sessions.dur_PHONE_and_SMS, _minuku_sessions.dur_Stock, _minuku_sessions.dur_MAPS_AND_NAVIGATION, _minuku_sessions.dur_OTHERS FROM screenshots, phone_log, _screenshots_validation, _action_count, _minuku_sessions WHERE screenshots.PID = phone_log.PID AND screenshots.record_time = phone_log.record_time AND screenshots.is_uploaded = 1 AND screenshots.PID = _screenshots_validation.PID AND screenshots.record_time = _screenshots_validation.record_time AND _screenshots_validation.ITV_30 = 7 AND _action_count.PID = phone_log.PID AND _action_count.record_time = phone_log.record_time AND _minuku_sessions.PID = phone_log.PID AND _minuku_sessions.record_time = phone_log.record_time AND NOT EXISTS (SELECT * FROM (SELECT * FROM (SELECT phone_log.PID, phone_log.record_time, user_experiment.start_time, user_experiment.valid_time FROM phone_log LEFT JOIN user_experiment ON user_experiment.PID = phone_log.PID AND user_experiment.date = substr(phone_log.record_time, 1, 10)) tbl_b WHERE tbl_b.record_time >= tbl_b.start_time AND tbl_b.record_time < tbl_b.valid_time) tbl_a WHERE phone_log.PID = tbl_a.PID AND phone_log.record_time = tbl_a.record_time)")
conn.commit()

conn.close()
now = datetime.now()
current_time = now.strftime("%H:%M:%S")
print("The End Time =", current_time)

