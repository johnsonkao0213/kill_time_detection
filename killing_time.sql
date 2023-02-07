BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "_app_category" (
	"package"	TEXT,
	"app"	TEXT,
	"type"	TEXT,
	"category"	TEXT,
	"category_old"	TEXT,
	"source"	TEXT,
	"google_category"	TEXT,
	"title"	TEXT,
	"category_group"	TEXT,
	"category_group1"	TEXT,
	PRIMARY KEY("package")
);
CREATE TABLE IF NOT EXISTS "accessibility" (
	"PID"	TEXT NOT NULL,
	"app"	TEXT,
	"detect_time"	TEXT NOT NULL,
	"package"	TEXT,
	"type"	TEXT NOT NULL,
	PRIMARY KEY("PID","detect_time","type")
);
CREATE TABLE IF NOT EXISTS "user_experiment" (
	"PID"	TEXT NOT NULL,
	"date"	TEXT NOT NULL,
	"start_time"	TEXT,
	"valid_time"	TEXT,
	PRIMARY KEY("PID","date")
);
CREATE TABLE IF NOT EXISTS "intent_action" (
	"PID"	TEXT NOT NULL,
	"detect_time"	TEXT NOT NULL,
	"action"	TEXT NOT NULL,
	PRIMARY KEY("PID","detect_time","action")
);
CREATE TABLE IF NOT EXISTS "_phone_log" (
	"PID"	TEXT NOT NULL,
	"record_time"	TEXT NOT NULL,
	"screen_status"	TEXT,
	"fg_package"	TEXT,
	"fg_app_category"	TEXT,
	"fg_app"	TEXT,
	"is_charging"	INTEGER,
	"battery_charging_state"	TEXT,
	"battery_level"	INTEGER,
	"battery_percentage"	REAL,
	"network_type"	TEXT,
	"is_connected"	INTEGER,
	"is_mobile_available"	INTEGER,
	"is_mobile_connected"	INTEGER,
	"is_network_available"	INTEGER,
	"is_wifi_available"	INTEGER,
	"is_wifi_connected"	INTEGER,
	"audio_mode"	TEXT,
	"ringer_mode"	TEXT,
	"strm_vol_music"	INTEGER,
	"strm_vol_noti"	INTEGER,
	"strm_vol_ring"	INTEGER,
	"strm_vol_sys"	INTEGER,
	"strm_vol_voicecall"	INTEGER,
	"call_state"	INTEGER,
	"network_operator"	TEXT,
	"phone_signal_type"	INTEGER,
	"transportation_mode"	TEXT,
	"use_time"	REAL,
	"TYPE_VIEW_FOCUSED_30"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_30"	INTEGER,
	"TYPE_VIEW_CLICKED_30"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_30"	INTEGER,
	"TYPE_VIEW_SCROLLED_30"	INTEGER,
	"TYPE_VIEW_SELECTED_30"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_30"	INTEGER,
	"TYPE_VIEW_FOCUSED_60"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_60"	INTEGER,
	"TYPE_VIEW_CLICKED_60"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_60"	INTEGER,
	"TYPE_VIEW_SCROLLED_60"	INTEGER,
	"TYPE_VIEW_SELECTED_60"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_60"	INTEGER,
	"TYPE_VIEW_FOCUSED_180"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_180"	INTEGER,
	"TYPE_VIEW_CLICKED_180"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_180"	INTEGER,
	"TYPE_VIEW_SCROLLED_180"	INTEGER,
	"TYPE_VIEW_SELECTED_180"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_180"	INTEGER,
	"TYPE_VIEW_FOCUSED_300"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_300"	INTEGER,
	"TYPE_VIEW_CLICKED_300"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_300"	INTEGER,
	"TYPE_VIEW_SCROLLED_300"	INTEGER,
	"TYPE_VIEW_SELECTED_300"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_300"	INTEGER,
	"TYPE_VIEW_FOCUSED_600"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_600"	INTEGER,
	"TYPE_VIEW_CLICKED_600"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_600"	INTEGER,
	"TYPE_VIEW_SCROLLED_600"	INTEGER,
	"TYPE_VIEW_SELECTED_600"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_600"	INTEGER,
	"TYPE_VIEW_FOCUSED_900"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_900"	INTEGER,
	"TYPE_VIEW_CLICKED_900"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_900"	INTEGER,
	"TYPE_VIEW_SCROLLED_900"	INTEGER,
	"TYPE_VIEW_SELECTED_900"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_900"	INTEGER,
	"TYPE_VIEW_FOCUSED_1800"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_1800"	INTEGER,
	"TYPE_VIEW_CLICKED_1800"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_1800"	INTEGER,
	"TYPE_VIEW_SCROLLED_1800"	INTEGER,
	"TYPE_VIEW_SELECTED_1800"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_1800"	INTEGER,
	"TYPE_VIEW_FOCUSED_3600"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_3600"	INTEGER,
	"TYPE_VIEW_CLICKED_3600"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_3600"	INTEGER,
	"TYPE_VIEW_SCROLLED_3600"	INTEGER,
	"TYPE_VIEW_SELECTED_3600"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_3600"	INTEGER,
	"ACTION_SCREEN_ON_180"	INTEGER,
	"ACTION_SCREEN_ON_300"	INTEGER,
	"ACTION_SCREEN_ON_600"	INTEGER,
	"ACTION_SCREEN_ON_900"	INTEGER,
	"ACTION_SCREEN_ON_1800"	INTEGER,
	"ACTION_SCREEN_ON_3600"	INTEGER,
	"kill_time"	INTEGER,
	"is_available"	INTEGER,
	"file_name"	TEXT,
	"orientation"	INTEGER,
	"ITV_30"	INTEGER,
	"combine_30s"	TEXT,
	"session_use_time"	REAL,
	"time_from_last_session"	FLOAT,
	"hour"	FLOAT,
	"is_weekend"	FLOAT,
	"time_of_a_day"	FLOAT,
	"cnt_screen_on"	FLOAT,
	"freq_screen_on"	FLOAT,
	"sum_screen_time"	FLOAT,
	"avg_screen_time"	FLOAT,
	"std_screen_time"	FLOAT,
	"max_screen_time"	FLOAT,
	"min_screen_time"	FLOAT,
	"med_screen_time"	FLOAT,
	"cnt_FOCUSED"	FLOAT,
	"freq_FOCUSED"	FLOAT,
	"cnt_HOVER_ENTER"	FLOAT,
	"freq_HOVER_ENTER"	FLOAT,
	"cnt_CLICKED"	FLOAT,
	"freq_CLICKED"	FLOAT,
	"cnt_LONG_CLICKED"	FLOAT,
	"freq_LONG_CLICKED"	FLOAT,
	"cnt_SCROLLED"	FLOAT,
	"freq_SCROLLED"	FLOAT,
	"cnt_SELECTED"	FLOAT,
	"freq_SELECTED"	FLOAT,
	"cnt_TEXT_CHANGED"	FLOAT,
	"freq_TEXT_CHANGED"	FLOAT,
	"avg_vol_music"	FLOAT,
	"std_vol_music"	FLOAT,
	"max_vol_music"	FLOAT,
	"min_vol_music"	FLOAT,
	"med_vol_music"	FLOAT,
	"is_adjusted_vol_music"	FLOAT,
	"avg_vol_noti"	FLOAT,
	"std_vol_noti"	FLOAT,
	"max_vol_noti"	FLOAT,
	"min_vol_noti"	FLOAT,
	"med_vol_noti"	FLOAT,
	"is_adjusted_vol_noti"	FLOAT,
	"avg_vol_ring"	FLOAT,
	"std_vol_ring"	FLOAT,
	"max_vol_ring"	FLOAT,
	"min_vol_ring"	FLOAT,
	"med_vol_ring"	FLOAT,
	"is_adjusted_vol_ring"	FLOAT,
	"avg_vol_sys"	FLOAT,
	"std_vol_sys"	FLOAT,
	"max_vol_sys"	FLOAT,
	"min_vol_sys"	FLOAT,
	"med_vol_sys"	FLOAT,
	"is_adjusted_vol_sys"	FLOAT,
	"avg_vol_voicecall"	FLOAT,
	"std_vol_voicecall"	FLOAT,
	"max_vol_voicecall"	FLOAT,
	"min_vol_voicecall"	FLOAT,
	"med_vol_voicecall"	FLOAT,
	"is_adjusted_vol_voicecall"	FLOAT,
	"avg_battery"	FLOAT,
	"std_battery"	FLOAT,
	"max_battery"	FLOAT,
	"min_battery"	FLOAT,
	"med_battery"	FLOAT,
	"num_charging"	FLOAT,
	"sum_charging_time"	FLOAT,
	"dur_network_mobile"	FLOAT,
	"dur_network_wifi"	FLOAT,
	"dur_network_no_connection"	FLOAT,
	"dur_trans_in_vehicle"	FLOAT,
	"dur_trans_on_bicycle"	FLOAT,
	"dur_trans_on_foot"	FLOAT,
	"dur_trans_static"	FLOAT,
	"is_moving"	FLOAT,
	"dur_audio_InCall"	FLOAT,
	"dur_audio_InCommunicaiton"	FLOAT,
	"dur_audio_Normal"	FLOAT,
	"dur_audio_Ringtone"	FLOAT,
	"num_call"	FLOAT,
	"dur_ringer_Normal"	FLOAT,
	"dur_ringer_Silent"	FLOAT,
	"dur_ringer_Vibrate"	FLOAT,
	"is_adjusted_ringer"	FLOAT,
	"num_switch_apps"	FLOAT,
	"freq_switch_apps"	FLOAT,
	"num_used_apps"	FLOAT,
	"dur_Launcher"	FLOAT,
	"dur_IM"	FLOAT,
	"dur_SOCIAL"	FLOAT,
	"dur_VIDEO_PLAYERS"	FLOAT,
	"dur_EVENTS"	FLOAT,
	"dur_BROWSER"	FLOAT,
	"dur_SYSTEM"	FLOAT,
	"dur_SHOPPING"	FLOAT,
	"dur_BUSINESS"	FLOAT,
	"dur_GAME"	FLOAT,
	"dur_TOOLS"	FLOAT,
	"dur_PHOTOGRAPHY"	FLOAT,
	"dur_PHONE_and_SMS"	FLOAT,
	"dur_Stock"	FLOAT,
	"dur_MAPS_AND_NAVIGATION"	FLOAT,
	"dur_OTHERS"	FLOAT,
	PRIMARY KEY("PID","record_time")
);
CREATE TABLE IF NOT EXISTS "phone_log" (
	"PID"	TEXT NOT NULL,
	"record_time"	TEXT NOT NULL,
	"screen_status"	TEXT,
	"fg_package"	TEXT,
	"fg_app_category"	TEXT,
	"fg_app"	TEXT,
	"is_charging"	INTEGER,
	"battery_charging_state"	TEXT,
	"battery_level"	INTEGER,
	"battery_percentage"	REAL,
	"network_type"	TEXT,
	"is_connected"	INTEGER,
	"is_mobile_available"	INTEGER,
	"is_mobile_connected"	INTEGER,
	"is_network_available"	INTEGER,
	"is_wifi_available"	INTEGER,
	"is_wifi_connected"	INTEGER,
	"audio_mode"	TEXT,
	"ringer_mode"	TEXT,
	"strm_vol_music"	FLOAT,
	"strm_vol_noti"	FLOAT,
	"strm_vol_ring"	FLOAT,
	"strm_vol_sys"	FLOAT,
	"strm_vol_voicecall"	FLOAT,
	"call_state"	INTEGER,
	"network_operator"	TEXT,
	"phone_signal_type"	INTEGER,
	"transportation_mode"	TEXT,
	"use_time"	REAL,
	PRIMARY KEY("PID","record_time")
);
CREATE TABLE IF NOT EXISTS "_screenshots_validation" (
	"PID"	TEXT NOT NULL,
	"record_time"	TEXT NOT NULL,
	"ITV_30"	INTEGER,
	"combine_30s"	TEXT,
	PRIMARY KEY("PID","record_time")
);
CREATE TABLE IF NOT EXISTS "screenshots" (
	"PID"	TEXT NOT NULL,
	"record_time"	TEXT NOT NULL,
	"file_name"	TEXT NOT NULL UNIQUE,
	"is_uploaded"	INTEGER NOT NULL,
	"label"	INTEGER,
	"kill_time"	INTEGER,
	"is_available"	INTEGER,
	"orientation"	INTEGER,
	PRIMARY KEY("PID","record_time")
);
CREATE TABLE IF NOT EXISTS "_action_count" (
	"PID"	TEXT NOT NULL,
	"record_time"	TEXT NOT NULL,
	"TYPE_VIEW_FOCUSED_30"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_30"	INTEGER,
	"TYPE_VIEW_CLICKED_30"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_30"	INTEGER,
	"TYPE_VIEW_SCROLLED_30"	INTEGER,
	"TYPE_VIEW_SELECTED_30"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_30"	INTEGER,
	"TYPE_VIEW_FOCUSED_60"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_60"	INTEGER,
	"TYPE_VIEW_CLICKED_60"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_60"	INTEGER,
	"TYPE_VIEW_SCROLLED_60"	INTEGER,
	"TYPE_VIEW_SELECTED_60"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_60"	INTEGER,
	"TYPE_VIEW_FOCUSED_180"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_180"	INTEGER,
	"TYPE_VIEW_CLICKED_180"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_180"	INTEGER,
	"TYPE_VIEW_SCROLLED_180"	INTEGER,
	"TYPE_VIEW_SELECTED_180"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_180"	INTEGER,
	"TYPE_VIEW_FOCUSED_300"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_300"	INTEGER,
	"TYPE_VIEW_CLICKED_300"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_300"	INTEGER,
	"TYPE_VIEW_SCROLLED_300"	INTEGER,
	"TYPE_VIEW_SELECTED_300"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_300"	INTEGER,
	"TYPE_VIEW_FOCUSED_600"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_600"	INTEGER,
	"TYPE_VIEW_CLICKED_600"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_600"	INTEGER,
	"TYPE_VIEW_SCROLLED_600"	INTEGER,
	"TYPE_VIEW_SELECTED_600"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_600"	INTEGER,
	"TYPE_VIEW_FOCUSED_900"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_900"	INTEGER,
	"TYPE_VIEW_CLICKED_900"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_900"	INTEGER,
	"TYPE_VIEW_SCROLLED_900"	INTEGER,
	"TYPE_VIEW_SELECTED_900"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_900"	INTEGER,
	"TYPE_VIEW_FOCUSED_1800"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_1800"	INTEGER,
	"TYPE_VIEW_CLICKED_1800"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_1800"	INTEGER,
	"TYPE_VIEW_SCROLLED_1800"	INTEGER,
	"TYPE_VIEW_SELECTED_1800"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_1800"	INTEGER,
	"TYPE_VIEW_FOCUSED_3600"	INTEGER,
	"TYPE_VIEW_HOVER_ENTER_3600"	INTEGER,
	"TYPE_VIEW_CLICKED_3600"	INTEGER,
	"TYPE_VIEW_LONG_CLICKED_3600"	INTEGER,
	"TYPE_VIEW_SCROLLED_3600"	INTEGER,
	"TYPE_VIEW_SELECTED_3600"	INTEGER,
	"TYPE_VIEW_TEXT_CHANGED_3600"	INTEGER,
	"ACTION_SCREEN_ON_180"	INTEGER,
	"ACTION_SCREEN_ON_300"	INTEGER,
	"ACTION_SCREEN_ON_600"	INTEGER,
	"ACTION_SCREEN_ON_900"	INTEGER,
	"ACTION_SCREEN_ON_1800"	INTEGER,
	"ACTION_SCREEN_ON_3600"	INTEGER,
	PRIMARY KEY("PID","record_time")
);
CREATE TABLE IF NOT EXISTS "_screen_time" (
	"PID"	TEXT NOT NULL,
	"start_time"	TEXT NOT NULL,
	"end_time"	TEXT,
	"duration"	REAL,
	PRIMARY KEY("PID","start_time")
);
CREATE TABLE IF NOT EXISTS "_sessions" (
	"PID"	TEXT NOT NULL,
	"date"	TEXT,
	"start_time"	TEXT NOT NULL,
	"end_time"	TEXT NOT NULL,
	"duration"	FLOAT,
	"time_from_last_session"	FLOAT,
	"hour"	INTEGER,
	"is_weekend"	INTEGER,
	"time_of_a_day"	INTEGER,
	"initial_kill_time"	INTEGER,
	"major_kill_time"	INTEGER,
	"transition_kill_time"	INTEGER,
	"dur_kill_time"	FLOAT,
	"dur_not_kill_time"	FLOAT,
	"initial_label"	INTEGER,
	"major_label"	INTEGER,
	"transition_label"	INTEGER,
	"dur_kill_available"	FLOAT,
	"dur_kill_unavailable"	FLOAT,
	"dur_not_kill_available"	FLOAT,
	"dur_not_kill_unavailable"	FLOAT,
	"dur_unknown"	FLOAT,
	"cnt_screen_on"	INTEGER,
	"freq_screen_on"	FLOAT,
	"sum_screen_time"	FLOAT,
	"avg_screen_time"	FLOAT,
	"std_screen_time"	FLOAT,
	"max_screen_time"	FLOAT,
	"min_screen_time"	FLOAT,
	"med_screen_time"	FLOAT,
	"cnt_FOCUSED"	INTEGER,
	"freq_FOCUSED"	FLOAT,
	"cnt_HOVER_ENTER"	INTEGER,
	"freq_HOVER_ENTER"	FLOAT,
	"cnt_CLICKED"	INTEGER,
	"freq_CLICKED"	FLOAT,
	"cnt_LONG_CLICKED"	INTEGER,
	"freq_LONG_CLICKED"	FLOAT,
	"cnt_SCROLLED"	INTEGER,
	"freq_SCROLLED"	FLOAT,
	"cnt_SELECTED"	INTEGER,
	"freq_SELECTED"	FLOAT,
	"cnt_TEXT_CHANGED"	INTEGER,
	"freq_TEXT_CHANGED"	FLOAT,
	"avg_vol_music"	FLOAT,
	"std_vol_music"	FLOAT,
	"max_vol_music"	FLOAT,
	"min_vol_music"	FLOAT,
	"med_vol_music"	FLOAT,
	"is_adjusted_vol_music"	INTEGER,
	"avg_vol_noti"	FLOAT,
	"std_vol_noti"	FLOAT,
	"max_vol_noti"	FLOAT,
	"min_vol_noti"	FLOAT,
	"med_vol_noti"	FLOAT,
	"is_adjusted_vol_noti"	INTEGER,
	"avg_vol_ring"	FLOAT,
	"std_vol_ring"	FLOAT,
	"max_vol_ring"	FLOAT,
	"min_vol_ring"	FLOAT,
	"med_vol_ring"	FLOAT,
	"is_adjusted_vol_ring"	INTEGER,
	"avg_vol_sys"	FLOAT,
	"std_vol_sys"	FLOAT,
	"max_vol_sys"	FLOAT,
	"min_vol_sys"	FLOAT,
	"med_vol_sys"	FLOAT,
	"is_adjusted_vol_sys"	INTEGER,
	"avg_vol_voicecall"	FLOAT,
	"std_vol_voicecall"	FLOAT,
	"max_vol_voicecall"	FLOAT,
	"min_vol_voicecall"	FLOAT,
	"med_vol_voicecall"	FLOAT,
	"is_adjusted_vol_voicecall"	INTEGER,
	"avg_battery"	FLOAT,
	"std_battery"	FLOAT,
	"max_battery"	FLOAT,
	"min_battery"	FLOAT,
	"med_battery"	FLOAT,
	"num_charging"	INTEGER,
	"sum_charging_time"	FLOAT,
	"dur_network_mobile"	FLOAT,
	"dur_network_wifi"	FLOAT,
	"dur_network_no_connection"	FLOAT,
	"dur_trans_in_vehicle"	FLOAT,
	"dur_trans_on_bicycle"	FLOAT,
	"dur_trans_on_foot"	FLOAT,
	"dur_trans_static"	FLOAT,
	"is_moving"	INTEGER,
	"dur_audio_InCall"	FLOAT,
	"dur_audio_InCommunicaiton"	FLOAT,
	"dur_audio_Normal"	FLOAT,
	"dur_audio_Ringtone"	FLOAT,
	"num_call"	INTEGER,
	"dur_ringer_Normal"	FLOAT,
	"dur_ringer_Silent"	FLOAT,
	"dur_ringer_Vibrate"	FLOAT,
	"is_adjusted_ringer"	INTEGER,
	"num_switch_apps"	INTEGER,
	"freq_switch_apps"	FLOAT,
	"num_used_apps"	INTEGER,
	"dur_Launcher"	FLOAT,
	"dur_IM"	FLOAT,
	"dur_SOCIAL"	FLOAT,
	"dur_VIDEO_PLAYERS"	FLOAT,
	"dur_EVENTS"	FLOAT,
	"dur_BROWSER"	FLOAT,
	"dur_SYSTEM"	FLOAT,
	"dur_SHOPPING"	FLOAT,
	"dur_BUSINESS"	FLOAT,
	"dur_GAME"	FLOAT,
	"dur_TOOLS"	FLOAT,
	"dur_PHOTOGRAPHY"	FLOAT,
	"dur_PHONE_and_SMS"	FLOAT,
	"dur_Stock"	FLOAT,
	"dur_MAPS_AND_NAVIGATION"	FLOAT,
	"dur_OTHERS"	FLOAT,
	PRIMARY KEY("PID","start_time","end_time")
);
CREATE TABLE IF NOT EXISTS "_minuku_sessions" (
	"PID"	TEXT NOT NULL,
	"record_time"	TEXT NOT NULL,
	"date"	TEXT,
	"start_time"	TEXT,
	"use_time"	FLOAT,
	"time_from_last_session"	FLOAT,
	"hour"	INTEGER,
	"is_weekend"	INTEGER,
	"time_of_a_day"	INTEGER,
	"cnt_screen_on"	INTEGER,
	"freq_screen_on"	FLOAT,
	"sum_screen_time"	FLOAT,
	"avg_screen_time"	FLOAT,
	"std_screen_time"	FLOAT,
	"max_screen_time"	FLOAT,
	"min_screen_time"	FLOAT,
	"med_screen_time"	FLOAT,
	"cnt_FOCUSED"	INTEGER,
	"freq_FOCUSED"	FLOAT,
	"cnt_HOVER_ENTER"	INTEGER,
	"freq_HOVER_ENTER"	FLOAT,
	"cnt_CLICKED"	INTEGER,
	"freq_CLICKED"	FLOAT,
	"cnt_LONG_CLICKED"	INTEGER,
	"freq_LONG_CLICKED"	FLOAT,
	"cnt_SCROLLED"	INTEGER,
	"freq_SCROLLED"	FLOAT,
	"cnt_SELECTED"	INTEGER,
	"freq_SELECTED"	FLOAT,
	"cnt_TEXT_CHANGED"	INTEGER,
	"freq_TEXT_CHANGED"	FLOAT,
	"avg_vol_music"	FLOAT,
	"std_vol_music"	FLOAT,
	"max_vol_music"	FLOAT,
	"min_vol_music"	FLOAT,
	"med_vol_music"	FLOAT,
	"is_adjusted_vol_music"	INTEGER,
	"avg_vol_noti"	FLOAT,
	"std_vol_noti"	FLOAT,
	"max_vol_noti"	FLOAT,
	"min_vol_noti"	FLOAT,
	"med_vol_noti"	FLOAT,
	"is_adjusted_vol_noti"	INTEGER,
	"avg_vol_ring"	FLOAT,
	"std_vol_ring"	FLOAT,
	"max_vol_ring"	FLOAT,
	"min_vol_ring"	FLOAT,
	"med_vol_ring"	FLOAT,
	"is_adjusted_vol_ring"	INTEGER,
	"avg_vol_sys"	FLOAT,
	"std_vol_sys"	FLOAT,
	"max_vol_sys"	FLOAT,
	"min_vol_sys"	FLOAT,
	"med_vol_sys"	FLOAT,
	"is_adjusted_vol_sys"	INTEGER,
	"avg_vol_voicecall"	FLOAT,
	"std_vol_voicecall"	FLOAT,
	"max_vol_voicecall"	FLOAT,
	"min_vol_voicecall"	FLOAT,
	"med_vol_voicecall"	FLOAT,
	"is_adjusted_vol_voicecall"	INTEGER,
	"avg_battery"	FLOAT,
	"std_battery"	FLOAT,
	"max_battery"	FLOAT,
	"min_battery"	FLOAT,
	"med_battery"	FLOAT,
	"num_charging"	INTEGER,
	"sum_charging_time"	FLOAT,
	"dur_network_mobile"	FLOAT,
	"dur_network_wifi"	FLOAT,
	"dur_network_no_connection"	FLOAT,
	"dur_trans_in_vehicle"	FLOAT,
	"dur_trans_on_bicycle"	FLOAT,
	"dur_trans_on_foot"	FLOAT,
	"dur_trans_static"	FLOAT,
	"is_moving"	INTEGER,
	"dur_audio_InCall"	FLOAT,
	"dur_audio_InCommunicaiton"	FLOAT,
	"dur_audio_Normal"	FLOAT,
	"dur_audio_Ringtone"	FLOAT,
	"num_call"	INTEGER,
	"dur_ringer_Normal"	FLOAT,
	"dur_ringer_Silent"	FLOAT,
	"dur_ringer_Vibrate"	FLOAT,
	"is_adjusted_ringer"	INTEGER,
	"num_switch_apps"	INTEGER,
	"freq_switch_apps"	FLOAT,
	"num_used_apps"	INTEGER,
	"dur_Launcher"	FLOAT,
	"dur_IM"	FLOAT,
	"dur_SOCIAL"	FLOAT,
	"dur_VIDEO_PLAYERS"	FLOAT,
	"dur_EVENTS"	FLOAT,
	"dur_BROWSER"	FLOAT,
	"dur_SYSTEM"	FLOAT,
	"dur_SHOPPING"	FLOAT,
	"dur_BUSINESS"	FLOAT,
	"dur_GAME"	FLOAT,
	"dur_TOOLS"	FLOAT,
	"dur_PHOTOGRAPHY"	FLOAT,
	"dur_PHONE_and_SMS"	FLOAT,
	"dur_Stock"	FLOAT,
	"dur_MAPS_AND_NAVIGATION"	FLOAT,
	"dur_OTHERS"	FLOAT,
	PRIMARY KEY("PID","record_time")
);
INSERT INTO "_app_category" VALUES ('advanced.scientific.calculator.calc991.plus','CalcES','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Scientific calculator plus advanced 991 calc','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('android','Android System','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('app.cheers','Cheers','APPS','SOCIAL','DATING','GOOGLE-tw','DATING','免費交友Cheers匿名聊天交友app軟體 終結單身乾杯','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('app.estork.info','送子鳥','APPS','MEDICAL','GOOGLE-tw','GOOGLE-tw','MEDICAL','送子鳥','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('app.zenly.locator','Zenly','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','Zenly：你的專屬地圖 你的朋友們','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('badminton.blitz.sports.free.game.android','Badminton Blitz','GAME','GAME_SPORTS','GAME_SPORTS','GOOGLE-tw','GAME_SPORTS','決戰羽毛球 - 免費3D多人體育競技遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('bbc.mobile.news.ww','BBC News','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','BBC News','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('blockpuzzle.new1010.jewelgames.puzzlegames','Block Puzzle New','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','Block Puzzle','GAME',NULL);
INSERT INTO "_app_category" VALUES ('bodyfast.zero.fastingtracker.weightloss','斷食追蹤','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','168 斷食 - 間歇性斷食 零卡路里斷食追蹤 斷食計時器 禁食 減肥','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('cc.forestapp','Forest','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Forest 專注森林','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('cc.pressplay.user','PressPlay Academy','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','PressPlay Academy - 將知識掌握在手中','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('cc.unilife.unilife','UniLife','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','UniLife在地社群資訊平台','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('chiu.hyatt.diningofferstw','美食優惠','APPS','FOOD_AND_DRINK','LIFESTYLE','GOOGLE-tw','LIFESTYLE','美食優惠 (麥當勞 肯德基 漢堡王 星巴克 MOS 全聯 頂好 大潤發 家樂福 愛買 美廉社','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('chk.kingnet.app','今網智生活','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','今網智生活','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('cn.danatech.xingseapp','形色','APPS','EDUCATION','EDUCATION',NULL,'TOOLS','形色 - 拍照識花識別植物','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('cn.orangelab.werewolf','終極狼人殺','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','終極狼人殺-一場遊戲交一群好友','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('cn.uctimes.insight.android','Anonym.Hi','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('cn.wps.moffice_eng','WPS Office','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','WPS Office - 免费的Office编辑器For PDF  Word  Excel&PPT','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('cn.wps.xiaomi.abroad.lite','小米文件檔案檢視器（WPS定制）','APPS','PRODUCTIVITY','PRODUCTIVITY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('co.reality.getrent','LandlordGO','GAME','GAME_BOARD','GAME_BOARD','GOOGLE-tw','GAME_BOARD','LANDLORD GO 房地產大亨.金融遊戲.模擬企業','GAME',NULL);
INSERT INTO "_app_category" VALUES ('code.name.monkey.retromusic','Retro Music','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Retro Music Player MP3 Player','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.abbc45255.emojibyabbc45255','Kaomoji GO','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Kaomoji GOづ(・ω・)づ-顏文字-表情符號','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.accuvally.android.accupass','ACCUPASS','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','SOCIAL','ACCUPASS-活動通 報名售票宣傳管理平台','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.acnh.pocket_guide','ACNH Pocket Guide','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','ACNH Pocket Guide','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.addcn.android.house591','591房屋交易','APPS','HOUSE_AND_HOME','HOUSE_AND_HOME','GOOGLE-tw','HOUSE_AND_HOME','591房屋交易-租屋買屋查房價首選APP','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.addcn.newcar8891','8891汽車','APPS','AUTO_AND_VEHICLES','LIFESTYLE','GOOGLE-tw','LIFESTYLE','8891汽車-買車 先上8891（看車買車賣車 一站式汽車平台 新車 中古車都有 專業可信！）','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.adguard.android','AdGuard','APPS','TOOLS','TOOLS',NULL,NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.adobe.lrmobile','Lightroom','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Adobe Lightroom - 照片編輯工具 & 專業相機','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.adobe.reader','Adobe Acrobat','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Adobe Acrobat Reader: PDF 檢視程式、編輯程式和製作程式','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.adsc.taipeihistoricalmappp','臺北歷史地圖','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','臺北歷史地圖','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.agoda.mobile.consumer','Agoda','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','Agoda','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.airiti.airitireader','Airiti Reader','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','Airiti Reader','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.alfred.parkinglot','停車大聲公','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','停車大聲公','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.alibaba.android.rimet','DingTalk','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','DingTalk','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.aloggers.atimeloggerapp','aTimeLogger','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','aTimeLogger - Time Tracker','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.alphainventor.filemanager','File Manager +','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','檔案管理員','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.alphapotato.pawnshopmaster','PawnShopMaster','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','當鋪達人','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.android.bluetooth','Bluetooth','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.browser','瀏覽器','APPS','BROWSER','BROWSER',NULL,NULL,NULL,'BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.android.calculator2','計算機','APPS','LIFESTYLE','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.calendar','Calendar','APPS','Calendar','PRODUCTIVITY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.camera','相機','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.android.captiveportallogin','CaptivePortalLogin','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.cellbroadcastreceiver','無線緊急警報','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.chrome','Chrome','APPS','BROWSER','BROWSER',NULL,'COMMUNICATION','Google Chrome：速度與安全兼具','BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.android.contacts','電話簿','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.deskclock','時鐘','APPS','Clock','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.documentsui','Files','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.emergency','緊急救援資訊','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.hotwordenrollment.okgoogle','OK Google enrollment','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.htmlviewer','HTML 檢視器','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.incallui','電話','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.keychain','Key Chain','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.launcher3','Quickstep','APPS','Launcher','Launcher',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.android.location.fused','Fused Location','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.mms','簡訊','APPS','PHONE_and_SMS','SMS',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.nfc','NFC','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.phone','電話','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.printspooler','列印多工緩衝處理器','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.blockednumber','Blocked Numbers Storage','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.calendar','Samsung Calendar Storage','APPS','Calendar','PRODUCTIVITY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.contacts','聯絡人儲存空間','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.downloads','下載管理','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.downloads.ui','下載管理','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.media','Media Storage','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','apkcombo',NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.media.module','媒體儲存空間','APPS','VIDEO_PLAYERS',NULL,NULL,NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.providers.userdictionary','使用者字典','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.server.telecom','Telecom Service','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.settings','Settings','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.settings.intelligence','Settings Suggestions','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.shell','殼層','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.smspush','com.android.smspush','APPS','PHONE_and_SMS','SMS','apkcombo',NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.soundrecorder','錄音機','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.systemui','System UI','APPS','Launcher','PERSONALIZATION',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.android.systemui.plugin.globalactions.wallet','Quick Access Wallet UI','APPS','PAY','PAY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.thememanager','個性主題','APPS','PERSONALIZATION','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.updater','系統更新','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.android.vending','Google Play Store','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.android.wallpaper.livepicker','動態桌布選取器','APPS','PERSONALIZATION','PERSONALIZATION','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.andromedagames.hero60global','60秒勇士: 放置型 RPG','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','60秒勇士: 放置型 RPG','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.andymstone.metronome','Metronome Beats','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','節拍器的節拍','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.anue.invest','基金老司機','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','鉅亨基金老司機 – 基金投資人的關鍵工具','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.apalon.weatherlive.free','即時氣象大師','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','即時天氣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.app.dom','達美樂','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','達美樂','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.appautomatic.replaytouch.trial','點擊重播器','APPS','GAME_TOOLS','GAME_TOOLS',NULL,'TOOLS','點擊重播器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.application_4u.qrcode.barcode','QR Scanner','APPS','SYSTEM','TOOLS',NULL,'SHOPPING','QR code掃描器','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.apps.adrcotfas.goodtime','Goodtime','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Minimalist Pomodoro Timer - Goodtime Productivity','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.aptg.gtapp','亞太行動客服','APPS','LIFESTYLE','LIFESTYLE',NULL,'PRODUCTIVITY','亞太電信Gt 行動客服','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.aromaindex.app','芳香索引','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','芳香索引 | 精油用家的芳香療法資料庫 Aroma Index','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ascendik.eyeshield','藍光濾鏡','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','藍光濾鏡-夜間模式解決偏頭痛問題','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.asusincallui','電話','APPS','PHONE_and_SMS','COMMUNICATION',NULL,'PRODUCTIVITY','華碩通話畫面 - 讓您輕鬆撥打電話','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.browsergenie','網頁小幫手','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.calculator','計算機','APPS','LIFESTYLE','TOOLS',NULL,'PRODUCTIVITY','計算機 - 桌面小工具、浮動計算機、單位換算','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.camera','相機','APPS','PHOTOGRAPHY','PHOTOGRAPHY','apktada',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.configupdater','ASUS Config Updater','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.contacts','聯絡人','APPS','PHONE_and_SMS','COMMUNICATION','GOOGLE-tw','COMMUNICATION','ZenUI 撥號器與聯絡人 - 電話簿、通話記錄','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.deskclock','時鐘','APPS','Clock','TOOLS','GOOGLE-tw','TOOLS','華碩時鐘 – 鬧鐘、碼錶、計時器、桌面小工具','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.dialer','電話','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.dm','ASUS System Update Service','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.ephotoburst','快速連拍檢視器','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.filemanager','檔案管理','APPS','SYSTEM','TOOLS','apktada',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.gallery','圖片庫','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','華碩圖片庫','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.ime','ZenUI 鍵盤','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.inadvertentTouch','InadvertentTouch','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.launcher','ZenUI 桌面','APPS','Launcher','Launcher','apktada',NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.maxxaudio.audiowizard','音效魔術師','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.mobilemanager','智能管家','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','智能管家','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.motorservice','Motor Service','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.powersaver','電力達人','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.screenrecorder','螢幕錄影','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.stitchimage','Screenshot+','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.themeapp','主題','APPS','PERSONALIZATION','PERSONALIZATION','GOOGLE-tw','PERSONALIZATION','華碩主題 – 用精緻設計主題展現自己獨特的風格','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.twinapps','應用分身','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.asus.weathertime','天氣','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','華碩天氣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.atpc','AT Player','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','音樂下載器。 MP3播放器。 YouTube 播放器。','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.avg.cleaner','AVG Cleaner','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','AVG Cleaner (免費)：清理、加速器、電池與記憶體提升工具、優化、清理快取','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.avnight','AVnight','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.azure.authenticator','Authenticator','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Microsoft Authenticator','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.baidu.tieba','百度贴吧','APPS','SOCIAL','SOCIAL','apkcombo',NULL,NULL,'SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.bandainamcoent.opbrww','Bounty','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','ONE PIECE Bounty Rush –團隊共鬥對戰動作遊戲–','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.beingame.zc.zombie.shelter.survival','Zero City: 在殭屍世界中生存，即時策略遊戲','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','Zero City: 在殭屍世界中生存，即時策略遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.bgg.jump','Project Makeover','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','Project Makeover','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.bigcake.android.mergemania','合併大師','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','合併大師','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.bilibili.app.in','bilibili','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','bilibili-高畫質無廣告追星動漫都在這','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.binance.dev','幣安','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','Binance Crypto Trading - 比特幣交易和加密貨幣槓桿交易','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.blizzard.wtcg.hearthstone','爐石戰記','GAME','GAME_CARD','GAME_CARD','GOOGLE-tw','GAME_CARD','《爐石戰記》','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.booking','Booking.com','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','Booking.com 全球飯店訂房','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.bork.dsp.datuna','Guitar Tuner, Bass, Violin, Banjo & more | DaTuner','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Guitar Tuner, Bass, Violin, Banjo & more | DaTuner','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.bpmmobile','BPM','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','BPM Supreme','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.bravolol.bravolang.englishchinesecdictionary','Dictionary','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','英漢字典 | 漢英字典: 支援離線英語發音 / English Chinese Dictionary','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.brother.mfc.brprint','iPrint&Scan','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Brother iPrint&Scan','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.busuu.android.enc','博樹Busuu·日語、英語與多國語言學習神器','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','博樹Busuu·日語、英語與多國語言學習神器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.buybuy66.app','擺擺會員','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','擺擺會員 - 好買好賣社群平台','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.byril.seabattle2','Sea Battle 2','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','Sea Battle 2','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.callapp.contacts','CallApp Contacts','APPS','TOOLS','COMMUNICATION','GOOGLE-tw','COMMUNICATION','CallApp來電辨識及防詐騙錄音','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.cama.app','cama café','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','cama café','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.camerasideas.instashot','InShot-視頻編輯','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'PHOTOGRAPHY','InShot - 影片製作 & 影片剪輯 & 影片編輯','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.campmobile.snow','SNOW','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','SNOW','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.carrefour.carrefourapp','家樂福','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','家樂福 Carrefour TW','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.cashbox','錢櫃KTV','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','錢櫃KTV','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cathay.mymobione','國泰優惠','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','國泰優惠－最懂你的生活金融APP','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cathay.securities.mBroker','樹精靈','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','國泰證券樹精靈－證券、期貨、選擇權即時報價、投資下單','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.cathaybk.koko','KOKO','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','KOKO','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cathaybk.mymobibank.android','國泰世華','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','國泰世華網路銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cathaysec.filter','股票快選','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','股票快選 - 籌碼面、技術面、基本面，三大面向跨邏輯選股','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.cbf.payeasystore','PayEasy福利網','APPS','SHOPPING','SHOPPING',NULL,'LIFESTYLE','PayEasy企業福利網','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.cbsinteractive.cnet','CNET: Best Tech News, Reviews, Videos & Deals','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','CNET: Best Tech News, Reviews, Videos & Deals','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cdx.electronicscoding','Electronics Coding','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Electronics Coding','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ceciliawang.app2021071101','APP2021071101','APPS','EDUCATION','EDUCATION',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.chailease.tw.app.android.ccfappcust','零卡分期','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','中租零卡分期','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.changingtec.motp.pro','MOTP Client','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','MOTP Client','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.chinatrust.mobilebank','Home Bank','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','中國信託行動銀行 Home Bank','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.chocolabs.app.chocotv','LINE TV','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','LINE TV 精彩隨看 - 免費追劇線上看','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cht.custservice','中華電信','APPS','LIFESTYLE','TOOLS','GOOGLE-tw','TOOLS','中華電信','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cht.easyrent.irent','iRent','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','iRent自助租車','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.cht.ottPlayer','HamiVideo','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','Hami Video - 電視運動頻道直播+電影戲劇動漫卡通隨選影片線上看','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cinderella.fam','FAM','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','FAM - 創作你的 Live Podcast','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.cisco.webex.meetings','Webex Meet','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Cisco Webex Meetings','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.citibank.mobile.tw','行動生活家','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','花旗行動生活家','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cleanbus','新竹市清潔車','APPS','LIFESTYLE','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','新竹市清運網','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cleanmaster.security','Security Master','APPS','SYSTEM','TOOLS','apktada',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.cloudmobile.einvoice','雲端發票','APPS','FINANCE','FINANCE',NULL,'LIFESTYLE','雲端發票','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.clover.daysmatter','倒數日','APPS','Calendar','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','倒數日 · Days Matter','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.clubhouse.app','Clubhouse','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','Clubhouse: The Social Audio App','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.clue.android','Clue 的經期追踪：經期及排卵計算器','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Clue 的經期追踪：經期及排卵計算器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cmoney.chipk','股市籌碼K線','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','股市籌碼K線','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.cmoney.emilyfixedstock','艾蜜莉定存股','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','艾蜜莉定存股-股市即時報價 台股投資討論 股票便宜價計算 最新財經資訊','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.cmoney.forum','股市爆料同學會','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','股市爆料同學會 - 最優質的股票討論社群','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.cmoney.stockmantalk','股人阿勳','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','股人阿勳-股市價值河流圖│抓出股票潛力股 台股投資討論 圖解財報資訊 行動投資App','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.cmoney.ugly','阿格力','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','阿格力-價值成長股','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.cnn.mobile.android.phone','CNN','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','CNN Breaking US & World News','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cnyes.android','鉅亨網','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','鉅亨網 - 每日必讀財經新聞, 國內外投資產品報價與投資社群討論','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coceany.piggyaccounting','小豬記帳本','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','小豬記帳本 - 理財最快最簡單','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coffeemeetsbagel','Coffee Meets Bagel','APPS','SOCIAL','DATING','GOOGLE-tw','DATING','Coffee Meets Bagel (咖啡遇上貝果)','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.alarmclock','時鐘','APPS','Clock','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.appmanager','常駐程序管理','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.bootreg','開機登錄','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.calculator','計算機','APPS','LIFESTYLE','TOOLS',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.filemanager','檔案管理','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.floatassistant','懸浮球','APPS','Launcher','Launcher',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.gallery3d','相簿','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.gamespaceui','遊戲空間','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.gesture','手勢體感','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.notificationmanager','通知管理','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.oppoguardelf','電池','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.oppomultiapp','應用程式分身','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.phonemanager','手機管家','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.providers.downloads.ui','下載管理','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.safecenter','手機管家應用加密','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.sceneservice','智慧服務','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.screenrecorder','畫面錄製','APPS','VIDEO_EDITOR','VIDEO_EDITOR','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.screenshot','螢幕截圖','APPS','PHOTOGRAPHY','PHOTOGRAPHY','apkcombo',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.securitypermission','手機管家權限管理','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.simsettings','流量管理','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.uxdesign','UXDesign','APPS','EDUCATION','EDUCATION','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.weather2','天氣','APPS','WEATHER','WEATHER',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.widget.smallweather','時鐘（外掛程式）','APPS','Clock','TOOLS',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.coloros.wirelesssettings','無線設定','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.computerlunch.evolution','細胞','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','地球模擬器: 從細胞到奇點 - 演化','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.cookapps.randomroyale','Random Royale','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','幻變皇牌 - 守城遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.cookapps.rogueidle','無賴養成','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','無賴養成：放置型RPG遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.coreplane.badukpop.prod','圍棋氣球','GAME','GAME_BOARD','GAME_BOARD','GOOGLE-tw','GAME_BOARD','圍棋氣球 - 線上對弈 - 死活問題 - 圍棋 AI','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.cosmosbank.bank','凱基行動銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','凱基行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cpc.cpcpay','CPCPay','APPS','PAY','PAY',NULL,'TOOLS','中油Pay','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.csst.ecdict','英漢字典','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','英漢字典 EC Dictionary','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ctappstudio.govjob','事求人','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','事求人 - 提供行政院人事行政總處事求人機關徵才資料','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.cwj.hsing','歡歌KTV','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','歡歌-免費在線K歌 全民音樂交友必備軟體','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cyberlink.powerdirector.DRA140225_01','威力導演','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'VIDEO_PLAYERS','威力導演 - 影片剪輯 & 影片製作','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cyberon.android.voicego','生活行','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','生活行(台鐵公車發票樂透電影國道天氣)VoiceGO','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.d8aspring.surveyon','surveyon','APPS','CROWDSCOURCING','CROWDSCOURCING','GOOGLE-tw','SOCIAL','surveyon - 現金、問卷、樂趣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.dailylife.communication','日常','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','日常 - 我的日記','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.dbs.cardplus.tw','星展Card+','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','星展 Card+ TW','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.dcard.freedom','Dcard X','APPS','SOCIAL','SOCIAL',NULL,NULL,NULL,'SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.ddim.happygo','HAPPY GO','APPS','PAY','PAY',NULL,'LIFESTYLE','HAPPY GO','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ddpowers.uupon','UUPON','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','UUPON優惠多點‧生活滿點','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.deltapath.frsipMobile','Deltapath Mobile','APPS','IM','IM',NULL,'COMMUNICATION','Deltapath Mobile','IM',NULL);
INSERT INTO "_app_category" VALUES ('com.dena.a12026418','Pokémon Masters EX','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','Pokémon Masters EX','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.denachina.g23002013.android','灌籃高手 SLAM DUNK','GAME','GAME_SPORTS','GAME_SPORTS','GOOGLE-tw','GAME_SPORTS','灌籃高手 SLAM DUNK','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.dencreak.dlcalculator','萬能計算機','APPS','LIFESTYLE','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','萬能計算機：多合一計算機','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.devsisters.gb','跑跑薑餅人：烤箱大逃亡','GAME','GAME_ARCADE','GAME_ARCADE','GOOGLE-tw','GAME_ARCADE','跑跑薑餅人：烤箱大逃亡','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.dianping.v1','Dianping','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','大众点评','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.digibites.accubattery','AccuBattery','APPS','SYSTEM','SYSTEM',NULL,'TOOLS','Accu​Battery - 電池 - 省電','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.digibites.calendar','DigiCal 日曆 中文行事曆','APPS','Calendar','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','DigiCal 日曆 中文行事曆','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.diotek.sec.lookup.dictionary','字典','APPS','EDUCATION','EDUCATION',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.direk.android.ntpc','公務雲','APPS','BUSINESS','BUSINESS',NULL,NULL,NULL,'BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.discord','Discord','APPS','SOCIAL','SOCIAL',NULL,'COMMUNICATION','Discord - 聊天、視訊通話以及與好友聚會','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.djages.taipeifoodblogs','愛食記','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','愛食記 - 台灣精選餐廳 x 美食優惠','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.douban.frodo','豆瓣','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','豆瓣','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.dropbox.android','Dropbox','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Dropbox: 雲端儲存與同步','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.duosecurity.duomobile','Duo Mobile','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Duo Mobile','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.easycard.wallet','Easy Wallet','APPS','PAY','PAY',NULL,'PRODUCTIVITY','Easy Wallet 悠遊付','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.eatme.eatgether','Eatgether','APPS','SOCIAL','DATING','GOOGLE-tw','DATING','Eatgether- 台灣最大免費聚會線上活動交友APP','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.ECOCO.ECOCO','ECOCO','APPS','LIFESTYLE','TOOLS','GOOGLE-tw','TOOLS','ECOCO循環經濟','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.edenred.tw.myedenred','MyEdenred Taiwan','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','MyEdenred Taiwan','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.elex.girlsthrone.tw.gp','少女的王座','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','少女的王座：命運所在之處','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.emoji.keyboard.touchpal','TouchPal','APPS','SYSTEM','SYSTEM','apktada',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.emoji.keyboard.touchpal.oem','觸寶輸入法HTC版','APPS','SYSTEM','SYSTEM','apktada',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.endressdreamtw.loveting','緣圈','APPS','SOCIAL','DATING','GOOGLE-tw','DATING','緣圈 - 每日16名配對交友','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.enlightment.voicecallrecorder','通話錄音','APPS','PHONE_and_SMS','COMMUNICATION','GOOGLE-tw','COMMUNICATION','通話錄音','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.enlightment.voicerecorder','超級錄音器','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','超級錄音器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.enostai.etfhelper','台股ETF折溢價查詢','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','台股ETF折溢價查詢','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.erudite.ecdict','Erudite Dict','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','英漢字典 / 英英字典 / 漢英字典 - Erudite','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.eskyfun.kingdoms','神魔三國志','GAME','GAME_CARD','GAME_CARD','GOOGLE-tw','GAME_CARD','神魔三國志','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.eslite.tw','誠品人','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','誠品人(TW)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.EspiriGaming.LevelUpXpBoosterMath4','Level Up Xp Booster Math 4','GAME','GAME_TRIVIA','GAME_TRIVIA','GOOGLE-tw','GAME_TRIVIA','Level Up Xp Booster Math 4','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.esun','玉山A+行動下單','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','玉山證券A+行動下單','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.esunbank','玉山銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','玉山行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.esunbank.ESUNWALLET','玉山Wallet','APPS','PAY','PAY','GOOGLE-tw','FINANCE','玉山Wallet','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.etoro.openbook','eToro','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','eToro - Invest in Stocks  Crypto & Trade CFDs','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.etwarm.etwarmClientApp','東森房屋','APPS','HOUSE_AND_HOME','HOUSE_AND_HOME','GOOGLE-tw','HOUSE_AND_HOME','東森房屋','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.example.jefflin.notipreference','com.example.jefflin.notipreference','APPS','EDUCATION','EDUCATION',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.example.stopwatch','Stop Watch','APPS','EDUCATION','EDUCATION',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ezpeer.ezpeerplus.v4','MyMusic','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','MyMusic – 不只音樂 還有Podcast','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.eztable.shareshopping','EZTABLE','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK',NULL,'LIFESTYLE','EZTABLE 簡單桌 - 預訂美好用餐時光','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.eztravel','易遊網','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','易遊網 - 機票、訂房及旅遊專屬優惠','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.fable.okmart','OK mart','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','OK mart','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.facebook.appmanager','Facebook App Manager','APPS','SOCIAL','SOCIAL',NULL,NULL,NULL,'SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.facebook.katana','Facebook','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','Facebook','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.facebook.lite','Lite','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','Facebook Lite','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.facebook.orca','Messenger','APPS','IM','IM',NULL,'COMMUNICATION','Messenger – 免費文字訊息和視訊通話','IM',NULL);
INSERT INTO "_app_category" VALUES ('com.facebook.pages.app','商務套件','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Facebook 商務套件','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.familyshoes','鞋全家福','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','鞋全家福','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.fbs','e點通','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','富邦證券-e點通','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.feib.appbank','遠東商銀','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','遠東商銀行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.feib.bankee','Bankee','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','Bankee','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.femascloud.femashr','鋒形FemasHR','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','鋒形FemasHR','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.fetself','遠傳心生活','APPS','LIFESTYLE','LIFESTYLE',NULL,'TOOLS','遠傳心生活','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.findlife.menu','MENU','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','MENU美食誌 - 美食記錄 你我分享','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.firstbank.firstecard','第e信用卡','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','第一銀行 第e信用卡','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.firstbank.mbanklite','iLEO','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','iLEO','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.firstrade.android','Firstrade','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','美國第一證券 ：無傭金交易','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.fortinet.android.ftm','FortiToken移動','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','FortiToken Mobile','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.fourdesire.fortunecity','記帳城市','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','記帳城市 - 用每筆收支 建造你的城市','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.fourdesire.plantnanny2','Plant Nanny','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Plant Nanny² 植物保姆² - 喝水養成 app','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.frozax.tentsandtrees','Tents and Trees Puzzles','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','Tents and Trees Puzzles','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.fubon.mbank','富邦行動銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','富邦行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.galaxy.stock','中国银河证券','APPS','Stock','FINANCE',NULL,NULL,NULL,'Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.gamania.beanfun','beanfun!','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','beanfun!','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.Gameplete.CardFantasy','三重幻想','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','三重幻想 Triple Fantasy - 策略  卡牌  RPG','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.gamestar.perfectpiano','完美鋼琴','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','完美鋼琴','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gamma.scan','QR和条码扫描器','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','QR和条码扫描器','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.garena.game.kgtw','傳說對決','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','Garena 傳說對決：未來之戰版本','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.garmin.android.apps.connectmobile','Connect','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Garmin Connect™','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gashpay.personal','橘子支付','APPS','PAY','PAY','GOOGLE-tw','FINANCE','橘子支付','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.genius.android','Genius','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Genius — Song Lyrics & More','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.geniusgordon.ilms','iLms','APPS','EDUCATION','EDUCATION','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.getone.getweatherAPP','觀天氣','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','觀天氣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gimmatek.hahago.aha','Hahago','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Hahago - 趣味計步培養運動習慣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.github.android','GitHub','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','GitHub','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.give543.application','贈物網','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','SOCIAL','贈物網','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.global.foodpanda.android','foodpanda','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','foodpanda - 線上美食訂購及生鮮雜貨外送','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.glu.disneygame','Disney競技場','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','Disney 魔法師競技場','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.goder.busquerysystemhsn','新竹公車何時來','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','新竹公車何時來','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.godgame.mj.android','神來也麻將','GAME','GAME_CASINO','GAME_CASINO','GOOGLE-tw','GAME_CASINO','麻將 神來也麻將－台灣16張、麻雀','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.godgame.sevens.android','神來也接龍','GAME','GAME_CARD','GAME_CARD','GOOGLE-tw','GAME_CARD','排七 神來也接龍(排7)','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.gogoro.goshare','GoShare','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','GoShare - 移動共享服務','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gogoro.smartclient','Gogoro','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Gogoro®','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gohappy.mobileapp','friDay購物','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','friDay購物','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.golife.fit','GoFIT','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','GoFIT','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gombosdev.ampere','Ampere','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Ampere','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.books','Google Play Books','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','Google Play 圖書','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.chromecast.app','Google Home','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Google Home','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.classroom','Classroom','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Google Classroom','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.docs','Drive','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Google 雲端硬碟','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.docs.editors.docs','Docs','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Google 文件','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.docs.editors.sheets','Sheets','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Google 試算表','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.docs.editors.slides','簡報','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Google 簡報','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.dynamite','Chat','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Google Chat','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.fitness','Fit','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Google Fit：活動追蹤功能','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.inputmethod.zhuyin','Google Zhuyin Input','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.magazines','Google 新聞','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','Google 新聞','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.maps','Maps','APPS','MAPS_AND_NAVIGATION','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','Google 地圖 - 導航和大眾運輸','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.meetings','Meet','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Google Meet','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.messaging','Messages','APPS','PHONE_and_SMS','SMS',NULL,'COMMUNICATION','訊息','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.nbu.files','Files by Google','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','Files by Google','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.nexuslauncher','Pixel 啟動器','APPS','Launcher','Launcher',NULL,'TOOLS','Pixel Launcher','Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.paidtasks','Google 意見回饋獎勵','APPS','CROWDSCOURCING','CROWDSCOURCING',NULL,'TOOLS','Google 意見回饋獎勵','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.photos','Photos','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Google 相簿','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.recorder','錄音機','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','TOOLS','錄音工具','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.restore','Android 設定','APPS','SYSTEM','SYSTEM','GOOGLE-tw','TOOLS','資料還原工具','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.safetyhub','個人安全','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','個人安全','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.tachyon','Google Duo - 高品質視訊通話應用程式','APPS','PHONE_and_SMS','COMMUNICATION','GOOGLE-tw','COMMUNICATION','Google Duo - 高品質視訊通話應用程式','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.tasks','Tasks','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Google Tasks','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.translate','翻譯','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','TOOLS','Google 翻譯','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.turbo','Device Health Services','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.vega','Google 我的商家','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Google 我的商家','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.walletnfcrel','Google Pay','APPS','PAY','PAY','GOOGLE-tw','FINANCE','Google Pay','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.wallpaper','樣式和桌布','APPS','PERSONALIZATION','PERSONALIZATION','GOOGLE-tw','PERSONALIZATION','桌布','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.wellbeing','數位健康','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','數位健康','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.youtube.creator','YT Studio','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'VIDEO_PLAYERS','YouTube Studio','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.apps.youtube.music','YouTube Music','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','YouTube Music','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.calculator','Calculator','APPS','LIFESTYLE','TOOLS','GOOGLE-tw','TOOLS','計算機','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.calendar','Calendar','APPS','Calendar','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Google 日曆','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.captiveportallogin','CaptivePortalLogin','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.cellbroadcastreceiver','無線緊急警報','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.contacts','聯絡人','APPS','PHONE_and_SMS','COMMUNICATION','GOOGLE-tw','COMMUNICATION','聯絡人','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.deskclock','Clock','APPS','Clock','TOOLS','GOOGLE-tw','TOOLS','時鐘','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.dialer','Phone','APPS','PHONE_and_SMS','COMMUNICATION','GOOGLE-tw','TOOLS','Google 開發的「電話」- 來電顯示和騷擾電話阻擋功能','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.documentsui','檔案','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.ext.services','Android Services Library','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.feedback','Market 意見回饋代理程式','APPS','CROWDSCOURCING','CROWDSCOURCING',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.gm','Gmail','APPS','BUSINESS','EMAIL',NULL,'COMMUNICATION','Gmail','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.gms','Google Play services','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,'TOOLS','Google Play 服務','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.GoogleCamera','Camera','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Google 相機','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.googlequicksearchbox','Google','APPS','BROWSER','TOOLS','GOOGLE-tw','TOOLS','Google','BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.gsf','Google 服務架構','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.inputmethod.latin','Gboard','APPS','SYSTEM','SYSTEM','GOOGLE-tw','TOOLS','Gboard - Google 鍵盤','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.keep','Keep Notes','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Google Keep - 記事和清單','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.marvin.talkback','Android 無障礙套件','APPS','SYSTEM','SYSTEM','GOOGLE-tw','TOOLS','Android 無障礙套件','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.music','Google Play Music','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.packageinstaller','Package installer','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.permissioncontroller','Permission controller','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.play.games','Google Play 遊戲','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','Google Play 遊戲','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.projection.gearhead','Android Auto','APPS','MAPS_AND_NAVIGATION','AUTO_AND_VEHICLES','GOOGLE-tw','AUTO_AND_VEHICLES','Android Auto','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.settings.intelligence','設定小幫手','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.setupwizard','Android 設定','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.storagemanager','Storage Manager','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.syncadapters.calendar','Google Calendar Sync','APPS','Calendar','PRODUCTIVITY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.tts','Speech Services by Google','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','TOOLS','Speech Services by Google','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.videos','Google Play 電影','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','Google Play 影片','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.webview','Android System WebView','APPS','BROWSER','BROWSER',NULL,'TOOLS','Android System WebView','BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.google.android.youtube','YouTube','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','YouTube','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.google.ar.lens','智慧鏡頭','APPS','PHOTOGRAPHY','TOOLS','GOOGLE-tw','TOOLS','Google 智慧鏡頭','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.google.audio.hearing.visualization.accessibility.scribe','即時轉錄和聲響通知','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO',NULL,'COMMUNICATION','即時轉錄和聲響通知','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.GpConsumerMobile.Plus','環保集點-新版','APPS','LIFESTYLE','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','環保集點 GreenPoint (新版)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gps.route.finder.mobile.location.tracker.maps.navigation','GPS导航','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','衛星導航 - 地图  地圖導航  導航系統中文版','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.greamer.monny.android','Monny','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','Monny活寶兔記帳','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gridplus.collagemaker','PhotoGrid','APPS','PHOTOGRAPHY','PHOTOGRAPHY','apktada',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.gu_global.customer.app.tw','GU','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','GU Taiwan','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.hecorat.acapella','Acapella Maker','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'VIDEO_PLAYERS','Acapella Maker - Video Collage','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hecorat.screenrecorder.free','AZ Screen Recorder','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'VIDEO_PLAYERS','AZ Screen Recorder - No Root','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hello.idlegymsports','放置體育館','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','放置體育館 - 體育運動模擬遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.heytap.cloud','雲端服務','APPS','PRODUCTIVITY','PRODUCTIVITY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.heytap.market','軟體商店','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.heytap.mcs','System Messages','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.heytap.pictorial','樂劃鎖屏','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.heytap.themestore','主題商店','APPS','PERSONALIZATION','ENTERTAINMENT',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hilife.vipapp','Hi-Life VIP','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Hi-Life VIP','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hippo.ehviewer','EhViewer','APPS','BROWSER','TOOLS','apkcombo',NULL,NULL,'BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.hisharp.hisharp','HiSharp','APPS','LIFESTYLE','TOOLS','GOOGLE-tw','TOOLS','HISHARP','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.HNB.HNVakten','華銀隨行保鑣','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','華銀隨行保鑣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hncb.feast.androidv2','食在精彩','APPS','FOOD_AND_DRINK','LIFESTYLE','GOOGLE-tw','LIFESTYLE','食在精彩','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hncb.mobilebank','華南銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','華南銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hns','華南永昌 GPHONE版','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','華南永昌G PHONE版','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.holiestep.msgpeepingtom','Message Peeping Tom','APPS','IM','SOCIAL','GOOGLE-tw','SOCIAL','已讀不回助理','IM',NULL);
INSERT INTO "_app_category" VALUES ('com.hotai.toyota.citydriver.official','驅動城市','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','My Toyota','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.housefun.buyapp','好房網買屋','APPS','HOUSE_AND_HOME','HOUSE_AND_HOME','GOOGLE-tw','HOUSE_AND_HOME','好房網買屋','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hpicorp.vieshow','威秀影城','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','威秀影城','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.aiclient','HTC Sense Companion','APPS','PRODUCTIVITY','PRODUCTIVITY','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.android.mail','HTC 郵件','APPS','BUSINESS','EMAIL',NULL,'PRODUCTIVITY','HTC 郵件','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.android.worldclock','時鐘','APPS','Clock','TOOLS','GOOGLE-tw','TOOLS','HTC 時鐘','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.calendar','Calendar','APPS','Calendar','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','HTC 行事曆','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.camera2','相機','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','HTC 相機','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.captiveportallogin','HtcCaptivePortalLogin','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.contacts','聯絡人','APPS','PHONE_and_SMS','COMMUNICATION','GOOGLE-tw','TOOLS','HTC 聯絡人','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.doze','HTC Doze','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','HTC 智慧顯示','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.filemanager','檔案管理員','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','HTC 檔案管理員','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.flipcase','翻蓋式保護套','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.fwupdatetool','音訊插孔轉接器工具箱','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','音訊插孔轉接器工具箱','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.home.personalize','HTC Personalize','APPS','PERSONALIZATION','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.htcadaptivesound','HTC USonic','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.htcpowermanager','電池','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.launcher','Sense 首頁','APPS','Launcher','Launcher','apktada',NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.lockscreen','HTC Lock Screen','APPS','SYSTEM','TOOLS','apktada',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.powersavinglauncher','極致省電模式','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.quicklauncher','側框啟動','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','HTC 側框啟動','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.screencapture','螢幕擷取工具','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,'TOOLS','HTC 螢幕擷取工具','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.sdm','音效選擇器','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.seconddisplay','第二螢幕','APPS','Launcher','Launcher','apkcombo',NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.sense.easyaccessservice','EasyAccessService','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','HTC Motion Launch 手勢啟動','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.sense.mms','訊息','APPS','PHONE_and_SMS','SMS',NULL,'COMMUNICATION','HTC 訊息','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.soundrecorder','錄音機','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.video2','觀看影片','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.Weather','氣象','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','HTC 氣象','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.wfcwificall','Wi-Fi Calling','APPS','PHONE_and_SMS','COMMUNICATION','apkcombo',NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.widget.weatherclock','氣象時鐘小工具','APPS','WEATHER','WEATHER',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.wifidisplay','HTC Connect','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','HTC Connect','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.htc.WifiRouter','Wi-Fi 熱點','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.hyread.reader.v3','HyRead 3','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','HyRead 電子書 - 立即借圖書館小說雜誌影音書','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.hyxen.app.etmall','東森購物','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','EHS東森購物','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.ichi2.anki','AnkiDroid','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','AnkiDroid 單字卡','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.igg.android.dressuptimeprincess','HTC Corporation','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','時光公主','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ignm.bokuneko.tw','Download HTC Personalize APK for Android - Free - Latest Version','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','進擊的喵喵','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ihad.ptt','PiTT','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','PiTT - PTT 行動裝置瀏覽器','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.ilike.cartoon','漫画人','APPS','COMICS','COMICS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.imgur.mobile','Imgur','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'VIDEO_PLAYERS','Imgur：絕妙的影像與 GIF','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.inditex.zara','ZARA','APPS','SHOPPING','SHOPPING',NULL,'LIFESTYLE','Zara','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.infraware.office.link','Polaris Office','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Polaris Office - Free Docs  Sheets  Slides + PDF','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.innersloth.spacemafia','Among Us','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','Among Us','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.instagram.android','Instagram','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','Instagram','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.instagram.layout','版面','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Layout from Instagram','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.intsig.camscanner','掃描全能王','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','CamScanner - 文檔掃描 PDF生成','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.iqiyi.i18n','iQIYI','APPS','VIDEO_PLAYERS','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','iQIYI：愛奇藝新版-全球領先的線上影音平台','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.itraveltech.m1app','馬拉松世界','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','馬拉松世界','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.iwantavnow','Setting','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.iwantavnow.android','Setting','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.jacksparrow.jpmajiang','雀姬','GAME','GAME_CARD','GAME_CARD','GOOGLE-tw','GAME_CARD','雀姬（日本麻雀）','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.jee.timer','Multi Timer','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','多工倒數碼表 碼表','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.jetec.sharedpreferencesexample','SharedpreferencesExample','APPS','EDUCATION','EDUCATION',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.jetec.sqliteexample','SQLiteExample','APPS','EDUCATION','EDUCATION',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.jiecode.ebushsinchu','新竹搭公車','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','新竹搭公車 - 公車即時動態時刻表查詢','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.jiecode.taiwanhighspeedrail','高鐵訂票通','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','高鐵訂票通 - 高鐵時刻表搶票快手','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.jkos.app','街口支付','APPS','PAY','PAY','GOOGLE-tw','FINANCE','街口支付','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.joshua.jptt','JPTT','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','JPTT - 行動裝置也能輕鬆瀏覽PTT!','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.journey.app','Journey','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','日記／日誌 : Journey','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.jrsys.ntpc_qrotp','遠端辦公認證','APPS','BUSINESS','BUSINESS',NULL,NULL,NULL,'BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.kantarworldpanel.panelhome','Panelhome','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Panel Home','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.kb.video','99kubo','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.king.candycrushsaga','Candy Crush Saga','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','糖果傳奇','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.king.crash','Crash Bandicoot','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','袋狼大進擊：全速衝鋒！','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.kingsgroup.ss.tw','全面屍控','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','全面屍控-「陰屍路」聯名手遊','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.kingwaytek.naviking3d','樂客導航王','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','樂客導航王全3D Pro 正式版（可離線）','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.kiwiapple.taiwansuperweather','臺灣超威的','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','臺灣超威的 - 氣象、空汙PM2.5和PSI、地震、寒流颱風','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.kkday.member','KKday','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','KKday：全球旅遊體驗行程預訂','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.klook','KLOOK客路','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','KLOOK客路：旅遊＆玩樂優惠','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.kny.TaiwanWeatherInformation','KNY台灣天氣.地震速報','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','KNY台灣天氣.地震速報','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.kolibrigames.idlerestauranttycoon','Idle Restaurant','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','Idle Restaurant Tycoon-建立餐館帝國','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.kollway.foodomo.user','foodomo','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','foodomo美食外送 X 餐廳優惠','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.komorebi.memo','記事本','APPS','PRODUCTIVITY','TOOLS','GOOGLE-tw','TOOLS','記事本 - 備忘錄APP  便利貼 & 彩色筆記本','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.kpmoney.android','理財幫手AndroMoney','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','記帳 AndroMoney 理財幫手（發票記帳 預算規劃 財務管理)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.kqtea.app','康青龍','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','康青龍人文茶飲','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.kuo.buy123','生活市集','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','生活市集 - 只為給你好生活','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.lafresh.formosachang','鬍鬚張','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','鬍鬚張','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.landbank.newrelease.android','土銀行動銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','土銀行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.lang.lang','浪LIVE','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,'SOCIAL','浪LIVE - 歌唱才藝直播平台','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.languagedrops.drops.learn.learning.speak.language.korean.hangul.words','Drops：学习韩语和韩语词汇','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Drops：学习韩语和韩语词汇','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.lbe.parallel.intl','平行空間(原雙開大師)','APPS','Launcher','Launcher','GOOGLE-tw','PERSONALIZATION','LBE平行空間－雙開應用','Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.lbe.parallel.intl.arm64','Parallel Space 64Bit Support','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Parallel Space - 64Bit Support','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.lego.common.legolife','LEGO® Life','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','LEGO® Life – 適合兒童的安全社交平台！','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.lib.cwmoney','CWMoney','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','記帳CWMoney 管理預算、掃描記帳、理財分析','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.lightningappstudio.moneytrack2cht','閃電記帳2','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','閃電記帳2 - 三秒搞定流水帳','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.lilithgame.hgame.gp.tw','劍與遠征','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','劍與遠征','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.linebank.tw','LINE Bank','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','LINE Bank Taiwan','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.b612.android','B612','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','B612 - Best Free Camera & Photo/Video Editor','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.foodcam.android','Foodie','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Foodie - 生活相機','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.LGCHEF','LINE 熊大上菜','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','LINE 熊大上菜 來和熊大一起動手做可愛的料理吧','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.LGDRPK','哆啦A夢樂園','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','LINE：哆啦A夢樂園','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.LGFARM','BrownFarm','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','LINE 熊大農場','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.LGPKPK','PokoPoko','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','LINE Pokopoko 決戰波兔森林 - 和兔子POKOTA一起來收集幸運草及櫻桃吧！','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.LGTMTMG','TsumTsum','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','LINE: Disney Tsum Tsum','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.LGYDSG','JUMPUTI HEROES 英雄氣泡　大特集祭・神劍闖江湖篇登場','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','JUMPUTI HEROES 英雄氣泡　大特集祭・神劍闖江湖篇登場','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.linelite','LINE Lite','APPS','IM','IM',NULL,'COMMUNICATION','LINE Lite','IM',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.lineoa','Official Account','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','LINE Official Account','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.linecorp.twshopping','LINE購物','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','LINE購物 - 比價找優惠、追蹤歷史價格 掌握最便宜買點','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.linepaycorp.talaria','LINE Pay','APPS','PAY','PAY','GOOGLE-tw','FINANCE','LINE Pay','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.linkedin.android','LinkedIn','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','LinkedIn','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.linkwish.citylink','CITYLINK','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','CITYLINK','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.linkwish.dayungs','大苑子','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','LIFESTYLE','大苑子','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.littlea.ezscreencorder','Ez螢幕錄影','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'VIDEO_PLAYERS','Ez 螢幕錄影 (無廣告)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ltgames.android.snail','最強蝸牛','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','最強蝸牛','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ludashi.superboost','DualSpace Lite','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','雙開空間精簡版 - 多賬戶&克隆應用','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.lumi.kwpsmartpanel','PanelSmart','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','PanelSmart','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.m104','104工作快找','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','104工作快找-工作機會最多 找工作、找打工兼職的優質求職平台','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.m104pro','104企業大師','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','104企業大師 - 雲端人資平台','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.madhead.tos.zh','神魔之塔','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','神魔之塔','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.maf.tilerpg','TileRPG','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','遊戲完蛋了 - 像素勇者放置RPG遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mafgames.idle.cat.neko.manager.tycoon','Kitty Cat Tycoon','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','我的喵不可能那麼可愛： 放置大亨遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.magoosh.flashcards.gre','GRE Vocabulary Flashcards','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','GRE Vocabulary Flashcards','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.magoosh.toefl.flashcards.vocabulary','TOEFL English Vocabulary Cards','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','TOEFL English Vocabulary Cards','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mbank.bot.p','臺灣銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','臺灣銀行-網路銀行隨身版','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.media.music.mp3.musicplayer','音樂播放器','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','音樂播放器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mediatek.capctrl.service','RilCap','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.mediatek.ygps','YGPS','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.meetagile.intellisport.basketball.social','GoHoops','APPS','SPORTS','SPORTS','GOOGLE-tw','SPORTS','GoHoops','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.meitu.meiyancamera','美顏相機－拍人像更專業','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','美顏相機－拍人像更專業','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.melesta.coffeeshop','My Cafe','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','我的咖啡廳—餐廳經營遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mercuries.simplecity','美廉城超','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','美廉城超','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mfxsyd.xsreader','免費小說閱讀','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mgoogle.android.gms','Vanced MicroG','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mi.android.globalFileexplorer','檔案管理','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Mi File Manager - free and easily','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.mi.android.globalminusscreen','資訊助手','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','資訊助理——功能助手 安全穩定 資訊聚焦','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.mi.globalbrowser','小米瀏覽器','APPS','BROWSER','BROWSER',NULL,'TOOLS','小米瀏覽器——極速上網 安全穩定 功能全面','BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.emmx','Edge','APPS','BROWSER','COMMUNICATION','GOOGLE-tw','COMMUNICATION','Microsoft Edge','BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.office.excel','Excel','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft Excel：檢視編輯與建立試算表','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.office.officehubrow','Office','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft Office：Word、Excel、PowerPoint 等等','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.office.officelens','Lens','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft Lens - PDF Scanner','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.office.onenote','OneNote','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft OneNote：儲存構想和整理筆記','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.office.outlook','Outlook','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft Outlook','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.office.powerpoint','PowerPoint','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft PowerPoint：投影片放映和簡報','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.office.word','Word','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft Word：隨時撰寫編輯與共用文件','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.skydrive','OneDrive','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft OneDrive','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.teams','Teams','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Microsoft Teams','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.todos','To Do','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Microsoft To Do：清單、工作與提醒','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.microsoft.windowsintune.companyportal','公司入口網站','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Microsoft Intune 公司入口網站','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.miHoYo.bh3tw','崩壊3rd','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','崩壞3rd','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mitake.android.bk.tcb','合作金庫銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','合作金庫銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mitake.android.epost','e動郵局','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','e動郵局','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mitake.android.scb','SC Mobile','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','SC Mobile Taiwan','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mitake.finance.cap','掌中財神全球通','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','群益證券-掌中財神全球通','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.mitake.mls','行動達人','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','元富證券 行動達人','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.mitake.TBB','臺灣企銀','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','臺灣企銀行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.analytics','Analytics','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.aod','萬象息屏','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.calculator','Calculator','APPS','LIFESTYLE','TOOLS','GOOGLE-tw','TOOLS','Calculator','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.cleanmaster','Cleaner','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.cloudbackup','桌面雲備份','APPS','PRODUCTIVITY','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.cloudservice','Mi Cloud','APPS','PRODUCTIVITY','PRODUCTIVITY','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.face','MiuiBiometric','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.gallery','相簿','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.global.packageinstaller','套裝軟體安裝程式','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.home','系統桌面','APPS','Launcher','Launcher',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.mishare.connectivity','Mi Share','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.notes','便條','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.notification','通知管理','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.player','音樂','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Mi Music','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.powerkeeper','電量和性能','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.screenrecorder','螢幕錄製','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.securitycenter','手機管家','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.securitycore','安全核心元件','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.touchassistant','懸浮球','APPS','Launcher','Launcher','apkcombo',NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.videoplayer','Mi Video','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','ENTERTAINMENT','Mi Video - Play and download videos','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.miui.weather2','天氣','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','Weather - By Xiaomi','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mlhg.screenfilter','降低亮度','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','降低亮度','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mobile01.android.forum','Mobile01','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','Mobile01','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.mobilesrepublic.appy','News Republic','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mobisystems.fileman','File Commander','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','File Commander - File Manager & Free Cloud','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.mobisystems.office','OfficeSuite','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','OfficeSuite + PDF Editor','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.mobix.pinecone','松果購物','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','松果購物 - 買不完的生活好物','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.modogame.xtlq.gf.android','星途戀曲','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','星途戀曲-創新主播題材戀愛養成手遊','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mojang.minecraftearth','Minecraft Earth','GAME','GAME_ADVENTURE','GAME_ADVENTURE','GOOGLE-cn','GAME_ADVENTURE','Minecraft Earth','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.momentum.momapp','摩曼頓','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','摩曼頓','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.momo.mobile.shoppingv2.android','momo購物網','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','momo購物 l 生活大小事都是momo的事','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.moonactive.coinmaster','Coin Master','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','Coin Master','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mover.twswy','食物語','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','食物語-2020最期待治癒系RPG','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mover.twyx','延禧攻略之鳳凰于飛','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','延禧攻略之鳳凰于飛','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mt.mtxx.mtxx','美圖秀秀','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','美圖秀秀Meitu - 美顏自拍  修圖  照片編輯器','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.mtk','三竹股市','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','三竹股市－免費行動股市即時報價、全台百萬用戶使用','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.musixmatch.android.lyrify','Musixmatch 音樂播放器的歌詞同步','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Musixmatch 音樂播放器的歌詞同步','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mxtech.videoplayer.ad','MX 播放器','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','MX Player','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.myball.movenpick','莫凡彼','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK',NULL,'LIFESTYLE','莫凡彼Movenpick','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.myfitnesspal.android','MyFitnessPal','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','MyFitnessPal 的卡路里計算機和膳食追蹤工具','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mytona.cookingdiary.android','烹飪日記','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','烹飪日記：美味餐廳及咖啡館遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.Nanali.ForestIsland','森林小島','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','森林小島: 療癒&放鬆的放置型遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nand.addtext','添加文字','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','在照片上添加文字','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.naturaltel.truly','算算²','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,'TOOLS','算算² #免出門 想問什麼 老師立即幫你算！','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.naver.linewebtoon','WEBTOON','APPS','COMICS','COMICS','GOOGLE-tw','COMICS','LINE WEBTOON 每日漫畫','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.nbaimd.gametime.nba2011','NBA','APPS','SPORTS','SPORTS','GOOGLE-tw','SPORTS','NBA：直播比賽和比分','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.neowiz.game.guitargirl','吉他少​​女','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','吉他少女','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.neowizlab.moing','MOING','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','MOING - 모잉 AR 포토카드','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.netease.idv_tw.googleplay','第五人格','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','第五人格','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.netease.x19','我的世界','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.netflix.mediaclient','Netflix','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','ENTERTAINMENT','Netflix','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.netmarble.mherosgb','Future Fight','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','MARVEL 未來之戰','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.netmarble.nanagb','七大罪','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','七大罪：光與暗之交戰','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.netmarbleasia.nikkitw','奇迹暖暖','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','奇迹暖暖','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nexon.da3.global','暗黑復仇者3','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','暗黑復仇者3','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nexon.kart','跑跑卡丁車 Rush+','GAME','GAME_RACING','GAME_RACING','GOOGLE-tw','GAME_RACING','跑跑卡丁車 Rush+','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nhn.android.band','BAND','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','BAND - 為團體而生','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.nhnent.SKQUEST','克魯賽德戰記','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','克魯賽德戰記 - Crusaders Quest','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nianticlabs.pokemongo','Pokémon GO','GAME','GAME_ADVENTURE','GAME_ADVENTURE','GOOGLE-tw','GAME_ADVENTURE','Pokémon GO','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nianticlabs.pokemongo.ares','Pokémon GO','GAME','GAME_ADVENTURE','GAME_ADVENTURE',NULL,NULL,NULL,'GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s000156','小三美日美妝','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','小三美日平價美妝','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s000360','全家行動購','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','全家行動購','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s001317','MIUSTAR','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','MIUSTAR','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s001993','UrMart 優馬選品','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','UrMart 帶你買遍全世界','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s002131','康是美網購','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','康是美網購 eShop','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s018793','LEVI''S','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','LEVI''S 官方旗艦店','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s036426','dot st TW','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','dot st TW','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s040090','雨傘王','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','雨傘王Umbrellaking','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s040332','Dickies','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Dickies官方網路商店','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s040916','寶雅線上買','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','寶雅線上買','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nintendo.zaca','口袋森友會','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','動物森友會 口袋露營廣場','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nintendo.zaka','Mario Kart','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','Mario Kart Tour','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.nooker2.ac','Nooker','APPS','GAME_TOOLS','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','Nooker. 動物森友會攻略 / 動森圖鑑','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.nooman.pc.screenrecorder','屏幕錄像機','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.noonspace.af','空軍服裝供售站','APPS','SHOPPING','BUSINESS','GOOGLE-tw','BUSINESS','空軍服裝供售站','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nStock.RichStock','高股息存股','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','高股息存股-選股找出值得投資的定存股（股市 股票 台股 存股 ETF 殖利率 除權息 看盤 ROE）','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.nuli.app','Nüli','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Nüli —居家與重訓課表','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.obank.tw.eb','王道銀行 O-Bank','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','王道銀行 O-Bank','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ocard','Ocard','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Ocard - 生活饗樂平台','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ollix.fogofworld','世界迷霧','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','世界迷霧','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.omnibpm.omnibpm','OmniBPM','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','OmniBPM 雲端企業流程管理系統','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.openlife.poya','POYA支付','APPS','PAY','PAY',NULL,'LIFESTYLE','POYA支付','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.camera','相機','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.display','OppoDisplayService','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.launcher','系統桌面','APPS','Launcher','Launcher',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.music','音樂','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.operationManual','使用說明','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.otaui','軟體更新介面','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.quicksearchbox','搜尋','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.oppo.usercenter','我的 OPPO','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.originmood.mjmc','摸金迷城','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','apktada',NULL,NULL,'GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.osolve.part','打工趣','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','打工趣 - 最棒的兼職工作資訊平台','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.osp.app.signin','三星帳號','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.owcomltd.genkivillage','Genki Village','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','元氣動物村 - 休閒經營夢幻動物世界','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.panteon.homesweethome','Restoration','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','Home Restoration','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.PChome.Shopping','PChome24h購物','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','PChome24h購物','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.peoplefun.wordsearch','Search','GAME','GAME_WORD','GAME_WORD','GOOGLE-tw','GAME_WORD','Wordscapes Search','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.percent.royaldice','Random Dice','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','Random Dice: PvP Defense','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.pharoscloud.nctubus','交大校車','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','apkcombo',NULL,NULL,'MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.PigeonGames.Phigros','Phigros','GAME','GAME_MUSIC','GAME_MUSIC','GOOGLE-tw','GAME_MUSIC','Phigros','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.pinkoi','Pinkoi','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Pinkoi 買設計','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.pinterest','Pinterest','APPS','ART_AND_DESIGN','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Pinterest','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.plarium.zoo','Family Zoo','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','Family Zoo: The Story','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.play.rogt','ROX新世代','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','RO仙境傳說：新世代的誕生','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.playground.hmrb.g','家庭教師 HITMAN REBORN！','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','家庭教師 HITMAN REBORN！','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.playgroup.animalcrossguide','Animal Guide','APPS','GAME_TOOLS','TOOLS','GOOGLE-tw','TOOLS','動森攻略 for ACNH','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.playhardlab.herofactory','Hero Factory','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','英雄工廠','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.plokia.ClassUp','ClassUp','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','ClassUp','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.plurk.android','Plurk','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','噗浪','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.polydice.icook','愛料理','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','愛料理 - 美食自己做','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.popularapp.periodcalendar','小月曆','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','💖女性避孕/怀孕日記-免費生理期/受孕/排卵日預測💖','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.premise.android.prod','Premise','APPS','CROWDSCOURCING','CROWDSCOURCING','GOOGLE-tw','LIFESTYLE','Premise','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.presco.shopmore','SHOPMORE','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','SHOPMORE TW','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.primitivebrother.thunder.google','原始兄弟','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','原始兄弟: 無限進化','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.psc','統一e指發','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','統一證券-e指發','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.puzzle.miniworld','Pocket World 3D','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','Pocket World 3D','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.pxmart.android','全聯支付','APPS','PAY','PAY',NULL,'LIFESTYLE','全聯支付','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.qianyan.eshelper','西語助手','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','西语助手','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.qidian.QDReader.traditional','起點小說','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','起點小說﹣正版中文網路小說追書神器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.qiyi.video','愛奇藝','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-cn','VIDEO_PLAYERS','愛奇藝（舊版）–熱播連續劇線上看','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.qq.ac.android','腾讯动漫','APPS','COMICS','COMICS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.qualcomm.qti.services.secureui','Secure UI Service','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.qualcomm.qti.simsettings','com.qualcomm.qti.simsettings','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.rakuten.shopping','樂天市場','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Rakuten樂天市場購物網 手機行動購物商城 逛商店街優惠多','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.rakuya.mobile','樂屋網-買屋租屋、實價登錄、售屋','APPS','HOUSE_AND_HOME','HOUSE_AND_HOME','GOOGLE-tw','HOUSE_AND_HOME','樂屋網-買屋租屋、實價登錄、售屋','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.rayark.cytus2','Cytus II','GAME','GAME_MUSIC','GAME_MUSIC','GOOGLE-tw','GAME_MUSIC','Cytus II','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.realbyteapps.moneymanagerfree','Money Manager','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','Money Manager Expense & Budget','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.reddit.frontpage','Reddit','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','Reddit','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.redteamobile.roaming','國際上網','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.rekoo.pubgm','PUBG MOBILE','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','PUBG MOBILE：絕地求生M','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ricardohui.flutter_animal_crossing','動森攻略','APPS','GAME_TOOLS','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','動森攻略','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ricb.ebank','樂天國際銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','樂天國際商業銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.richi.dreammall','夢時代/高雄時代百貨','APPS','SHOPPING','LIFESTYLE','GOOGLE-tw','LIFESTYLE','夢時代/高雄時代百貨','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.riotgames.league.wildrifttw','Wild Rift','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','《英雄聯盟：激鬥峽谷》','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.rise.automatic.autoclicker.clicker','點擊助手','APPS','GAME_TOOLS','TOOLS','GOOGLE-tw','TOOLS','點擊助手 - 自動點擊器 : 手勢錄製器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.rizwan.simplepdfreader2018','簡單PDF閱讀器','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','TOOLS','簡單的PDF閱讀器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.rtmart','大潤發','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','大潤發 RT-Mart','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.rummikubfree','Rummikub','GAME','GAME_BOARD','GAME_BOARD','GOOGLE-tw','GAME_BOARD','Rummikub','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ruten.android.rutengoods.rutenbid','露天拍賣','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','露天拍賣','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.s.antivirus','AVG Protection','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','AVG AntiVirus','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.s.cleaner','AVG Cleaner','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','AVG Cleaner Lite','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.accessibility','協助工具','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.accessory.atticmgr','Galaxy Buds Pro','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Galaxy Buds Pro Plugin','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.accessory.fridaymgr','Galaxy Buds','APPS','SYSTEM','SYSTEM','GOOGLE-tw','TOOLS','Galaxy Buds Plugin','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.aodservice','Always On Display','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','[Samsung] Always On Display','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.appsedge','Apps','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.clockpack','時鐘樣式','APPS','PERSONALIZATION','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.cocktailbarservice','側螢幕','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.contacts','聯絡人','APPS','PHONE_and_SMS','TOOLS','apkcombo',NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.dressroom','桌布','APPS','PERSONALIZATION','PERSONALIZATION','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.earphonetypec','三星 USB-C 耳機','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.galaxyfinder','Finder','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.notes','Samsung Notes','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Samsung Notes','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.notes.addons','Samsung Notes Add-ons','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.omcagent','配置更新','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.reminder','提醒','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.routines','Bixby Routines','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.smartcapture','三星截圖','APPS','PHOTOGRAPHY','PHOTOGRAPHY','apkcombo',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.spage','Samsung Free','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.telephonyui','通話設定','APPS','PHONE_and_SMS','COMMUNICATION','apkcombo',NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.tips','提示','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.app.watchmanager','Galaxy Wearable','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','Galaxy Wearable','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.arzone','AR 區域','APPS','ENTERTAINMENT','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.authfw','Samsung Pass','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.biometrics.app.setting','com.samsung.android.biometrics.app.setting','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.bixby.agent','Bixby Voice','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.bixby.wakeup','語音喚醒','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.calendar','Calendar','APPS','Calendar','PRODUCTIVITY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.clipboarduiservice','ClipboardUIService','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.contacts','聯絡人','APPS','PHONE_and_SMS','COMMUNICATION','apkcombo',NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.dialer','電話','APPS','PHONE_and_SMS','COMMUNICATION','apkcombo',NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.dynamiclock','Dynamic Lockscreen','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.forest','數位健康','APPS','HEALTH_AND_FITNESS','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.game.gamehome','遊戲啟動器','APPS','GAME_TOOLS','GAME_TOOLS',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.game.gametools','遊戲加速器','APPS','GAME_TOOLS','GAME_TOOLS',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.honeyboard','三星鍵盤','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.incallui','Call','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.livestickers','裝飾圖片','APPS','PERSONALIZATION','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.lool','裝置維護','APPS','SYSTEM','SYSTEM',NULL,'TOOLS','Device Care','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.mcfds','MCFDeviceContinuity','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.mcfserver','Samsung Multi Connectivity','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.mdx.quickboard','媒體與裝置','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.messaging','訊息','APPS','PHONE_and_SMS','SMS',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.mobileservice','Samsung Experience 服務','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','Group Sharing','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.MtpApplication','MTP應用程式','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.net.wifi.wifiguider','Wi-Fi 提示','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.oneconnect','Smart​Things','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','SmartThings','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.providers.contacts','聯絡人儲存空間','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.providers.media','Sec Media Storage','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.samsungpassautofill','Autofill with Samsung Pass','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.scloud','三星雲端','APPS','PRODUCTIVITY','PRODUCTIVITY',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.sdk.handwriting','HandwritingService','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.sdm.config','配置更新','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.secsoundpicker','SecSoundPicker','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.service.aircommand','感應快捷環','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.service.peoplestripe','VIP 側拉通知','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.service.tagservice','標籤','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.sidegesturepad','One Hand Operation +','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','One Hand Operation +','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.sm.policy','SCPM Client','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.smartmirroring','Smart View','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.spay','Samsung Pay','APPS','PAY','PAY',NULL,'LIFESTYLE','Samsung Pay','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.spdfnote','於 PDF 上編寫','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Write on PDF','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.themestore','Galaxy Themes','APPS','PERSONALIZATION','PERSONALIZATION','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.video','影片播放器','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.visionintelligence','Bixby Vision','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.voc','Samsung Members','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Samsung Members','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.android.wellbeing','數位健康','APPS','HEALTH_AND_FITNESS','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.app.newtrim','影片剪輯工具','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.desktopsystemui','Samsung DeX 系統使用者介面','APPS','Launcher','Launcher','apkcombo',NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.sec.android.application.csc','CSC','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.samsung.sree','Samsung Global Goals','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Samsung Global Goals','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.screenovate.dell.mobileconnect','Dell Mobile Connect','APPS','BUSINESS','BUSINESS',NULL,'COMMUNICATION','Dell Mobile Connect','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.camera','相機','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.clockpackage','時鐘','APPS','Clock','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.dexonpc','DeX for PC','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.launcher','One UI 首頁','APPS','Launcher','Launcher','GOOGLE-tw','PERSONALIZATION','三星 One UI 首頁','Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.music','Samsung Music','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Samsung Music','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.myfiles','我的檔案','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','Samsung My Files','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.popupcalculator','計算機','APPS','LIFESTYLE','TOOLS','GOOGLE-tw','TOOLS','Samsung Calculator','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.safetyassurance','安全性協助','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.samsungapps','Galaxy Store','APPS','ENTERTAINMENT','ENTERTAINMENT','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.sbrowser','三星網際網路','APPS','BROWSER','BROWSER',NULL,'COMMUNICATION','Samsung Internet Browser','BROWSER',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.servicemodeapp','Service mode','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.shealth','Samsung Health','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Samsung Health','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.soundalive','SoundAlive','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.vepreload','影片編輯器','APPS','PHOTOGRAPHY','TOOLS','apkcombo',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.app.voicenote','語音錄製','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO',NULL,'TOOLS','Samsung Voice Recorder','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.cover.ledcover','LED Cover Service','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.daemonapp','氣象','APPS','WEATHER','WEATHER','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.easyonehand','EasyOneHand','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.emergencymode.service','EmergencyManagerService','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.gallery3d','媒體瀏覽器','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Samsung Gallery','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.inputmethod','三星鍵盤','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.mimage.photoretouching','相片編輯器','APPS','PHOTOGRAPHY','PHOTOGRAPHY','apkcombo',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.android.provider.badge','BadgeProvider','APPS','PHOTOGRAPHY','TOOLS','apkcombo',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.hearingadjust','Adapt Sound','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sec.spp.push','Samsung Push Service','APPS','SYSTEM','TOOLS',NULL,'COMMUNICATION','Samsung push service','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sega.pjsekai','プロセカ','GAME','GAME_MUSIC','GAME_MUSIC','GOOGLE-tw','GAME_MUSIC','プロジェクトセカイ カラフルステージ！ feat. 初音ミク','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.senspark.stickwar','Stickman Battle','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','Stickman Battle 2021: Stick Fight War','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.shadowbiz.semechki','com.shadowbiz.semechki！是一個邏輯益智遊戲。 偉大的數字遊戲為孩子和成人','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','拿十！是一個邏輯益智遊戲。 偉大的數字遊戲為孩子和成人','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.shazam.android','Shazam','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Shazam - 搜尋音樂','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.she.eReader','HamiBook','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','Hami Book 當期雜誌免費看','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.shopback.app','ShopBack','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','ShopBack - 網購即享現金回饋｜雙11購物節 - 隨時享受1111光棍節網購週年慶折扣','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.shopee.tw','蝦皮購物','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','蝦皮購物｜8.8購MEN節','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.sina.weibo','微博','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','微博','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.sinopac.dawho','大戶DAWHO','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','DAWHO','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sionpac.app.SinoPac','永豐銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','永豐行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sirma.mobile.bible.android','聖經 - 有聲','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','聖經 - 有聲','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.SK.HappyTrader','群益行動贏家','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','群益行動贏家','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.skis','富貴角10號','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','【富貴角10號】sk88新光證券','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.skype.raider','Skype','APPS','IM','IM',NULL,'COMMUNICATION','Skype - 享受免費的即時訊息與視訊通話','IM',NULL);
INSERT INTO "_app_category" VALUES ('com.skypeople.finalbladegb','FINAL BLADE','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','FINAL BLADE','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.skysoft.kkbox.android','KKBOX','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','KKBOX｜免費聽音樂、Podcast 享受聲音、找到共鳴！','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.skystar.twbus','台灣公車通','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台灣公車通 (台北/桃園/台中/台南/高雄公車/公路客運)','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.Slack','Slack','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Slack','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.slader.slader','Slader','APPS','EDUCATION','EDUCATION','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.slido.app','Slido','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','Slido','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.sls','土銀e行動','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','土地銀行證券-e行動','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.smp.musicspeed','Music Speed Changer','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','音樂速度變更器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.smule.singandroid','Smule','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Smule: 卡拉ＯＫ社交手機軟體','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.snowcorp.soda.android','SODA','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','SODA - Natural Beauty Camera','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.socialnmobile.dictapps.notepad.color.note','ColorNote','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','ColorNote - 彩色筆記 記事本 便箋 便條 便簽','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.softstargames.mpal5','仙劍奇俠傳5手機版','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','仙劍奇俠傳5-手遊版','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.sohu.inputmethod.sogou','Sogou Keyboard','APPS','SYSTEM','TOOLS','apktada',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonelli.juicessh','JuiceSSH','APPS','TOOLS','TOOLS',NULL,'COMMUNICATION','JuiceSSH - SSH Client','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.sony.nfx.app.sfrc','News Suite','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','Sony 的新聞應用程式：News Suite','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sony.tvsideview.phone','Video & TV SideView','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','Video & TV SideView: Remote','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.album','相簿','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','相簿','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.android.camera','相機','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.conversations','訊息功能','APPS','PHONE_and_SMS','SMS',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.home','Xperia主畫面','APPS','Launcher','Launcher',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.music','音樂','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','音樂','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.organizer','時鐘','APPS','Clock','TOOLS',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.photoeditor','相片編輯器','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.pws','緊急警報','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.textinput.chinese','Xperia中文鍵盤','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.updatecenter','軟體更新','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonyericsson.usbux','USB連線','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.advancedwidget.clock','時鐘小工具','APPS','Clock','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.android.contacts','通訊錄','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.android.dialer','電話','APPS','PHONE_and_SMS','COMMUNICATION',NULL,NULL,NULL,'PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.assist','Xperia小幫手','APPS','SYSTEM','TOOLS','GOOGLE-tw','TOOLS','Xperia小幫手','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.assist.persistent','Xperia Assist','APPS','SYSTEM','TOOLS',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.calendar','Calendar','APPS','PRODUCTIVITY','PRODUCTIVITY','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.dualdrive','多視窗模式開關','APPS','Launcher','Launcher',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.email','電子郵件','APPS','BUSINESS','EMAIL',NULL,NULL,NULL,'BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.exactcalculator','計算機','APPS','LIFESTYLE','TOOLS','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.gameenhancer','遊戲增強器','APPS','GAME_TOOLS','GAME_TOOLS',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.home','Xperia主畫面','APPS','Launcher','Launcher','apktada',NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.launcher','Xperia主畫面','APPS','Launcher','Launcher',NULL,NULL,NULL,'Launcher',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.lifelog','Lifelog','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','Lifelog','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.mediavibration','動態震動','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.moviecreator','視訊編輯器','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.moviecreator.rmm','影片建立工具','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'PHOTOGRAPHY','影片建立工具','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.pocketmode2','com.sonymobile.pocketmode2','APPS','TOOLS','TOOLS',NULL,NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.recallplaybackphotos','相片播放','APPS','PHOTOGRAPHY','PHOTOGRAPHY',NULL,NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.sidesenseapp','側面感應','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.sketch','繪圖','APPS','ART_AND_DESIGN','ART_AND_DESIGN','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.smartcharger','電池維護','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.storagechecker','記憶體','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.superstamina','Sony STAMINA mode','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.support','支援','APPS','SYSTEM','SYSTEM',NULL,'TOOLS','Sony 的Xperia支援','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.wifi','Wi-Fi','APPS','SYSTEM','SYSTEM',NULL,NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.xperiaweather','天氣','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','天氣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sonymobile.xperiaxloops','Xperia Loops','APPS','PERSONALIZATION','PERSONALIZATION',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.soundon','SoundOn','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','SoundOn 聲浪 - Podcast 隨時隨地聽內容','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sparkslab.dcardreader','Dcard','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','Dcard - 年輕人都在 Dcard 上討論','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.splendapps.voicerec','Voice Recorder','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','录音笔','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.spotify.music','Spotify','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Spotify - 音樂和 Podcast','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sristc.etage','遠通電收ETC','APPS','AUTO_AND_VEHICLES','AUTO_AND_VEHICLES','GOOGLE-tw','AUTO_AND_VEHICLES','遠通電收ETC','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ss.android.ugc.trill','TikTok','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','TikTok-有趣的人都在這裡','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.standardcart.meteor','Meteor','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','Meteor - 學生社群','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.starbucks.tw','Starbucks TW','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK',NULL,'LIFESTYLE','Starbucks TW','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sticktoit','老王VPN','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','老王VPN(永久免費佛系VPN)❤️- 最好的免費VPN 秒連 高速 穩定 梯子 永久更新 科學上網','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.stickyhands.farmville','紙牌農莊','GAME','GAME_CARD','GAME_CARD','GOOGLE-tw','GAME_CARD','紙牌農莊','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.stockx.stockx','StockX','APPS','Stock','SHOPPING','GOOGLE-tw','SHOPPING','StockX - Buy & Sell Sneakers  Streetwear + More','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.streetvoice.streetvoice','StreetVoice','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','StreetVoice 街聲 - 暢聽獨立音樂、演出活動通知','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.sun5','日盛行動下單WTS','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','日盛行動下單WTS','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.SuperAwesome.MergeSafari','Merge Safari - 神祕的動物','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','Merge Safari - 神祕的動物','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.supercell.brawlstars','荒野亂鬥','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','荒野亂鬥','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.supercell.clashroyale','皇室戰爭','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','部落衝突:皇室戰爭「Clash Royale」','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.surpax.ledflashlight.panel',' Flashlight','APPS','TOOLS','PRODUCTIVITY','apktada',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.swiftappskom.thewolfrpg','The Wolf','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','The Wolf','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ta.dcdw.gl','保衛之戰：Destiny Child PVP遊戲','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','保衛之戰：Destiny Child PVP遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.taiwanmobile.myBook','myBook','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','myBook-電子雜誌、電子書、小說看到飽，漫畫免費試閱','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.taiwanmobile.myVideo','myVideo','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','myVideo(手機) -火神的眼淚 熱播中','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.taiwanmobile.pt.customerservice','台灣大客服','APPS','LIFESTYLE','LIFESTYLE',NULL,'PRODUCTIVITY','台灣大哥大行動客服','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tangmu.tm.newtaobuy','淘好買','APPS','SHOPPING','SHOPPING','apkcombo',NULL,NULL,'SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.taobao.idlefish','闲鱼','APPS','SHOPPING','SHOPPING','apktada',NULL,NULL,'SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.taobao.taobao','淘宝','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','淘宝','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.taptap.global','TapTap','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tbig.playerprotrial','PlayerPro','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','PlayerPro Music Player (Free)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.teacapps.barcodescanner','QR掃描器','APPS','TOOLS','TOOLS',NULL,'PRODUCTIVITY','QR掃描儀 & 條形碼掃描儀 (繁體中文)','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.team214.nctue4','NCTU e4','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','NCTU E4','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tencent.androidqqmail','QQ邮箱','APPS','BUSINESS','TOOLS','GOOGLE-tw','TOOLS','QQ邮箱','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.tencent.mm','WeChat','APPS','IM','IM',NULL,'COMMUNICATION','WeChat','IM',NULL);
INSERT INTO "_app_category" VALUES ('com.tencent.qqlivei18n','WeTV','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','ENTERTAINMENT','WeTV - 騰訊視頻海外版','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.testritegroup.crm.loyaltyapp','特力愛家卡','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','特力愛家卡','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tetrox.bowl','Bowling Crew','GAME','GAME_SPORTS','GAME_SPORTS','GOOGLE-tw','GAME_SPORTS','Bowling Crew — 3D bowling game','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.tfm.myfami','My FamiPort','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','My FamiPort','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.thecarousell.Carousell','Carousell 旋轉拍賣','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Carousell 旋轉拍賣 - 你拍我買','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.theswitchbot.switchbot','SwitchBot','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','SwitchBot','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.thinkermobile.sinyi','信義房屋','APPS','HOUSE_AND_HOME','HOUSE_AND_HOME','GOOGLE-tw','HOUSE_AND_HOME','信義房屋－關於家 找信義聊聊','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.thinkyeah.galleryvault','照片保險箱','APPS','TOOLS','TOOLS',NULL,'VIDEO_PLAYERS','照片保險箱－私密圖庫（加密隱藏圖片 隱藏視頻 隱藏文檔）','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.ticktick.task','TickTick','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','TickTick - 待辦事項與工作清單','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tinyco.potter','Harry Potter','GAME','GAME_ADVENTURE','GAME_ADVENTURE','GOOGLE-tw','GAME_ADVENTURE','哈利波特: 霍格華茲之謎','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.tmc.GetTaxi','178叫計程車','APPS','TRAVEL_AND_LOCAL','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','178叫計程車 美好一起出發 大車隊 叫小黃 多元車 計程車試算','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tmc.mtaxi','大都會計程車','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','大都會計程車55178 信用卡支付 車資試算 機場接送 包車旅遊 大車隊','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.tomofun.furbo','Furbo','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Furbo','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.touchtype.swiftkey','Microsoft SwiftKey 鍵盤','APPS','SYSTEM','SYSTEM','GOOGLE-tw','PRODUCTIVITY','Microsoft SwiftKey Keyboard','SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.tplink.iot','Tapo','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','TP-Link Tapo','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tradevan.android.forms','EZ Way','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','EZ WAY 易利委','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.tradevan.prec','藝FUN NEXT','APPS','EVENTS','EVENTS','GOOGLE-tw','EVENTS','藝FUN NEXT','EVENTS',NULL);
INSERT INTO "_app_category" VALUES ('com.trello','Trello','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Trello','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.trendmicro.idsafe','個資保鑣','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','趨勢科技個資保鑣','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.trendmicro.tmmspersonal.apac','行動安全防護','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','行動安全防護與防毒(手機防毒、防詐騙網址、手機優化、保護WIFI安全)','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.tripadvisor.tripadvisor','Tripadvisor： 飯店、活動和餐廳','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','Tripadvisor： 飯店、活動和餐廳','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.truecaller','Truecaller','APPS','PHONE_and_SMS','COMMUNICATION','GOOGLE-tw','COMMUNICATION','Truecaller：來電顯示、垃圾號碼攔截與通話紀錄','PHONE_and_SMS',NULL);
INSERT INTO "_app_category" VALUES ('com.tss','台新PhoneEZ','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','台新證券-PhoneEZ','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.tstartel.tstarcs','台灣之星','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','PRODUCTIVITY','台灣之星','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tsumii.trainschedule','台鐵時刻表','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','火車時刻表-台鐵時刻表','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tuya.smart','Tuya Smart','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Tuya Smart','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.tvbs.news.food.topnews.bestfood.restaurant.news.supertaste.news.ratings.news','食尚玩家','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','食尚玩家','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.twglobalmall.GlobalLifeApp','環球購物中心','APPS','SHOPPING','LIFESTYLE','GOOGLE-tw','LIFESTYLE','Global Mall  環球購物中心','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.twia.howard.LineSlim','LINE 大掃除 - 一鍵瘦身、清除暫存、釋出空間','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','LINE 大掃除 - 一鍵瘦身、清除暫存、釋出空間','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.twitter.android','Twitter','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','Twitter','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.twm.pt.gameportal.offline','天天賺','APPS','ENTERTAINMENT','ENTERTAINMENT',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ubdata.android.uvod','UB影視','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ubercab','Uber','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','Uber 優步 - 預約搭乘','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.ubercab.eats','Uber Eats','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','Uber Eats：美食外送','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.ubot.dbank','New New Bank','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','New New Bank','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.udemy.android','Udemy','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Udemy - 線上課程','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.uniqlo.tw.catalogue','UNIQLO','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','UNIQLO TW','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.vanced.android.youtube','YouTube Vanced','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','apkcombo',NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.vanced.manager','Vanced Manager','APPS','VIDEO_PLAYERS','TOOLS','apkcombo',NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.vega_c.dokodemo','多和夢','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','多和夢網購商城 - 海淘日本直購第一首選','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.vitotechnology.StarWalk2Free','Star Walk 2','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Star Walk 2 Free - 夜空地圖: 觀看天空中的星星 星座 行星和衛星','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.vmons.mediaplayer.music','音樂播放器','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','音樂播放器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.vova.android','Vova','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Vova','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.voyagerx.scanner','vFlat','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','vFlat Scan - 你的移動圖書掃描器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.wachanga.womancalendar','Clover','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','經期追蹤程式。排卵周期 & 排卵計算工具 - 月經與生育月曆。月經週期記錄 可愛版','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.WanDaTong.tbs','臺北轉運站','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','TBS臺北轉運站','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.wantoto.gomaji2','GOMAJI','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','GOMAJI - 最大吃喝玩樂平台','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.wave.waveradio','Wave','APPS','SOCIAL','DATING','GOOGLE-tw','SOCIAL','Wave - 聊天交友、語音直播 遇見好聽的聲音','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.wayi.soulark','靈魂方舟','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','靈魂方舟','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.wealert.weather','天氣即時預報','APPS','WEATHER','WEATHER','GOOGLE-tw','WEATHER','天氣即時預報','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.weibyapps.client.supersister','蘇姐漢堡','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.weibyapps.iorder','微碧愛點餐','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','微碧愛點餐 - 線上美食預訂','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.wemoscooter','WeMo','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','WeMo Scooter','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.weplaydots.twodotsandroid','Two Dots','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','Two Dots','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.whatsapp','WhatsApp','APPS','IM','IM',NULL,'COMMUNICATION','WhatsApp Messenger','IM',NULL);
INSERT INTO "_app_category" VALUES ('com.willmobile.mobilebank.fcb','第e行動','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','第一銀行 第e行動','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.willmobile.mobilebank.skbbank','新光銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','新光銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.winho.joyphotos','JoyPhotos','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','joyPhotos 拍樂洗－線上沖洗照片、相片沖印','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('com.winrgames.bigtime','Big Time ── 免費暢玩遊戲，贏得現金大獎','GAME','GAME_CASINO','GAME_CASINO','GOOGLE-tw','GAME_CASINO','Big Time Cash - 賺錢','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.wisescott.breezeptt','PTTopia','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','PTTopia - App/BBS雙模式PTT App','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.wishmobile.cafe85','85 Cafe','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','85 Cafe','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.wishun.app','6+PLAZA商場','APPS','SHOPPING','SHOPPING',NULL,'LIFESTYLE','6+PLAZA商場','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.womanlog','WomanLog','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','WomanLog日曆','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.wordup.androidapp','WORD UP','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','WORD UP 單字救星+刷題神器 | 2020 多益 學測 統測 指考 托福 雅思測驗','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.wowprimeapp.app','王品瘋美食','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','王品瘋美食','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.wsandroid.suite.samsung','McAfee Security','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.wssyncmldm','軟體更新','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.wsy.google.hk.wansuiye','叫我萬歲爺——皇帝宮廷養成手遊','GAME','GAME_STRATEGY','GAME_STRATEGY','GOOGLE-tw','GAME_STRATEGY','叫我萬歲爺 - 唯美古風宮廷養成','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.xe.currency','Xe','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','Xe – Currency Converter & Global Money Transfers','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.xfungames.chess','英雄棋士團','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','英雄棋士團','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomeng.fategrandorder','Fate/Grand Order','GAME','GAME_CARD','GAME_CARD','GOOGLE-tw','GAME_CARD','Fate/Grand Order','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.account','小米帳號','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.bluetooth','MIUI Bluetooth','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.calendar','Calendar','APPS','Calendar','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','Mi Calendar','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.discover','系統應用升級器','APPS','SYSTEM','SYSTEM','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.hm.health','小米運動','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','小米運動','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.scanner','掃一掃','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.smarthome','米家','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','米家','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.xmsf','Xiaomi service framework','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.xiaomi.xmsfkeeper','Xiaomi Service Framework Keeper','APPS','SYSTEM','TOOLS','apkcombo',NULL,NULL,'SYSTEM',NULL);
INSERT INTO "_app_category" VALUES ('com.xingin.xhs','小紅書','APPS','SOCIAL','SOCIAL','GOOGLE-tw','SOCIAL','小紅書-找到妳想要的生活','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.xten.starfall','Chess Royale','GAME','GAME_BOARD','GAME_BOARD','GOOGLE-tw','GAME_BOARD','皇家西洋棋暢玩版','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.yahoo.mobile.client.android.ecauction','Yahoo奇摩拍賣 - 刊登免費 安心購物','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Yahoo奇摩拍賣 - 刊登免費 安心購物','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.yahoo.mobile.client.android.ecshopping','購物中心','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','Yahoo奇摩購物中心 - 好的生活真的不貴','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.yahoo.mobile.client.android.mail','Yahoo奇摩電子信箱','APPS','BUSINESS','EMAIL',NULL,'COMMUNICATION','Yahoo電子信箱－輕鬆取消訂閱 智慧管理 自動整理電子郵件','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.yahoo.mobile.client.android.newstw','新聞','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','Yahoo奇摩新聞 - 即時重要資訊、議題懶人卡','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.yahoo.mobile.client.android.superapp','Yahoo奇摩','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','Yahoo 奇摩 - 每日新聞生活情報入口','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.yes123.mobile','yes123找工作','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','yes123找工作-面試通知即時收 求職、找打工就是快','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('com.yksix.mos.mosorder','MOS Order','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK',NULL,'LIFESTYLE','MOS Order','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.yocto.wenote','微筆記','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','微筆記 - 彩色記事 待辦清單 提醒及日曆(臺灣版)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.yoger.taptot','Taptot','GAME','GAME_ADVENTURE','GAME_ADVENTURE','GOOGLE-tw','GAME_ADVENTURE','アークナイツ','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.YoStarJP.Arknights','アークナイツ','GAME','GAME_ADVENTURE','GAME_ADVENTURE','GOOGLE-tw','GAME_ADVENTURE','アークナイツ','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.yuanta.android.nexus','投資先生','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','投資先生','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.yuanta.whale','元大證券開戶通','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','元大證券開戶通','Stock',NULL);
INSERT INTO "_app_category" VALUES ('com.yuantabank.newmobilebank.android','元大銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','元大銀行 Yuanta Commercial Bank','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.yum.pizzahut','Pizza Hut','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','Pizza Hut - Food Delivery & Takeout','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.yunjiang','運匠集運','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','運匠集運','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.zhihu.android','知乎','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','知乎','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('com.zjcgame.superdress','Yes, that dress!','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','億萬少女夢','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.zynga.FarmVilleTropicEscape','FarmVille 2: Tropic Escape','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','FarmVille 2: Tropic Escape','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.zynga.pottermatch','哈利波特：解謎魔咒','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','哈利波特：解謎魔咒','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.zzkko','SHEIN','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','SHEIN購物：最熱門的時尚趨勢','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('cz.mobilesoft.appblock','AppBlock','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','AppBlock - Block Websites & Apps: Productivity App','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('dbx.taiwantaxi','台灣大車隊','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台灣大車隊 55688','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('de.smuttlewerk.fleetbattle','Fleet Battle','GAME','GAME_BOARD','GAME_BOARD','GOOGLE-tw','GAME_BOARD','Fleet Battle - Sea Battle','GAME',NULL);
INSERT INTO "_app_category" VALUES ('devian.tubemate.v3','TubeMate','APPS','TOOLS','TOOLS','apkcombo',NULL,NULL,'TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('djapp.app.xqm','XQ全球贏家','APPS','Stock','FINANCE','GOOGLE-tw','FINANCE','XQ全球贏家','Stock',NULL);
INSERT INTO "_app_category" VALUES ('driverlicecne2.cugi.com.driverlicecne2','考駕照','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','考駕照－2021年最新（汽、機車）駕照筆試題庫','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('ecowork.housefun','永慶快搜','APPS','HOUSE_AND_HOME','HOUSE_AND_HOME','GOOGLE-tw','HOUSE_AND_HOME','永慶快搜','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('ecowork.seven','7-ELEVEN','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','7-ELEVEN','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('ee.dustland.android.dustlandsudoku','Sudoku','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','Sudoku - The Clean One','GAME',NULL);
INSERT INTO "_app_category" VALUES ('fall.dude.sandbox.guys.simulator','Run Guys','GAME','GAME_ARCADE','GAME_ARCADE','GOOGLE-tw','GAME_ARCADE','Run Guys: Knockout Royale','GAME',NULL);
INSERT INTO "_app_category" VALUES ('fall.stars.race','S.T.A.R - Super Tricky Amazing Run','GAME','GAME_ARCADE','GAME_ARCADE','GOOGLE-tw','GAME_ARCADE','S.T.A.R - Super Tricky Amazing Run','GAME',NULL);
INSERT INTO "_app_category" VALUES ('flipboard.boxer.app','Briefing','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-tw','NEWS_AND_MAGAZINES','Flipboard Briefing','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('fm.castbox.audiobook.radio.podcast','Castbox','APPS','FINANCE','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Castbox –播客電台有聲書','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('friendo.mtel.loyalty','發票怪獸','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','發票怪獸：每次對獎 都有驚喜','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('gogolook.callgogolook2','Whoscall','APPS','TOOLS','TOOLS',NULL,'COMMUNICATION','Whoscall – 防詐騙 交給來電辨識APP','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('gov.mvdis.m3.emv.app.phone','監理服務','APPS','AUTO_AND_VEHICLES','AUTO_AND_VEHICLES','GOOGLE-tw','AUTO_AND_VEHICLES','監理服務','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('gov.taipei.pass','台北通','APPS','LIFESTYLE','LIFESTYLE',NULL,'PERSONALIZATION','台北通TaipeiPASS','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('gov.tphcc.library','新北愛Book','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','新北愛Book','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('grasea.familife','全家便利商店','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','全家便利商店 FamilyMart','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('guide.tips.untitled.goose.uptop','Guide For Untitled Goose Game - Walkthrough','APPS','GAME_TOOLS','GAME_TOOLS','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('gz.aas.calc8words','論八字','APPS','ENTERTAINMENT','LIFESTYLE','GOOGLE-tw','LIFESTYLE','論八字','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('hearsilent.busplus','Bus+','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','Bus+ (公車動態、臺鐵、捷運、Ubike 查詢)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('hesoft.T2S','T2S','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO',NULL,'TOOLS','T2S - 文字朗讀','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('idv.nightgospel.TWRailScheduleLookUp','雙鐵時刻表','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','雙鐵時刻表(台鐵高鐵、航班、搶票、公車單車、轉乘、捷運)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('in.hahow.hahow','Hahow','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Hahow','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('info.kfsoft.timetable','時間表','APPS','Calendar','BUSINESS','GOOGLE-tw','BUSINESS','新時間表: 時間表 / 課表小工具 - 2021','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('invoice.cof.tw','發票小幫手(雲端發票|統一發票對獎)','APPS','FINANCE','FINANCE',NULL,'TOOLS','發票小幫手(雲端發票|統一發票對獎)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('io.lingvist.android','Lingvist','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Lingvist — 光速學外語','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.ana.anamile','ANA Mileage','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','ANA MILEAGE CLUB','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.canon.ic.cameraconnect','Camera Connect','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Canon Camera Connect','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.cygames.princessconnectredive','PrincessConnectRedive','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','プリンセスコネクト！Re:Dive','GAME',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.fang.squaready','Squaready','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','Squaready','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.kt.sangokushi12','三國志１２','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-tw','GAME_SIMULATION','三國志１２','GAME',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.mixi.monsterstrikeTW','怪物彈珠','GAME','GAME_ACTION','GAME_ACTION','GOOGLE-tw','GAME_ACTION','怪物彈珠 - RPG手機遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.ponos.battlecatstw','貓咪大戰爭','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-tw','GAME_CASUAL','貓咪大戰爭','GAME',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.roland.PianoPartner2','Piano Partner 2','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','Piano Partner 2','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.eure.android.pairs_tw','Pairs','APPS','SOCIAL','DATING','GOOGLE-tw','SOCIAL','Pairs派愛族交友軟體：聊天配對遇見愛情約會結婚的交友App','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('jp.naver.line.android','LINE','APPS','IM','IM',NULL,'COMMUNICATION','LINE','IM',NULL);
INSERT INTO "_app_category" VALUES ('jp.naver.linecamera.android','LINE Camera','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','LINE Camera－照片編輯、動態貼圖、濾鏡','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('jp.ne.hardyinfinity.bluelightfilter.free','Bluelight Filter','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','藍光過濾 ~ 簡單的藍光過濾器 ~ （原名：藍色光濾波器 - 保護視力 緩解疲勞 眼部健康）','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.ne.ibis.ibispaintx.app','愛筆思画X','APPS','ART_AND_DESIGN','ART_AND_DESIGN','GOOGLE-tw','ART_AND_DESIGN','愛筆思画 X(ibis Paint X)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.pxv.android','pixiv','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE',NULL,'SOCIAL','pixiv','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.united.app.kanahei.money','Kanahei記帳本','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','家計簿～操作簡單又可愛的卡娜赫拉家計簿幫您節約～','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.wpblog.hatopp.simpleweightmanager','簡單體重管理','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','簡單體重管理','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('kr.co.vcnc.android.couple','Between','APPS','SOCIAL','DATING','GOOGLE-tw','SOCIAL','Between 情侶必備一對一專屬 App','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('kr.co.yjteam.dailyday','DAILY DAY','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','DAILY DAY - 日期计算器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('kr.co.yjteam.dailynote','DAILY NOTE','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','DAILY NOTE - 每日筆記/日記','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('labelingStudy.nctu.boredom_detection','殺時間標記','APPS','EVENTS','EVENTS',NULL,NULL,NULL,'EVENTS',NULL);
INSERT INTO "_app_category" VALUES ('labelingStudy.nctu.minuku_2','Labeling Study','APPS','EVENTS','EVENTS',NULL,NULL,NULL,'EVENTS',NULL);
INSERT INTO "_app_category" VALUES ('le.lenovo.sudoku','數獨世界','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','數獨世界 - 經典九宮格健腦休閒益智遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('mbinc12.mb32','MixerBox','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','免費音樂歌曲MV播放器！全台曲庫最大的免費音樂神器 - MixerBox (MB3)｜限時免費下載！','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('me.mycake','Cake','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','Cake：365天每日更新免費英語例句','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('mega.privacy.android.app','MEGA','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','MEGA','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('moe.low.arc','Arcaea','GAME','GAME_MUSIC','GAME_MUSIC','GOOGLE-tw','GAME_MUSIC','Arcaea – 創新立體節奏遊戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('money.com.cwinvoice','雲端發票集點王','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','雲端發票集點王','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('money.com.invoicemanager','發票載具','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','發票載具-雲端發票專屬獎，統一發票自動兌獎 (無廣告 雲端發票 電子發票 手機條碼)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('money.expense.budget.wallet.manager.track.finance.tracker','Money Manager','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','記賬 - 財務管理 理財賬本 記錄你的開支','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('mong.moptt','Mo PTT','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','Mo PTT','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('myrecorder.voicerecorder.voicememos.audiorecorder.recordingapp','MyRecorder','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','MyRecorder-語音備忘錄和一鍵錄音機','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('name.pilgr.appdialer.pro','App Dialer Pro','APPS','PERSONALIZATION','PERSONALIZATION',NULL,'PRODUCTIVITY','App Dialer Pro','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('net.android.wzdworks.magicday','隱私月月記','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','隱私月月記 (Once  女生經期管理應用)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('net.daum.android.solcalendar','Sol日曆','APPS','Calendar','PRODUCTIVITY','apkcombo',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('net.fetnet.fetvod','friDay影音','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-tw','VIDEO_PLAYERS','friDay影音-電影、跟播韓劇、日劇、陸劇、台劇、韓綜、新番動漫、親子、霹靂、多視角直播線上看','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('net.gamon.bdTW','少女樂團派對','GAME','GAME_MUSIC','GAME_MUSIC','GOOGLE-tw','GAME_MUSIC','BanG Dream! 少女樂團派對','GAME',NULL);
INSERT INTO "_app_category" VALUES ('net.lrstudios.android.tsumego_workshop','Tsumego Pro','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','Tsumego Pro - 詰碁','GAME',NULL);
INSERT INTO "_app_category" VALUES ('net.rejinderi.totallyfreevpn','完全免費VPN','APPS','TOOLS','TOOLS','GOOGLE-tw','COMMUNICATION','完全免費VPN！無限制！不需戶口！','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('net.toptoon.android.apps','TOPTOON','APPS','COMICS','COMICS','apktada',NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('nexti.android.bustaichung','台中等公車','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台中等公車(公車路線、捷運、台鐵動態查詢）','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('nexti.android.bustaipei','台北等公車','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台北等公車(公車路線、捷運、台鐵動態查詢）','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('nexti.android.bustaiwan','台灣等公車','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台灣等公車(公車路線、捷運、台鐵動態查詢）','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('notes.notebook.memo.pad.color.notepad.locker','筆記','APPS','PRODUCTIVITY','LIFESTYLE','apktada',NULL,'Notepad - Notes with Reminder, ToDo, Sticky notes apk','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('org.codeaurora.snapcam','相機','APPS','PHOTOGRAPHY','TOOLS','apkcombo',NULL,NULL,'PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('org.de_studio.recentappswitcher.trial','Swiftly switch','APPS','Launcher','Launcher','GOOGLE-tw','PRODUCTIVITY','Sidebar  Edge Screen  Shortcuts - Swiftly Switch','Launcher',NULL);
INSERT INTO "_app_category" VALUES ('org.ifaa.android.manager','IFAA Manager','APPS','FINANCE','FINANCE',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('org.iggymedia.periodtracker','Flo','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','月經週期、 排卵期、懷孕日曆 , 生育月曆 Flo','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('org.ksens.java.android.pedometer','Pedometer','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS',NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('org.mmh.phonereg','馬偕行動掛號','APPS','HEALTH_AND_FITNESS','MEDICAL','GOOGLE-tw','MEDICAL','馬偕行動掛號','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('org.nixgame.ruler','Ruler','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','尺子  卷尺 (Ruler)','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('org.redidea.voicetube','VoiceTube','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','VoiceTube 看影片學英語：免費學習英文聽力口說單字','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('org.tabf.botexam','TABF照相甄試','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','TABF甄試拍照','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('org.telegram.messenger','Telegram','APPS','IM','IM',NULL,'COMMUNICATION','Telegram','IM',NULL);
INSERT INTO "_app_category" VALUES ('org.vndnguyen.phoneinfo','Phone INFO','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Phone INFO ★SAM★','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('org.zwanoo.android.speedtest','Speedtest','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','Speedtest - 速度測試','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('park.outlook.sign.in.client','Email App','APPS','BUSINESS','EMAIL','GOOGLE-tw','COMMUNICATION','為Outlook與其他郵件客戶端電子郵件應用程序','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('pedometer.stepcounter.calorieburner.pedometerforwalking','計步器','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','計步器 - 健康記錄計步器及卡路里計算器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('pg86908024.cpc.org.tw','麗文校園通','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','麗文校園通','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('photocollage.photoeditor.collagemaker','inCollage拼圖軟件','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','相片編輯器，拼圖照片組合','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('px.com.nineyi.shop.s000002','全聯線上購','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','全聯線上購 | 小時達 送到家','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('ringtone.maker.mp3.cutter.audio','音頻裁剪 & 鈴聲製作器','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','音頻剪輯器 - 鈴聲剪輯，音樂裁剪，音頻合併','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('seekrtech.sleep','SleepTown','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','SleepTown 睡眠小鎮','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('sg.omi','Omi','APPS','SOCIAL','DATING','GOOGLE-tw','SOCIAL','Omi：與超靈月老廟合作 搖出你的戀愛籤！','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('soft_world.mycard.mycardapp','MyCard','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-tw','ENTERTAINMENT','MyCard','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('sort.water.puzzle.pour.color.tubes.sorting.game','Water Sort Puzzle','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','排序水拼圖 - 顏色分類游戲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('space.zoomo.moodii','moodii','APPS','SOCIAL','DATING','GOOGLE-tw','SOCIAL','Moodii - 全新型態心情社交APP 匿名用聲音找到懂自己的人','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('sudoku.puzzle.free.game.brain','數獨','GAME','GAME_PUZZLE','GAME_PUZZLE','GOOGLE-tw','GAME_PUZZLE','數獨 - 數獨習題集 益智遊戲 數獨闖關大挑戰','GAME',NULL);
INSERT INTO "_app_category" VALUES ('today.wootalk.mobile','WooTalk','APPS','SOCIAL','DATING',NULL,'SOCIAL','WooTalk | 吾聊、不無聊','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('tunein.player','TuneIn Radio','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','TuneIn 電台：新聞、體育、音樂和廣播電台。','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tv.danmaku.bili','嗶哩嗶哩','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','apkcombo',NULL,NULL,'VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('tv.twitch.android.app','Twitch','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,'ENTERTAINMENT','Twitch','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.agudoe2.ATrainTime2','無廣告火車時刻表ATrainTime2','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','apktada',NULL,NULL,'MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('tw.clotai.easyreader','輕鬆讀小說','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','輕鬆讀小說','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.co.akindo_sushiro.sushiroapp','台灣壽司郎','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','台灣壽司郎','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.ainvest.outpack','神盾測速照相','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','神盾測速照相','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.bank518','518熊班','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','518熊班 - 找工作很簡單！最貼近你的全職、兼職、打工的求職平台','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.books.android.ebook','博客來電子書','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-tw','BOOKS_AND_REFERENCE','博客來電子書','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.books.android.plus','博客來','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','博客來','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.cosmed.shop','康是美','APPS','SHOPPING','SHOPPING',NULL,'LIFESTYLE','康是美','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.costco','Costco','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','COSTCO 好市多','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.dsfitsol','纖塑體重管理','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-tw','HEALTH_AND_FITNESS','纖塑體重管理','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.event.funtaichung','臺中購物節','APPS','EVENTS','EVENTS','GOOGLE-tw','EVENTS','臺中購物節','EVENTS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.feebee','飛比價格','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','飛比價格 - 購物拍賣比價找便宜必備小幫手 - Feebee','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.gamebox','遊戲箱子','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','遊戲箱子','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.gamer.android.activecenter','巴哈姆特','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','巴哈姆特 - 華人最大遊戲及動漫社群網站','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.gamer.android.animad','動畫瘋','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS',NULL,'ENTERTAINMENT','巴哈姆特動畫瘋','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.hncb.sny','SnY','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','SnY','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.jihsunbank.mobilebank','日盛銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','日盛銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.jinher.jgfcapp','繼光香香雞','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','繼光香香雞','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.lativ.shopping','lativ','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','lativ - 提供平價且高品質服飾','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.masterhand.iwashuser','SparKlean','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','SparKlean Laundry 洗衣外送','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.mcddaily','麥當勞','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK',NULL,'LIFESTYLE','麥當勞報報','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.megabank.mobilebank.pre','兆豐銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','兆豐銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.moneybook.moneybook','Moneybook','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','麻布記帳Moneybook-最創新的記帳服務','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.mujipassport.android.app','passport','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','MUJI passport','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.npcgas.member','全國加油站','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','全國加油站','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.nuphoto.nuphoto','nuPhoto','APPS','PHOTOGRAPHY','PHOTOGRAPHY','GOOGLE-tw','PHOTOGRAPHY','nuPhoto拍立洗-沖洗照片只要3元 手機製作似顏繪/無框畫/相片書/桌曆 旅遊成長紀錄首選','PHOTOGRAPHY',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.off.taiwanradio','台灣收音機','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-tw','MUSIC_AND_AUDIO','台灣收音機、台灣電台、網路收音機、網路電台 台灣廣播','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.part518','小雞上工','APPS','BUSINESS','BUSINESS','GOOGLE-tw','BUSINESS','小雞上工 - 全台最大打工APP 找打工和兼職最迅速','BUSINESS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.pchome.android.pi','Pi 拍錢包','APPS','PAY','PAY',NULL,'FINANCE','Pi 拍錢包','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.pcstore.mseller','個人賣場','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','PChome商店街個人賣場','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.pkcard','PK雙饗卡','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-tw','FOOD_AND_DRINK','PK雙饗卡-必勝客x肯德基行動會員卡','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.quickscanner.invoice','發票存摺','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','發票存摺+統一發票對獎機-雲端發票載具歸戶、會員卡管理、生活繳費、簡訊實聯制 QRcode 掃描器','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.rakuten.rakuemon','Pickup','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','樂天Pickup 便利您生活的電子票券!','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.scsb.android','上海銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','上海商業儲蓄銀行『行動網銀』','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.scsb.android.mbank','掌上銀','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','上海商業儲蓄銀行『掌上銀』','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.sstc.youbike','YouBike','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','YouBike微笑單車1.0 官方版','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.taishinbank.ccapp','Richart Life','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','Richart Life','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.taishinbank.mobile','台新銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','台新銀行 「行動銀行」　','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.taishinbank.richart','Richart','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','Richart','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.tdcc.epassbook','集保e手掌握','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','集保e手掌握(集保e存摺/手機存摺)','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.thsrc.enterprise','台灣高鐵','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台灣高鐵','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.thsrc.texpress','T-EX行動購票','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台灣高鐵 T Express行動購票服務','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.trtc.is.android05','台北捷運Go','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-tw','MAPS_AND_NAVIGATION','台北捷運Go','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.twmp.twhcewallet','台灣行動支付','APPS','PAY','PAY',NULL,'FINANCE','台灣行動支付 - 轉帳免手續費','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.watsons.app','屈臣氏台灣','APPS','SHOPPING','SHOPPING','GOOGLE-tw','SHOPPING','屈臣氏台灣','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.yoxi.rider','yoxi','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','yoxi','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.comico','comico','APPS','COMICS','COMICS','GOOGLE-tw','COMICS','comico 免費全彩漫畫','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.edu.nctu.act','行動交大','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','陽明交大','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.gov.cdc.exposurenotifications','臺灣社交距離','APPS','HEALTH_AND_FITNESS','MEDICAL',NULL,'TOOLS','臺灣社交距離','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.gov.invoice','統一發票兌獎','APPS','FINANCE','LIFESTYLE','GOOGLE-tw','LIFESTYLE','統一發票兌獎','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.gov.nsc.mobileApp.NSCApp_ns','科學園區行動精靈2.0','APPS','TRAVEL_AND_LOCAL','MAPS_AND_NAVIGATION',NULL,'TOOLS','科學園區行動精靈2.0','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.gov.post.guard','郵保鑣','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','郵保鑣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.gov.tra.twtraffic','tra-ptr-app','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','台鐵e訂通','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.mobileapp.qrcode.banner','QR碼掃瞄器','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','QR Code 掃描器','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('tw.net.pic.m.openpoint','OPEN POINT','APPS','PAY','PAY',NULL,'LIFESTYLE','OPEN POINT：有7-ELEVEN真好！','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.sonet.wiz','黑貓','GAME','GAME_TRIVIA','GAME_TRIVIA','GOOGLE-tw','GAME_TRIVIA','問答RPG 魔法使與黑貓維茲','GAME',NULL);
INSERT INTO "_app_category" VALUES ('tw.thinkingsoftware.geofence','電子柵欄','APPS','TOOLS','TOOLS','GOOGLE-tw','TOOLS','電子柵欄','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('tw.txwy.and.arknights','明日方舟','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','明日方舟','GAME',NULL);
INSERT INTO "_app_category" VALUES ('tw.xdg.and.rs','藍顏清夢','GAME','GAME_ROLE_PLAYING','GAME_ROLE_PLAYING','GOOGLE-tw','GAME_ROLE_PLAYING','藍顏清夢——穿越清朝當皇妃','GAME',NULL);
INSERT INTO "_app_category" VALUES ('uk.co.bbc.learningenglish','BBC Learning English','APPS','EDUCATION','EDUCATION','GOOGLE-tw','EDUCATION','BBC Learning English','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('videoeditor.videorecorder.screenrecorder','XRecorder','APPS','VIDEO_EDITOR','VIDEO_EDITOR',NULL,'VIDEO_PLAYERS','螢幕錄影大師 - 錄製屏幕、高清錄製影片、一鍵截屏工具、高清錄屏、XRecorder','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('wbank.ubot.com.tw','聯邦銀行','APPS','FINANCE','FINANCE','GOOGLE-tw','FINANCE','聯邦行動銀行','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('works.jubilee.timetree','TimeTree','APPS','PRODUCTIVITY','PRODUCTIVITY','GOOGLE-tw','PRODUCTIVITY','共用行事曆：TimeTree 家人情侶間的時間管理','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('y_studio.ka5983.ptt2','BePTT','APPS','SOCIAL','SOCIAL',NULL,'SOCIAL','BePTT - 簡潔的行動裝置PTT瀏覽器(可免登入)','SOCIAL',NULL);
INSERT INTO "_app_category" VALUES ('zoeknow.com.funnow','FunNow','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-tw','TRAVEL_AND_LOCAL','FunNow - 即時預訂都會享樂的第一選擇','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('NA','NA',NULL,NULL,NULL,NULL,NULL,NULL,'OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.nike.plusgps','Nike Run Club','APPS','HEALTH_AND_FITNESS','HEALTH_AND_FITNESS','GOOGLE-cn','HEALTH_AND_FITNESS','Nike Run Club','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.medium.reader','Medium','APPS','NEWS_AND_MAGAZINES','NEWS_AND_MAGAZINES','GOOGLE-cn','NEWS_AND_MAGAZINES','Medium','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.halo.wifikey.wifilocating','WiFi 大师 - 免费,安全,快速连接Wi-Fi','APPS','TOOLS','TOOLS','GOOGLE-cn','TOOLS','WiFi 大师 - 免费,安全,快速连接Wi-Fi','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.buddysquare.benefit','福利會社','APPS','SHOPPING','SHOPPING','GOOGLE-cn','SHOPPING','福利會社','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('tl.android.mod','MOD - 電視頻道電影紀實霹靂線上看+機上盒便利操作助手','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-cn','ENTERTAINMENT','MOD - 電視頻道電影紀實霹靂線上看+機上盒便利操作助手','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mercuries.app','三商i美食卡','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-cn','FOOD_AND_DRINK','三商i美食卡','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('net.maximmedia.hitfm','Hit FM','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-cn','ENTERTAINMENT','Hit FM','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.garena.game.fctw','Garena Speed Drifters','GAME','GAME_RACING','GAME_RACING','GOOGLE-cn','GAME_RACING','Garena Speed Drifters','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.soundcloud.android','SoundCloud：音乐&音频','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-cn','MUSIC_AND_AUDIO','SoundCloud：音乐&音频','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.bandcamp.android','Bandcamp','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-cn','MUSIC_AND_AUDIO','Bandcamp','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.haochang.party','全民Party-唱歌交友軟體,免費歡歌交友app','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-cn','MUSIC_AND_AUDIO','全民Party-唱歌交友軟體,免費歡歌交友app','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.arcadegame.games.bingo.holiday.free.slots.bash','Bingo Holiday:Bingo Games','GAME','GAME_CASINO','GAME_CASINO','GOOGLE-cn','GAME_CASINO','Bingo Holiday:Bingo Games','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ieat.app','iEAT 饗愛吃','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-cn','FOOD_AND_DRINK','iEAT 饗愛吃','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.qsquare.qsmem','京站時尚廣場','APPS','SHOPPING','SHOPPING','GOOGLE-cn','SHOPPING','京站時尚廣場','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.giant.ichiran','一蘭台灣','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-cn','FOOD_AND_DRINK','一蘭台灣','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.familygourmet.FIGapp','享聚卡','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-cn','FOOD_AND_DRINK','享聚卡','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.syntrend.app','三創生活園區SYNTREND','APPS','LIFESTYLE','LIFESTYLE','GOOGLE-cn','LIFESTYLE','三創生活園區SYNTREND','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.skm.siapp','新光三越','APPS','SHOPPING','SHOPPING','GOOGLE-cn','SHOPPING','新光三越','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.nexstreaming.app.kinemasterfree','巧影 - 视频编辑&视频剪辑&视频制作','APPS','VIDEO_PLAYERS','VIDEO_PLAYERS','GOOGLE-cn','VIDEO_PLAYERS','巧影 - 视频编辑&视频剪辑&视频制作','VIDEO_PLAYERS',NULL);
INSERT INTO "_app_category" VALUES ('com.qburger.memberapp','Q Burger饗樂餐飲','APPS','FOOD_AND_DRINK','FOOD_AND_DRINK','GOOGLE-cn','FOOD_AND_DRINK','Q Burger饗樂餐飲','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.nineyi.shop.s001987','aPure：機能性服飾領導品牌','APPS','SHOPPING','SHOPPING','GOOGLE-cn','SHOPPING','aPure：機能性服飾領導品牌','SHOPPING',NULL);
INSERT INTO "_app_category" VALUES ('com.chb.mobile','彰銀行動網','APPS','FINANCE','FINANCE','GOOGLE-cn','FINANCE','彰銀行動網','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.kingwaytek.naviking.telemetrics','樂客導航王TM路況預測版','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-cn','MAPS_AND_NAVIGATION','樂客導航王TM路況預測版','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.wejoy.weplay','WePlay - 线上桌游吧','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-cn','ENTERTAINMENT','WePlay - 线上桌游吧','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.nordcurrent.flyingfever','飞机大厨','GAME','GAME_ARCADE','GAME_ARCADE','GOOGLE-cn','GAME_ARCADE','飞机大厨','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.mega','兆豐證券-行動VIP','APPS','FINANCE','FINANCE','GOOGLE-cn','FINANCE','兆豐證券-行動VIP','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.carplus.goSmart','格上GoSmart','APPS','TRAVEL_AND_LOCAL','TRAVEL_AND_LOCAL','GOOGLE-cn','TRAVEL_AND_LOCAL','格上GoSmart','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.maf.idle.hamster.factory.manager.cookie.tycoon','Hamster Cookie Factory','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-cn','GAME_SIMULATION','Hamster Cookie Factory','GAME',NULL);
INSERT INTO "_app_category" VALUES ('team.nex.arcadexp','Active Arcade - 活力街','GAME','GAME_CASUAL','GAME_CASUAL','GOOGLE-cn','GAME_CASUAL','Active Arcade - 活力街','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.Noxygames.Lanota','Lanota - 动感节奏音乐游戏','GAME','GAME_MUSIC','GAME_MUSIC','GOOGLE-cn','GAME_MUSIC','Lanota - 动感节奏音乐游戏','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.ximalaya.ting.himalaya','喜马拉雅国际版Himalaya：听书听小说，有声书相声电台','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-cn','BOOKS_AND_REFERENCE','喜马拉雅国际版Himalaya：听书听小说，有声书相声电台','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.mobisystems.msdict.embedded.wireless.oxford.dictionaryofenglish','Oxford Dictionary of English','APPS','BOOKS_AND_REFERENCE','BOOKS_AND_REFERENCE','GOOGLE-cn','BOOKS_AND_REFERENCE','Oxford Dictionary of English','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.dev47apps.droidcam','DroidCam 摄像头','APPS','TOOLS','TOOLS','GOOGLE-cn','TOOLS','DroidCam 摄像头','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('nu.lower.brightness','屏幕变暗','APPS','TOOLS','TOOLS','GOOGLE-cn','TOOLS','屏幕变暗','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.maxmpz.audioplayer','Poweramp','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-cn','MUSIC_AND_AUDIO','Poweramp','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.gotrust.mfa.authenticator.consumer.gotrust','GoTrust ID','APPS','TOOLS','TOOLS','GOOGLE-cn','TOOLS','GoTrust ID','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('com.appalliance.xiyen','禧艷 單身聯誼App-線上聊天，實體聯誼活動交友','APPS','DATING','DATING','GOOGLE-cn','DATING','禧艷 單身聯誼App-線上聊天，實體聯誼活動交友','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.cathaysec.eservice','國泰證券e櫃台－24H線上櫃台，申辦業務更輕鬆','APPS','FINANCE','FINANCE','GOOGLE-cn','FINANCE','國泰證券e櫃台－24H線上櫃台，申辦業務更輕鬆','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('jp.co.imagineer.sumikkogurashi.farm','Sumikkogurashi Farm','GAME','GAME_SIMULATION','GAME_SIMULATION','GOOGLE-cn','GAME_SIMULATION','Sumikkogurashi Farm','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.idea.PhoneDoctorPlus','手机医生','APPS','TOOLS','TOOLS','GOOGLE-cn','TOOLS','手机医生','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('tw.com.kgi.ecapp','隨身e策略','APPS','FINANCE','FINANCE','GOOGLE-cn','FINANCE','隨身e策略','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.fundevs.app.mediaconverter','Video MP3 Converter','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-cn','MUSIC_AND_AUDIO','Video MP3 Converter','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.soundbrenner.pulse','声宾纳节拍器 (Soundbrenner): 掌握自己的节奏','APPS','MUSIC_AND_AUDIO','MUSIC_AND_AUDIO','GOOGLE-cn','MUSIC_AND_AUDIO','声宾纳节拍器 (Soundbrenner): 掌握自己的节奏','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.pklotcorp.autopass','車麻吉 - 導航, 油價, 停車費, 行動支付','APPS','MAPS_AND_NAVIGATION','MAPS_AND_NAVIGATION','GOOGLE-cn','MAPS_AND_NAVIGATION','車麻吉 - 導航, 油價, 停車費, 行動支付','MAPS_AND_NAVIGATION',NULL);
INSERT INTO "_app_category" VALUES ('com.kbro.portal','凱擘大寬頻客服','APPS','TOOLS','TOOLS','GOOGLE-cn','TOOLS','凱擘大寬頻客服','TOOLS',NULL);
INSERT INTO "_app_category" VALUES ('edu.ntch.oa.plus.ticket','OPENTIX','APPS','ENTERTAINMENT','ENTERTAINMENT','GOOGLE-cn','ENTERTAINMENT','OPENTIX','OTHERS',NULL);
INSERT INTO "_app_category" VALUES ('com.rayark.valkyrie','VOEZ','GAME','GAME_MUSIC','GAME_MUSIC','GOOGLE-cn','GAME_MUSIC','VOEZ','GAME',NULL);
INSERT INTO "_app_category" VALUES ('com.entrust.appportal','華南好神e櫃台','APPS','FINANCE','FINANCE','GOOGLE-en','FINANCE','華南好神e櫃台','OTHERS',NULL);
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:50.227','com.android.settings','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:51.639','com.android.settings','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:52.750','com.android.settings','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:52.887','com.android.settings','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:53.978','com.android.settings','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:55.398','com.android.settings','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:55.557','com.android.settings','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:41:57.143','com.android.settings','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:42:01.542','com.android.settings','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:42:01.620','com.android.settings','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:42:02.619','com.android.settings','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:42:02.769','com.android.settings','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:42:04.074','com.android.settings','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:42:05.490','com.android.settings','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Settings','2023-02-05 17:42:06.581','com.android.settings','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Permission controller','2023-02-05 17:42:13.576','com.google.android.permissioncontroller','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 17:42:14.877','com.android.systemui','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 17:42:17.029','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:42:23.834','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:42:24.968','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:42:26.131','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:42:50.439','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 17:42:52.847','com.android.systemui','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:42:55.339','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:42:56.613','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:42:56.619','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 17:42:56.776','labelingStudy.nctu.boredom_detection','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 17:43:00.448','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 17:43:09.287','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:43:14.171','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:43:14.837','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 17:43:19.360','com.android.systemui','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Chrome','2023-02-05 17:43:28.205','com.android.chrome','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Chrome','2023-02-05 17:43:28.238','com.android.chrome','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:43:29.972','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 17:43:59.800','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Google','2023-02-05 17:44:05.605','com.google.android.googlequicksearchbox','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Google','2023-02-05 17:44:15.593','com.google.android.googlequicksearchbox','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 18:31:42.066','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 18:31:43.929','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 18:31:48.348','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 18:31:51.822','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 18:31:56.529','com.android.systemui','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:06:03.419','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:06:13.032','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:06:13.036','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:09:20.612','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:09:21.616','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:09:28.075','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:09:28.798','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:09:33.033','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:09:33.354','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:09:33.722','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:10:23.629','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:10:36.631','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:10:39.202','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:10:40.745','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:10:40.748','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:10:44.361','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:10:48.024','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:10:56.238','labelingStudy.nctu.boredom_detection','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:13:41.852','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:13:48.068','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:13:49.908','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:13:54.193','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:13:54.428','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:13:57.591','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:02.628','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:03.013','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:03.170','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:32.480','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:32.944','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:33.274','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Gboard','2023-02-05 19:14:51.189','com.google.android.inputmethod.latin','TYPE_VIEW_HOVER_ENTER');
INSERT INTO "accessibility" VALUES ('U00','Gboard','2023-02-05 19:14:51.293','com.google.android.inputmethod.latin','TYPE_VIEW_HOVER_EXIT');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:55.527','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:14:57.198','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:15:00.795','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:15:09.082','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:15:09.923','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:15:12.041','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:15:14.004','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:21.154','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:21.997','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:22.190','com.google.android.apps.maps','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:25.377','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:26.573','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:28.851','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Gboard','2023-02-05 19:15:33.032','com.google.android.inputmethod.latin','TYPE_VIEW_HOVER_ENTER');
INSERT INTO "accessibility" VALUES ('U00','Gboard','2023-02-05 19:15:33.118','com.google.android.inputmethod.latin','TYPE_VIEW_HOVER_EXIT');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:33.132','com.google.android.apps.maps','TYPE_VIEW_TEXT_CHANGED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:35.055','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:35.583','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:37.151','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:38.114','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:40.480','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:41.968','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:48.354','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:59.016','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:15:59.745','com.google.android.apps.maps','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:16:00.784','com.google.android.apps.nexuslauncher','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:04.015','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:07.082','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:07.504','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:08.752','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:10.314','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:14.784','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:15.487','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:17.457','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:18.163','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:20.769','com.google.android.apps.maps','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:22.396','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:24.669','com.google.android.apps.maps','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:25.484','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:27.430','com.google.android.apps.maps','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:28.205','com.google.android.apps.maps','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:29.624','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:31.986','com.google.android.apps.maps','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:32.617','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:34.644','com.google.android.apps.maps','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','Maps','2023-02-05 19:16:35.129','com.google.android.apps.maps','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:16:50.994','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:16:50.999','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:16:52.261','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:17:33.413','labelingStudy.nctu.boredom_detection','TYPE_VIEW_LONG_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:17:35.257','labelingStudy.nctu.boredom_detection','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:17:40.528','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:17:41.618','labelingStudy.nctu.boredom_detection','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:17:46.296','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:17:48.150','labelingStudy.nctu.boredom_detection','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:17:53.488','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:19:18.027','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:19:23.764','com.android.systemui','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:19:30.928','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:19:40.944','com.google.android.apps.nexuslauncher','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','Pixel Launcher','2023-02-05 19:19:40.948','com.google.android.apps.nexuslauncher','TYPE_VIEW_FOCUSED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:19:41.094','labelingStudy.nctu.boredom_detection','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:19:42.901','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:19:52.449','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:19:54.740','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:19:58.312','labelingStudy.nctu.boredom_detection','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','BoredomApp','2023-02-05 19:19:58.864','labelingStudy.nctu.boredom_detection','TYPE_VIEW_CLICKED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:20:06.293','com.android.systemui','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:20:45.096','com.android.systemui','TYPE_VIEW_SCROLLED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:22:48.107','com.android.systemui','TYPE_VIEW_SELECTED');
INSERT INTO "accessibility" VALUES ('U00','System UI','2023-02-05 19:22:51.296','com.android.systemui','TYPE_VIEW_SCROLLED');
INSERT INTO "user_experiment" VALUES ('U00','2023-02-05','2023-02-05 17:42:29','2023-02-05 18:42:29');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 17:44:46.957','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 18:31:40.969','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 18:32:25.711','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:06:02.271','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:10:22.495','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:10:22.699','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:10:26.122','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:10:35.464','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:10:58.693','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:10:58.846','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:11:02.847','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:13:40.697','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:18:07.124','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:19:16.915','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:19:25.799','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:19:29.829','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:20:35.870','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:20:36.492','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:21:14.764','ACTION_SCREEN_OFF');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:22:46.948','ACTION_SCREEN_ON');
INSERT INTO "intent_action" VALUES ('U00','2023-02-05 19:23:23.659','ACTION_SCREEN_OFF');
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:06:32','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0,0,0,0,1,-9999,'',-9999,'static',29.7289878129959,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190632',1,7,'/1/U00_20230205190602;/1/U00_20230205190607;/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632',29.729,2016.56,19.0,1.0,3.0,1.0,0.0336371892764641,29.729,29.729,NULL,29.729,29.729,29.729,1.0,0.0336371892764641,0.0,0.0,1.0,0.0336371892764641,0.0,0.0,0.0,0.0,1.0,0.0336371892764641,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0336371892764641,1.0,7.229,0.0,0.0,22.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:06:37','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0,0,0,0,1,-9999,'',-9999,'static',34.7290009260178,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190637',0,7,'/1/U00_20230205190607;/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637',34.729,2016.56,19.0,1.0,3.0,1.0,0.0287943793371534,34.729,34.729,NULL,34.729,34.729,34.729,1.0,0.0287943793371534,0.0,0.0,1.0,0.0287943793371534,0.0,0.0,0.0,0.0,1.0,0.0287943793371534,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0287943793371534,1.0,7.229,0.0,0.0,27.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:06:42','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0,0,0,0,1,-9999,'',-9999,'static',39.7290140390396,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190642',0,7,'/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642',39.729,2016.56,19.0,1.0,3.0,1.0,0.0251705303430743,39.729,39.729,NULL,39.729,39.729,39.729,1.0,0.0251705303430743,0.0,0.0,1.0,0.0251705303430743,0.0,0.0,0.0,0.0,1.0,0.0251705303430743,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0251705303430743,1.0,7.229,0.0,0.0,32.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:06:47','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0,0,0,0,1,-9999,'',-9999,'static',44.7289869189262,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190647',0,7,'/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647',44.729,2016.56,19.0,1.0,3.0,1.0,0.0223568602025532,44.729,44.729,NULL,44.729,44.729,44.729,1.0,0.0223568602025532,0.0,0.0,1.0,0.0223568602025532,0.0,0.0,0.0,0.0,1.0,0.0223568602025532,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0223568602025532,1.0,7.229,0.0,0.0,37.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:06:52','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0,0,0,0,1,-9999,'',-9999,'static',49.7290000319481,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190652',0,7,'/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652',49.729,2016.56,19.0,1.0,3.0,1.0,0.0201089907297553,49.729,49.729,NULL,49.729,49.729,49.729,1.0,0.0201089907297553,0.0,0.0,1.0,0.0201089907297553,0.0,0.0,0.0,0.0,1.0,0.0201089907297553,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0201089907297553,1.0,7.229,0.0,0.0,42.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:06:57','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0,0,0,0,1,-9999,'',-9999,'static',54.7290131449699,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190657',0,7,'/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657',54.729,2016.56,19.0,1.0,3.0,1.0,0.0182718485629191,54.729,54.729,NULL,54.729,54.729,54.729,1.0,0.0182718485629191,0.0,0.0,1.0,0.0182718485629191,0.0,0.0,0.0,0.0,1.0,0.0182718485629191,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0182718485629191,1.0,7.229,0.0,0.0,47.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:02','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.25,0,0,0,1,-9999,'',-9999,'static',59.7289860248566,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190702',0,7,'/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702',59.729,2016.56,19.0,1.0,3.0,1.0,0.0167422859917293,59.729,59.729,NULL,59.729,59.729,59.729,1.0,0.0167422859917293,0.0,0.0,1.0,0.0167422859917293,0.0,0.0,0.0,0.0,1.0,0.0167422859917293,0.0,0.0,0.0192307692307692,0.0693375245281536,0.25,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0167422859917293,1.0,7.229,0.0,0.0,52.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:07','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.25,0,0,0,1,-9999,'',-9999,'static',64.7289991378784,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190707',0,7,'/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707',64.729,2016.56,19.0,1.0,3.0,1.0,0.0154490259389146,64.729,64.729,NULL,64.729,64.729,64.729,1.0,0.0154490259389146,0.0,0.0,1.0,0.0154490259389146,0.0,0.0,0.0,0.0,1.0,0.0154490259389146,0.0,0.0,0.0357142857142857,0.0907841299003204,0.25,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0154490259389146,1.0,7.229,0.0,0.0,57.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:12','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',69.7290122509003,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190712',0,7,'/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712',69.729,2016.56,19.0,1.0,3.0,1.0,0.0143412353540134,69.729,69.729,NULL,69.729,69.729,69.729,1.0,0.0143412353540134,0.0,0.0,1.0,0.0143412353540134,0.0,0.0,0.0,0.0,1.0,0.0143412353540134,0.0,0.0,0.1,0.263899331455874,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0143412353540134,1.0,7.229,0.0,0.0,62.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:17','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',74.7289851307869,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190717',0,7,'/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717',74.729,2016.56,19.0,1.0,3.0,1.0,0.0133816858247802,74.729,74.729,NULL,74.729,74.729,74.729,1.0,0.0133816858247802,0.0,0.0,1.0,0.0133816858247802,0.0,0.0,0.0,0.0,1.0,0.0133816858247802,0.0,0.0,0.15625,0.340036762718386,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0133816858247802,1.0,7.229,0.0,0.0,67.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:22','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',79.7289982438087,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190722',0,7,'/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722',79.729,2016.56,19.0,1.0,3.0,1.0,0.0125424876770059,79.729,79.729,NULL,79.729,79.729,79.729,1.0,0.0125424876770059,0.0,0.0,1.0,0.0125424876770059,0.0,0.0,0.0,0.0,1.0,0.0125424876770059,0.0,0.0,0.205882352941176,0.387654143914544,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0125424876770059,1.0,7.229,0.0,0.0,72.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:27','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',84.7290113568306,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190727',0,7,'/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727',84.729,2016.56,19.0,1.0,3.0,1.0,0.0118023345017644,84.729,84.729,NULL,84.729,84.729,84.729,1.0,0.0118023345017644,0.0,0.0,1.0,0.0118023345017644,0.0,0.0,0.0,0.0,1.0,0.0118023345017644,0.0,0.0,0.25,0.420084025208403,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0118023345017644,1.0,7.229,0.0,0.0,77.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:32','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',89.7289842367172,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190732',0,7,'/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732',89.729,2016.56,19.0,1.0,3.0,1.0,0.0111446689476089,89.729,89.729,NULL,89.729,89.729,89.729,1.0,0.0111446689476089,0.0,0.0,1.0,0.0111446689476089,0.0,0.0,0.0,0.0,1.0,0.0111446689476089,0.0,0.0,0.289473684210526,0.443025879407243,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0111446689476089,1.0,7.229,0.0,0.0,82.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:37','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',94.7289973497391,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190737',0,7,'/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737',94.729,2016.56,19.0,1.0,3.0,1.0,0.010556429393322,94.729,94.729,NULL,94.729,94.729,94.729,1.0,0.010556429393322,0.0,0.0,1.0,0.010556429393322,0.0,0.0,0.0,0.0,1.0,0.010556429393322,0.0,0.0,0.325,0.459547832685909,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.010556429393322,1.0,7.229,0.0,0.0,87.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:42','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',99.7290104627609,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190742',0,7,'/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742',99.729,2016.56,19.0,1.0,3.0,1.0,0.0100271736405659,99.729,99.729,NULL,99.729,99.729,99.729,1.0,0.0100271736405659,0.0,0.0,1.0,0.0100271736405659,0.0,0.0,0.0,0.0,1.0,0.0100271736405659,0.0,0.0,0.357142857142857,0.471509733273268,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0100271736405659,1.0,7.229,0.0,0.0,92.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:47','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',104.728983342648,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190747',0,7,'/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747',104.729,2016.56,19.0,1.0,3.0,1.0,0.00954845362793496,104.729,104.729,NULL,104.729,104.729,104.729,1.0,0.00954845362793496,0.0,0.0,1.0,0.00954845362793496,0.0,0.0,0.0,0.0,1.0,0.00954845362793496,0.0,0.0,0.386363636363636,0.480124442743213,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00954845362793496,1.0,7.229,0.0,0.0,97.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:52','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',109.728996455669,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190752',0,7,'/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752',109.729,2016.56,19.0,1.0,3.0,1.0,0.00911336109870681,109.729,109.729,NULL,109.729,109.729,109.729,1.0,0.00911336109870681,0.0,0.0,1.0,0.00911336109870681,0.0,0.0,0.0,0.0,1.0,0.00911336109870681,0.0,0.0,0.41304347826087,0.486223244485762,1.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00911336109870681,1.0,7.229,0.0,0.0,102.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:07:57','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',114.729009568691,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190757',0,7,'/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757',114.729,2016.56,19.0,1.0,3.0,1.0,0.00871619207000845,114.729,114.729,NULL,114.729,114.729,114.729,1.0,0.00871619207000845,0.0,0.0,1.0,0.00871619207000845,0.0,0.0,0.0,0.0,1.0,0.00871619207000845,0.0,0.0,0.4375,0.490396911118721,1.0,0.0,0.125,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00871619207000845,1.0,7.229,0.0,0.0,107.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:02','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',119.728982448578,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190802',0,7,'/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802',119.729,2016.56,19.0,1.0,3.0,1.0,0.0083521953745542,119.729,119.729,NULL,119.729,119.729,119.729,1.0,0.0083521953745542,0.0,0.0,1.0,0.0083521953745542,0.0,0.0,0.0,0.0,1.0,0.0083521953745542,0.0,0.0,0.46,0.493077073082901,1.0,0.0,0.25,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.0083521953745542,1.0,7.229,0.0,0.0,112.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:07','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',124.7289955616,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190807',0,7,'/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807',124.729,2016.56,19.0,1.0,3.0,1.0,0.00801738168348981,124.729,124.729,NULL,124.729,124.729,124.729,1.0,0.00801738168348981,0.0,0.0,1.0,0.00801738168348981,0.0,0.0,0.0,0.0,1.0,0.00801738168348981,0.0,0.0,0.480769230769231,0.494586074020877,1.0,0.0,0.25,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00801738168348981,1.0,7.229,0.0,0.0,117.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:12','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',129.729008674622,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190812',0,7,'/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812',129.729,2016.56,19.0,1.0,3.0,1.0,0.00770837669295223,129.729,129.729,NULL,129.729,129.729,129.729,1.0,0.00770837669295223,0.0,0.0,1.0,0.00770837669295223,0.0,0.0,0.0,0.0,1.0,0.00770837669295223,0.0,0.0,0.5,0.495168968830144,1.0,0.0,0.25,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00770837669295223,1.0,7.229,0.0,0.0,122.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:17','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',134.728981554508,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190817',0,7,'/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817',134.729,2016.56,19.0,1.0,3.0,1.0,0.00742230700146219,134.729,134.729,NULL,134.729,134.729,134.729,1.0,0.00742230700146219,0.0,0.0,1.0,0.00742230700146219,0.0,0.0,0.0,0.0,1.0,0.00742230700146219,0.0,0.0,0.517857142857143,0.495014830625995,1.0,0.0,0.625,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00742230700146219,1.0,7.229,0.0,0.0,127.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:22','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',139.72899466753,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190822',0,7,'/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822',139.729,2016.56,19.0,1.0,3.0,1.0,0.00715671048959056,139.729,139.729,NULL,139.729,139.729,139.729,1.0,0.00715671048959056,0.0,0.0,1.0,0.00715671048959056,0.0,0.0,0.0,0.0,1.0,0.00715671048959056,0.0,0.0,0.53448275862069,0.494271369990331,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00715671048959056,1.0,7.229,0.0,0.0,132.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:27','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',144.729007780552,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190827',0,7,'/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827',144.729,2016.56,19.0,1.0,3.0,1.0,0.00690946527648225,144.729,144.729,NULL,144.729,144.729,144.729,1.0,0.00690946527648225,0.0,0.0,1.0,0.00690946527648225,0.0,0.0,0.0,0.0,1.0,0.00690946527648225,0.0,0.0,0.55,0.493055218282762,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00690946527648225,1.0,7.229,0.0,0.0,137.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:32','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',149.728980660439,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190832',0,7,'/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832',149.729,2016.56,19.0,1.0,3.0,1.0,0.00667873291079216,149.729,149.729,NULL,149.729,149.729,149.729,1.0,0.00667873291079216,0.0,0.0,1.0,0.00667873291079216,0.0,0.0,0.0,0.0,1.0,0.00667873291079216,0.0,0.0,0.564516129032258,0.49145931476015,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00667873291079216,1.0,7.229,0.0,0.0,142.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:37','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',154.72899377346,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190837',0,7,'/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837',154.729,2016.56,19.0,1.0,3.0,1.0,0.00646291257618158,154.729,154.729,NULL,154.729,154.729,154.729,1.0,0.00646291257618158,0.0,0.0,1.0,0.00646291257618158,0.0,0.0,0.0,0.0,1.0,0.00646291257618158,0.0,0.0,0.578125,0.489558309815774,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00646291257618158,1.0,7.229,0.0,0.0,147.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:42','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',159.729006886482,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190842',0,7,'/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842',159.729,2016.56,19.0,1.0,3.0,1.0,0.00626060389785199,159.729,159.729,NULL,159.729,159.729,159.729,1.0,0.00626060389785199,0.0,0.0,1.0,0.00626060389785199,0.0,0.0,0.0,0.0,1.0,0.00626060389785199,0.0,0.0,0.590909090909091,0.487412579574299,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00626060389785199,1.0,7.229,0.0,0.0,152.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:47','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',164.728979766369,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190847',0,7,'/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847',164.729,2016.56,19.0,1.0,3.0,1.0,0.00607057652265236,164.729,164.729,NULL,164.729,164.729,164.729,1.0,0.00607057652265236,0.0,0.0,1.0,0.00607057652265236,0.0,0.0,0.0,0.0,1.0,0.00607057652265236,0.0,0.0,0.602941176470588,0.485071250072666,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00607057652265236,1.0,7.229,0.0,0.0,157.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:52','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',169.728992879391,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190852',0,7,'/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852',169.729,2016.56,19.0,1.0,3.0,1.0,0.00589174507597405,169.729,169.729,NULL,169.729,169.729,169.729,1.0,0.00589174507597405,0.0,0.0,1.0,0.00589174507597405,0.0,0.0,0.0,0.0,1.0,0.00589174507597405,0.0,0.0,0.614285714285714,0.482574503326175,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00589174507597405,1.0,7.229,0.0,0.0,162.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:08:57','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',174.729005992413,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190857',0,7,'/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857',174.729,2016.56,19.0,1.0,3.0,1.0,0.00572314841840793,174.729,174.729,NULL,174.729,174.729,174.729,1.0,0.00572314841840793,0.0,0.0,1.0,0.00572314841840793,0.0,0.0,0.0,0.0,1.0,0.00572314841840793,0.0,0.0,0.625,0.479955355066638,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00572314841840793,1.0,7.229,0.0,0.0,167.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:02','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',179.728978872299,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2,1,1,'U00_20230205190902',0,7,'/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902',179.729,2016.56,19.0,1.0,3.0,1.0,0.00556393236483817,179.729,179.729,NULL,179.729,179.729,179.729,1.0,0.00556393236483817,0.0,0.0,1.0,0.00556393236483817,0.0,0.0,0.0,0.0,1.0,0.00556393236483817,0.0,0.0,0.635135135135135,0.477241038689056,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00556393236483817,1.0,7.229,0.0,0.0,172.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:07','Interactive','com.google.android.youtube','YouTube','VIDEO_PLAYERS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',184.728991985321,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,0,1,1,1,1,2,1,1,'U00_20230205190907',1,7,'/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907',184.729,2016.56,19.0,1.0,3.0,1.0,0.00541333520995621,184.729,184.729,NULL,184.729,184.729,184.729,1.0,0.00541333520995621,0.0,0.0,1.0,0.00541333520995621,0.0,0.0,0.0,0.0,1.0,0.00541333520995621,0.0,0.0,0.644736842105263,0.474454092229165,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00541333520995621,1.0,7.229,0.0,0.0,177.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:12','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',189.729005098343,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,0,1,1,1,1,2,1,1,'U00_20230205190912',1,7,'/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912',189.729,2016.56,19.0,1.0,3.0,1.0,0.00527067554248428,189.729,189.729,NULL,189.729,189.729,189.729,1.0,0.00527067554248428,0.0,0.0,1.0,0.00527067554248428,0.0,0.0,0.0,0.0,1.0,0.00527067554248428,0.0,0.0,0.653846153846154,0.471613219004812,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00527067554248428,1.0,9.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:17','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',194.72897797823,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,0,1,1,1,1,2,1,1,'U00_20230205190917',1,7,'/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917',194.729,2016.56,19.0,1.0,3.0,1.0,0.00513534193674286,194.729,194.729,NULL,194.729,194.729,194.729,1.0,0.00513534193674286,0.0,0.0,1.0,0.00513534193674286,0.0,0.0,0.0,0.0,1.0,0.00513534193674286,0.0,0.0,0.6625,0.468733974085022,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00513534193674286,1.0,14.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:22','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',199.728991091251,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,4,0,2,2,0,0,1,1,1,1,2,1,1,'U00_20230205190922',1,7,'/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922',199.729,2016.56,19.0,1.0,3.0,1.0,0.00500678419258095,199.729,199.729,NULL,199.729,199.729,199.729,2.0,0.0100135683851619,0.0,0.0,1.0,0.00500678419258095,0.0,0.0,1.0,0.00500678419258095,1.0,0.00500678419258095,0.0,0.0,0.670731707317073,0.465829315543271,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00500678419258095,1.0,19.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:27','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',204.729004204273,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,4,0,2,2,0,0,1,1,1,1,2,1,1,'U00_20230205190927',1,7,'/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927',204.729,2016.56,19.0,1.0,3.0,1.0,0.00488450585896478,204.729,204.729,NULL,204.729,204.729,204.729,2.0,0.00976901171792956,0.0,0.0,1.0,0.00488450585896478,0.0,0.0,1.0,0.00488450585896478,1.0,0.00488450585896478,0.0,0.0,0.678571428571429,0.462910049886276,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00488450585896478,1.0,24.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:32','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',209.72897708416,1,0,1,0,2,0,0,1,0,1,0,2,0,0,1,0,1,0,2,0,0,2,0,2,0,2,1,0,2,0,2,0,2,1,0,2,0,2,0,2,1,0,2,0,2,0,2,1,0,2,0,5,0,3,2,0,0,1,1,1,1,2,1,1,'U00_20230205190932',1,7,'/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932',209.729,2016.56,19.0,1.0,3.0,1.0,0.00476805782700533,209.729,209.729,NULL,209.729,209.729,209.729,2.0,0.00953611565401065,0.0,0.0,2.0,0.00953611565401065,0.0,0.0,2.0,0.00953611565401065,1.0,0.00476805782700533,0.0,0.0,0.686046511627907,0.459985194041658,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,1.0,0.00476805782700533,1.0,29.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:37','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',214.728990197182,2,0,2,0,3,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205190937',1,7,'/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937',214.729,2016.56,19.0,1.0,3.0,1.0,0.00465703281811027,214.729,214.729,NULL,214.729,214.729,214.729,3.0,0.0139710984543308,0.0,0.0,3.0,0.0139710984543308,0.0,0.0,3.0,0.0139710984543308,1.0,0.00465703281811027,0.0,0.0,0.693181818181818,0.457062271098516,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00931406563622054,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,2.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:42','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',219.729003310204,2,0,2,0,3,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205190942',1,7,'/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942',219.729,2016.56,19.0,1.0,3.0,1.0,0.00455106062467858,219.729,219.729,NULL,219.729,219.729,219.729,3.0,0.0136531818740357,0.0,0.0,3.0,0.0136531818740357,0.0,0.0,3.0,0.0136531818740357,1.0,0.00455106062467858,0.0,0.0,0.7,0.454147553114624,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00910212124935716,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,7.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:47','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',224.72897619009,2,0,2,0,3,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205190947',1,7,'/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947',224.729,2016.56,19.0,1.0,3.0,1.0,0.00444980398613441,224.729,224.729,NULL,224.729,224.729,224.729,3.0,0.0133494119584032,0.0,0.0,3.0,0.0133494119584032,0.0,0.0,3.0,0.0133494119584032,1.0,0.00444980398613441,0.0,0.0,0.706521739130435,0.451246261375978,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00889960797226882,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,12.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:52','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',229.728989303112,1,0,2,0,2,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205190952',1,7,'/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952',229.729,2016.56,19.0,1.0,3.0,1.0,0.00435295500350413,229.729,229.729,NULL,229.729,229.729,229.729,3.0,0.0130588650105124,0.0,0.0,3.0,0.0130588650105124,0.0,0.0,3.0,0.0130588650105124,1.0,0.00435295500350413,0.0,0.0,0.712765957446808,0.448362732266495,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00870591000700826,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,17.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:09:57','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',234.729002416134,1,0,2,0,2,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205190957',1,7,'/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957',234.729,2016.56,19.0,1.0,3.0,1.0,0.00426023201223539,234.729,234.729,NULL,234.729,234.729,234.729,3.0,0.0127806960367062,0.0,0.0,3.0,0.0127806960367062,0.0,0.0,3.0,0.0127806960367062,1.0,0.00426023201223539,0.0,0.0,0.71875,0.445500555197018,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00852046402447077,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,22.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:10:02','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',239.728975296021,1,0,1,0,1,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205191002',1,7,'/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002',239.729,2016.56,19.0,1.0,3.0,1.0,0.00417137684635568,239.729,239.729,NULL,239.729,239.729,239.729,3.0,0.012514130539067,0.0,0.0,3.0,0.012514130539067,0.0,0.0,3.0,0.012514130539067,1.0,0.00417137684635568,0.0,0.0,0.724489795918367,0.442662687722876,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00834275369271135,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,27.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:10:07','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',244.728988409042,0,0,0,0,0,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205191007',1,7,'/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007',244.729,2016.56,19.0,1.0,3.0,1.0,0.00408615243800285,244.729,244.729,NULL,244.729,244.729,244.729,3.0,0.0122584573140086,0.0,0.0,3.0,0.0122584573140086,0.0,0.0,3.0,0.0122584573140086,1.0,0.00408615243800285,0.0,0.0,0.73,0.43985155195259,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.0081723048760057,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,32.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:10:12','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',249.729001522064,0,0,0,0,0,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205191012',1,7,'/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007;/1/U00_20230205191012',249.729,2016.56,19.0,1.0,3.0,1.0,0.00400434070532457,249.729,249.729,NULL,249.729,249.729,249.729,3.0,0.0120130221159737,0.0,0.0,3.0,0.0120130221159737,0.0,0.0,3.0,0.0120130221159737,1.0,0.00400434070532457,0.0,0.0,0.735294117647059,0.437069115546621,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00800868141064914,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,37.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:10:17','Interactive','com.google.android.apps.magazines','Google 新聞','NEWS_AND_MAGAZINES',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',254.729014635086,0,0,0,0,0,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205191017',1,7,'/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007;/1/U00_20230205191012;/1/U00_20230205191017',254.729,2016.56,19.0,1.0,3.0,1.0,0.00392574068912452,254.729,254.729,NULL,254.729,254.729,254.729,3.0,0.0117772220673736,0.0,0.0,3.0,0.0117772220673736,0.0,0.0,3.0,0.0117772220673736,1.0,0.00392574068912452,0.0,0.0,0.740384615384615,0.434316959972158,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00785148137824904,2.0,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,42.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:10:22','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',259.728987514973,0,0,0,0,0,0,0,1,0,2,0,2,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2,1,1,'U00_20230205191022',1,7,'/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007;/1/U00_20230205191012;/1/U00_20230205191017;/1/U00_20230205191022',259.729,2016.56,19.0,1.0,3.0,1.0,0.00385016690473532,259.729,259.729,NULL,259.729,259.729,259.729,3.0,0.011550500714206,0.0,0.0,3.0,0.011550500714206,0.0,0.0,3.0,0.011550500714206,1.0,0.00385016690473532,0.0,0.0,0.745283018867924,0.431596338178596,1.0,0.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,0.0,NULL,0.0,0.0,2.0,0.00770033380947064,2.0,34.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,45.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:14:13','Interactive','com.google.android.apps.tachyon','Google Duo - 高品質視訊通話應用程式','PHONE_and_SMS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',32.3029831051826,4,0,2,0,2,0,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,7,0,7,0,7,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6,0,0,'U00_20230205191413',1,7,'/2/U00_20230205191343;/2/U00_20230205191348;/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403;/2/U00_20230205191408;/2/U00_20230205191413',32.303,157.85,19.0,1.0,3.0,1.0,0.0309568770702412,32.303,32.303,NULL,32.303,32.303,32.303,4.0,0.123827508280965,0.0,0.0,2.0,0.0619137541404823,0.0,0.0,2.0,0.0619137541404823,1.0,0.0309568770702412,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,32.303,0.0,0.0,0.0,0.0,32.303,0.0,0.0,0.0,32.303,0.0,0.0,0.0,32.303,0.0,0.0,1.0,0.0309568770702412,1.0,24.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,7.5,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:14:18','Interactive','com.google.android.apps.tachyon','Google Duo - 高品質視訊通話應用程式','PHONE_and_SMS',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',37.3029962182045,4,0,2,0,2,0,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,7,0,7,0,7,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6,0,0,'U00_20230205191418',1,7,'/2/U00_20230205191348;/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403;/2/U00_20230205191408;/2/U00_20230205191413;/2/U00_20230205191418',37.303,157.85,19.0,1.0,3.0,1.0,0.026807495375707,37.303,37.303,NULL,37.303,37.303,37.303,4.0,0.107229981502828,0.0,0.0,2.0,0.0536149907514141,0.0,0.0,2.0,0.0536149907514141,1.0,0.026807495375707,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,37.303,0.0,0.0,0.0,0.0,37.303,0.0,0.0,0.0,37.303,0.0,0.0,0.0,37.303,0.0,0.0,1.0,0.026807495375707,1.0,24.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,12.5,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:14:23','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',42.3030093312263,3,0,2,0,1,0,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,6,0,7,0,6,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6,0,0,'U00_20230205191423',1,7,'/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403;/2/U00_20230205191408;/2/U00_20230205191413;/2/U00_20230205191418;/2/U00_20230205191423',42.303,157.85,19.0,1.0,3.0,1.0,0.023638985414746,42.303,42.303,NULL,42.303,42.303,42.303,4.0,0.094555941658984,0.0,0.0,2.0,0.047277970829492,0.0,0.0,2.0,0.047277970829492,1.0,0.023638985414746,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,42.303,0.0,0.0,0.0,0.0,42.303,0.0,0.0,0.0,42.303,0.0,0.0,0.0,42.303,0.0,0.0,1.0,0.023638985414746,1.0,27.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,0.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:03','Interactive','com.google.android.gms','Google Play services','ENTERTAINMENT',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',82.3029935359955,1,1,2,0,1,0,0,3,1,3,0,2,0,0,6,1,4,0,4,1,0,7,1,7,0,6,3,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,13,0,10,5,0,1,4,5,5,5,6,0,0,'U00_20230205191503',1,7,'/2/U00_20230205191433;/2/U00_20230205191438;/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503',82.303,157.85,19.0,1.0,3.0,1.0,0.0121502253866809,82.303,82.303,NULL,82.303,82.303,82.303,6.0,0.0729013523200855,1.0,0.0121502253866809,4.0,0.0486009015467237,0.0,0.0,4.0,0.0486009015467237,1.0,0.0121502253866809,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,82.303,0.0,0.0,0.0,0.0,82.303,0.0,0.0,0.0,82.303,0.0,0.0,0.0,82.303,0.0,0.0,4.0,0.0486009015467237,3.0,49.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,17.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:08','Interactive','com.google.android.keep','Keep Notes','PRODUCTIVITY',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',87.3030066490173,1,1,1,0,1,0,0,2,1,2,0,2,0,0,6,1,4,0,4,1,0,7,1,7,0,6,3,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,13,0,10,5,0,1,4,5,5,5,6,0,0,'U00_20230205191508',1,7,'/2/U00_20230205191438;/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508',87.303,157.85,19.0,1.0,3.0,1.0,0.0114543601021729,87.303,87.303,NULL,87.303,87.303,87.303,6.0,0.0687261606130374,1.0,0.0114543601021729,4.0,0.0458174404086916,0.0,0.0,4.0,0.0458174404086916,1.0,0.0114543601021729,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,87.303,0.0,0.0,0.0,0.0,87.303,0.0,0.0,0.0,87.303,0.0,0.0,0.0,87.303,0.0,0.0,5.0,0.0572718005108645,4.0,49.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,22.5);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:13','Interactive','com.google.android.apps.nexuslauncher','Pixel Launcher','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',92.302979528904,2,1,1,0,3,0,0,3,1,2,0,4,0,0,7,1,4,0,6,1,0,8,1,7,0,8,3,0,11,1,10,0,11,4,0,11,1,10,0,11,4,0,11,1,10,0,11,4,0,11,1,13,0,12,5,0,1,4,5,5,5,6,0,0,'U00_20230205191513',1,7,'/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513',92.303,157.85,19.0,1.0,3.0,1.0,0.0108338840557728,92.303,92.303,NULL,92.303,92.303,92.303,7.0,0.0758371883904098,1.0,0.0108338840557728,4.0,0.0433355362230913,0.0,0.0,6.0,0.065003304334637,1.0,0.0108338840557728,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,92.303,0.0,0.0,0.0,0.0,92.303,0.0,0.0,0.0,92.303,0.0,0.0,0.0,92.303,0.0,0.0,5.0,0.0541694202788642,4.0,52.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:18','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',97.3029926419258,2,1,2,0,3,0,0,3,1,3,0,4,0,0,7,1,5,0,6,1,0,8,1,8,0,8,3,0,11,1,11,0,11,4,0,11,1,11,0,11,4,0,11,1,11,0,11,4,0,11,1,14,0,12,5,0,1,4,5,5,5,6,0,0,'U00_20230205191518',1,7,'/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518',97.303,157.85,19.0,1.0,3.0,1.0,0.0102771754211073,97.303,97.303,NULL,97.303,97.303,97.303,7.0,0.0719402279477508,1.0,0.0102771754211073,5.0,0.0513858771055363,0.0,0.0,6.0,0.0616630525266436,1.0,0.0102771754211073,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,97.303,0.0,0.0,0.0,0.0,97.303,0.0,0.0,0.0,97.303,0.0,0.0,0.0,97.303,0.0,0.0,6.0,0.0616630525266436,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,2.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:23','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',102.303005754948,3,0,3,0,4,0,0,4,1,4,0,5,0,0,8,1,6,0,7,1,0,9,1,9,0,9,3,0,12,1,12,0,12,4,0,12,1,12,0,12,4,0,12,1,12,0,12,4,0,12,1,15,0,13,5,0,1,3,5,5,5,6,0,0,'U00_20230205191523',1,7,'/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523',102.303,157.85,19.0,1.0,3.0,1.0,0.00977488441199183,102.303,102.303,NULL,102.303,102.303,102.303,8.0,0.0781990752959346,1.0,0.00977488441199183,6.0,0.058649306471951,0.0,0.0,7.0,0.0684241908839428,1.0,0.00977488441199183,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,102.303,0.0,0.0,0.0,0.0,102.303,0.0,0.0,0.0,102.303,0.0,0.0,0.0,102.303,0.0,0.0,6.0,0.058649306471951,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,7.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:28','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',107.302978634834,2,0,4,0,4,0,0,4,1,5,0,6,0,0,8,1,7,0,8,1,0,9,1,10,0,10,2,0,12,1,13,0,13,4,0,12,1,13,0,13,4,0,12,1,13,0,13,4,0,12,1,16,0,14,5,0,1,3,5,5,5,6,0,0,'U00_20230205191528',1,7,'/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528',107.303,157.85,19.0,1.0,3.0,1.0,0.00931940393092458,107.303,107.303,NULL,107.303,107.303,107.303,8.0,0.0745552314473966,1.0,0.00931940393092458,7.0,0.065235827516472,0.0,0.0,8.0,0.0745552314473966,1.0,0.00931940393092458,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,107.303,0.0,0.0,0.0,0.0,107.303,0.0,0.0,0.0,107.303,0.0,0.0,0.0,107.303,0.0,0.0,6.0,0.0559164235855475,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,12.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:33','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',112.302991747856,2,0,3,0,5,0,0,3,1,5,0,6,0,0,8,1,7,0,9,1,0,9,1,10,0,11,2,0,12,1,13,0,14,4,0,12,1,13,0,14,4,0,12,1,13,0,14,4,0,12,1,16,0,15,5,0,1,3,5,5,5,6,0,0,'U00_20230205191533',1,7,'/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533',112.303,157.85,19.0,1.0,3.0,1.0,0.00890448162560217,112.303,112.303,NULL,112.303,112.303,112.303,8.0,0.0712358530048173,1.0,0.00890448162560217,7.0,0.0623313713792152,0.0,0.0,9.0,0.0801403346304195,1.0,0.00890448162560217,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,112.303,0.0,0.0,0.0,0.0,112.303,0.0,0.0,0.0,112.303,0.0,0.0,0.0,112.303,0.0,0.0,6.0,0.053426889753613,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,17.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:38','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',117.303004860878,2,1,5,0,6,0,1,3,2,6,0,7,0,1,8,2,9,0,10,1,1,9,2,12,0,12,1,1,12,2,15,0,15,4,1,12,2,15,0,15,4,1,12,2,15,0,15,4,1,12,2,18,0,16,5,1,1,2,5,5,5,6,0,0,'U00_20230205191538',1,7,'/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538',117.303,157.85,19.0,1.0,3.0,1.0,0.00852493116118087,117.303,117.303,NULL,117.303,117.303,117.303,8.0,0.068199449289447,2.0,0.0170498623223617,9.0,0.0767243804506279,0.0,0.0,10.0,0.0852493116118087,1.0,0.00852493116118087,1.0,0.00852493116118087,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,117.303,0.0,0.0,0.0,0.0,117.303,0.0,0.0,0.0,117.303,0.0,0.0,0.0,117.303,0.0,0.0,6.0,0.0511495869670852,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,22.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:43','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',122.302977740765,1,1,6,0,6,0,1,3,2,7,0,9,0,1,8,2,10,0,12,1,1,8,2,12,0,13,1,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,19,0,18,5,1,1,2,5,5,5,6,0,0,'U00_20230205191543',1,7,'/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543',122.303,157.85,19.0,1.0,3.0,1.0,0.00817641431526618,122.303,122.303,NULL,122.303,122.303,122.303,8.0,0.0654113145221295,2.0,0.0163528286305324,10.0,0.0817641431526618,0.0,0.0,12.0,0.0981169717831942,1.0,0.00817641431526618,1.0,0.00817641431526618,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,122.303,0.0,0.0,0.0,0.0,122.303,0.0,0.0,0.0,122.303,0.0,0.0,0.0,122.303,0.0,0.0,6.0,0.0490584858915971,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,27.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:48','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',127.302990853786,1,1,5,0,6,0,1,3,2,7,0,9,0,1,8,2,10,0,12,1,1,8,2,11,0,13,1,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,19,0,18,5,1,1,2,5,5,5,6,0,0,'U00_20230205191548',1,7,'/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548',127.303,157.85,19.0,1.0,3.0,1.0,0.007855274424012,127.303,127.303,NULL,127.303,127.303,127.303,8.0,0.062842195392096,2.0,0.015710548848024,10.0,0.07855274424012,0.0,0.0,12.0,0.094263293088144,1.0,0.007855274424012,1.0,0.007855274424012,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,127.303,0.0,0.0,0.0,0.0,127.303,0.0,0.0,0.0,127.303,0.0,0.0,0.0,127.303,0.0,0.0,6.0,0.047131646544072,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,32.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:53','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',132.303003966808,0,1,4,0,6,0,1,3,1,7,0,10,0,1,8,2,10,0,13,1,1,8,2,10,0,14,1,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,19,0,19,5,1,1,2,5,5,5,6,0,0,'U00_20230205191553',1,7,'/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553',132.303,157.85,19.0,1.0,3.0,1.0,0.00755840759468795,132.303,132.303,NULL,132.303,132.303,132.303,8.0,0.0604672607575036,2.0,0.0151168151893759,10.0,0.0755840759468795,0.0,0.0,13.0,0.0982592987309434,1.0,0.00755840759468795,1.0,0.00755840759468795,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,132.303,0.0,0.0,0.0,0.0,132.303,0.0,0.0,0.0,132.303,0.0,0.0,0.0,132.303,0.0,0.0,6.0,0.0453504455681277,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,37.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:15:58','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',137.302976846695,0,1,3,0,5,0,1,2,1,7,0,9,0,1,8,2,10,0,13,1,1,8,2,10,0,13,1,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,19,0,19,5,1,1,2,5,5,5,6,0,0,'U00_20230205191558',1,7,'/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558',137.303,157.85,19.0,1.0,3.0,1.0,0.00728316205763894,137.303,137.303,NULL,137.303,137.303,137.303,8.0,0.0582652964611116,2.0,0.0145663241152779,10.0,0.0728316205763894,0.0,0.0,13.0,0.0946811067493063,1.0,0.00728316205763894,1.0,0.00728316205763894,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,137.303,0.0,0.0,0.0,0.0,137.303,0.0,0.0,0.0,137.303,0.0,0.0,0.0,137.303,0.0,0.0,6.0,0.0436989723458337,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,42.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:03','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',142.302989959717,1,1,3,0,6,0,1,3,1,6,0,11,0,1,9,2,10,0,15,1,1,9,2,10,0,15,1,1,13,2,16,0,20,4,1,13,2,16,0,20,4,1,13,2,16,0,20,4,1,13,2,19,0,21,5,1,1,1,4,5,5,6,0,0,'U00_20230205191603',1,7,'/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603',142.303,157.85,19.0,1.0,3.0,1.0,0.00702725873663942,142.303,142.303,NULL,142.303,142.303,142.303,9.0,0.0632453286297548,2.0,0.0140545174732788,10.0,0.0702725873663942,0.0,0.0,15.0,0.105408881049591,1.0,0.00702725873663942,1.0,0.00702725873663942,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,142.303,0.0,0.0,0.0,0.0,142.303,0.0,0.0,0.0,142.303,0.0,0.0,0.0,142.303,0.0,0.0,6.0,0.0421635524198365,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,47.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:08','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',147.303003072739,1,0,2,0,7,0,0,3,1,7,0,13,0,1,9,2,11,0,17,1,1,9,2,11,0,17,1,1,13,2,17,0,22,3,1,13,2,17,0,22,4,1,13,2,17,0,22,4,1,13,2,20,0,23,5,1,1,1,4,5,5,6,0,0,'U00_20230205191608',1,7,'/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608',147.303,157.85,19.0,1.0,3.0,1.0,0.00678872799603538,147.303,147.303,NULL,147.303,147.303,147.303,9.0,0.0610985519643184,2.0,0.0135774559920708,11.0,0.0746760079563892,0.0,0.0,17.0,0.115408375932602,1.0,0.00678872799603538,1.0,0.00678872799603538,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,147.303,0.0,0.0,0.0,0.0,147.303,0.0,0.0,0.0,147.303,0.0,0.0,0.0,147.303,0.0,0.0,6.0,0.0407323679762123,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,52.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:13','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',152.30301618576,1,0,2,0,6,0,0,2,1,8,0,12,0,1,9,2,12,0,18,1,1,9,2,12,0,18,1,1,13,2,18,0,23,3,1,13,2,18,0,23,4,1,13,2,18,0,23,4,1,13,2,21,0,24,5,1,1,1,4,5,5,6,0,0,'U00_20230205191613',1,7,'/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613',152.303,157.85,19.0,1.0,3.0,1.0,0.0065658588471665,152.303,152.303,NULL,152.303,152.303,152.303,9.0,0.0590927296244985,2.0,0.013131717694333,12.0,0.078790306165998,0.0,0.0,18.0,0.118185459248997,1.0,0.0065658588471665,1.0,0.0065658588471665,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,152.303,0.0,0.0,0.0,0.0,152.303,0.0,0.0,0.0,152.303,0.0,0.0,0.0,152.303,0.0,0.0,6.0,0.039395153082999,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,57.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:18','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',157.302989065647,1,0,4,0,7,0,0,2,1,9,0,13,0,1,9,2,14,0,19,1,1,9,2,14,0,19,1,1,12,2,19,0,24,3,1,13,2,20,0,24,4,1,13,2,20,0,24,4,1,13,2,23,0,25,5,1,1,1,4,5,5,6,0,0,'U00_20230205191618',1,7,'/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618',157.303,157.85,19.0,1.0,3.0,1.0,0.00635715784187206,157.303,157.303,NULL,157.303,157.303,157.303,9.0,0.0572144205768485,2.0,0.0127143156837441,14.0,0.0890002097862088,0.0,0.0,19.0,0.120785998995569,1.0,0.00635715784187206,1.0,0.00635715784187206,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,157.303,0.0,0.0,0.0,0.0,157.303,0.0,0.0,0.0,157.303,0.0,0.0,0.0,157.303,0.0,0.0,6.0,0.0381429470512323,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,62.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:23','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',162.303002178669,2,0,5,0,7,0,0,2,1,9,0,13,0,1,10,2,15,0,20,1,1,10,2,15,0,20,1,1,13,2,20,0,25,3,1,14,2,21,0,25,4,1,14,2,21,0,25,4,1,14,2,24,0,26,5,1,1,1,4,5,5,6,0,0,'U00_20230205191623',1,7,'/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623',162.303,157.85,19.0,1.0,3.0,1.0,0.00616131556409925,162.303,162.303,NULL,162.303,162.303,162.303,10.0,0.0616131556409925,2.0,0.0123226311281985,15.0,0.0924197334614887,0.0,0.0,20.0,0.123226311281985,1.0,0.00616131556409925,1.0,0.00616131556409925,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,162.303,0.0,0.0,0.0,0.0,162.303,0.0,0.0,0.0,162.303,0.0,0.0,0.0,162.303,0.0,0.0,6.0,0.0369678933845955,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,67.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:28','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',167.303015291691,4,0,6,0,7,0,0,4,1,9,0,12,0,1,12,2,16,0,20,1,1,12,2,16,0,20,1,1,15,2,21,0,25,3,1,16,2,22,0,25,4,1,16,2,22,0,25,4,1,16,2,25,0,26,5,1,1,1,4,5,5,6,0,0,'U00_20230205191628',1,7,'/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628',167.303,157.85,19.0,1.0,3.0,1.0,0.00597717913008135,167.303,167.303,NULL,167.303,167.303,167.303,12.0,0.0717261495609762,2.0,0.0119543582601627,16.0,0.0956348660813016,0.0,0.0,20.0,0.119543582601627,1.0,0.00597717913008135,1.0,0.00597717913008135,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,167.303,0.0,0.0,0.0,0.0,167.303,0.0,0.0,0.0,167.303,0.0,0.0,0.0,167.303,0.0,0.0,6.0,0.0358630747804881,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,72.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:33','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',172.302988171577,4,0,8,0,6,0,0,5,1,11,0,12,0,1,13,2,18,0,21,1,1,13,2,18,0,21,1,1,16,2,23,0,26,3,1,17,2,24,0,26,4,1,17,2,24,0,26,4,1,17,2,27,0,27,5,1,1,1,4,5,5,6,0,0,'U00_20230205191633',1,7,'/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633',172.303,157.85,19.0,1.0,3.0,1.0,0.00580372947656164,172.303,172.303,NULL,172.303,172.303,172.303,13.0,0.0754484831953013,2.0,0.0116074589531233,18.0,0.104467130578109,0.0,0.0,21.0,0.121878319007794,1.0,0.00580372947656164,1.0,0.00580372947656164,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,172.303,0.0,0.0,0.0,0.0,172.303,0.0,0.0,0.0,172.303,0.0,0.0,0.0,172.303,0.0,0.0,6.0,0.0348223768593698,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,77.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:38','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',177.303001284599,5,0,8,0,4,0,0,6,0,10,0,11,0,0,14,2,19,0,21,1,1,14,2,19,0,21,1,1,17,2,24,0,26,3,1,18,2,25,0,26,4,1,18,2,25,0,26,4,1,18,2,28,0,27,5,1,1,1,4,5,5,6,0,0,'U00_20230205191638',1,7,'/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633;/2/U00_20230205191638',177.303,157.85,19.0,1.0,3.0,1.0,0.00564006249189241,177.303,177.303,NULL,177.303,177.303,177.303,14.0,0.0789608748864937,2.0,0.0112801249837848,19.0,0.107161187345956,0.0,0.0,21.0,0.118441312329741,1.0,0.00564006249189241,1.0,0.00564006249189241,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,177.303,0.0,0.0,0.0,0.0,177.303,0.0,0.0,0.0,177.303,0.0,0.0,0.0,177.303,0.0,0.0,6.0,0.0338403749513545,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,82.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:43','Interactive','com.google.android.apps.maps','Maps','MAPS_AND_NAVIGATION',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',182.303014397621,5,0,7,0,3,0,0,6,0,9,0,9,0,0,14,2,19,0,21,0,1,14,2,19,0,21,1,1,17,2,24,0,26,3,1,18,2,25,0,26,4,1,18,2,25,0,26,4,1,18,2,28,0,27,5,1,0,1,4,5,5,6,0,0,'U00_20230205191643',1,7,'/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633;/2/U00_20230205191638;/2/U00_20230205191643',182.303,157.85,19.0,1.0,3.0,1.0,0.00548537325222295,182.303,182.303,NULL,182.303,182.303,182.303,14.0,0.0767952255311213,2.0,0.0109707465044459,19.0,0.104222091792236,0.0,0.0,21.0,0.115192838296682,1.0,0.00548537325222295,1.0,0.00548537325222295,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,182.303,0.0,0.0,0.0,0.0,182.303,0.0,0.0,0.0,182.303,0.0,0.0,0.0,182.303,0.0,0.0,6.0,0.0329122395133377,5.0,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,87.5,25.0);
INSERT INTO "_phone_log" VALUES ('U00','2023-02-05 19:16:48','Interactive','com.google.android.apps.nexuslauncher','Pixel 啟動器','Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1,0,0,0,1,-9999,'',-9999,'static',187.302987277508,5,0,5,0,2,0,0,6,0,9,0,9,0,0,14,2,19,0,21,0,1,14,2,19,0,21,1,1,17,2,24,0,26,3,1,18,2,25,0,26,4,1,18,2,25,0,26,4,1,18,2,28,0,27,5,1,0,1,4,5,5,6,0,0,'U00_20230205191648',1,7,'/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633;/2/U00_20230205191638;/2/U00_20230205191643;/2/U00_20230205191648',187.303,157.85,19.0,1.0,3.0,1.0,0.0053389427825502,187.303,187.303,NULL,187.303,187.303,187.303,14.0,0.0747451989557028,2.0,0.0106778855651004,19.0,0.101439912868454,0.0,0.0,21.0,0.112117798433554,1.0,0.0053389427825502,1.0,0.0053389427825502,1.0,0.0,1.0,1.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,1.0,1.0,1.0,0.0,100.0,0.0,100.0,100.0,100.0,0.0,0.0,0.0,187.303,0.0,0.0,0.0,0.0,187.303,0.0,0.0,0.0,187.303,0.0,0.0,0.0,187.303,0.0,0.0,6.0,0.0320336566953012,5.0,57.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,90.0,25.0);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:42:29','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:42:34','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:42:39','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:42:44','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:42:49','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:42:54','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:42:59','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:04','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:09','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:14','Interactive','com.android.chrome','BROWSER','Chrome',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:19','Interactive','com.android.chrome','BROWSER','Chrome',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:24','Interactive','com.android.chrome','BROWSER','Chrome',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:29','Interactive','com.android.chrome','BROWSER','Chrome',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:34','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:39','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:44','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:49','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:54','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:43:59','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',1,'usb charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:04','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:09','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:14','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:19','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:24','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:29','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:34','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:39','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:44','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:49','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:54','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:44:59','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:45:52','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:46:47','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:52:47','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:52:51','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 17:57:39','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:01:24','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:04:54','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:05:47','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:13:48','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:15:48','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:20:57','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:24:01','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:24:06','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:25:00','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:30:35','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:31:43','Interactive','com.android.systemui','Launcher','System UI',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',2.03100889921188);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:31:48','Interactive','com.google.android.gm','BUSINESS','Gmail',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',7.03098177909851);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:31:53','Interactive','com.google.android.GoogleCamera','PHOTOGRAPHY','Camera',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',12.0309948921204);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:31:58','Interactive','com.google.android.GoogleCamera','PHOTOGRAPHY','Camera',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',17.0310080051422);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:32:03','Interactive','com.google.android.GoogleCamera','PHOTOGRAPHY','Camera',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',22.0309808850288);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:32:08','Interactive','com.google.android.GoogleCamera','PHOTOGRAPHY','Camera',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',27.0309939980507);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:32:13','Interactive','com.google.android.GoogleCamera','PHOTOGRAPHY','Camera',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',32.0310071110725);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:32:18','Interactive','com.google.android.GoogleCamera','PHOTOGRAPHY','Camera',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',37.0309799909592);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:32:23','Interactive','com.google.android.GoogleCamera','PHOTOGRAPHY','Camera',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',42.030993103981);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:32:28','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:34:04','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:36:59','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:40:26','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:40:31','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:46:13','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:52:32','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:53:01','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:54:22','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 18:59:01','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:01:39','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:02','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:07','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',4.7290027141571);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:12','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',9.72897559404373);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:17','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',14.7289887070656);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:22','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',19.7290018200874);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:27','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',24.7290149331093);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:32','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',29.7289878129959);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:37','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',34.7290009260178);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:42','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',39.7290140390396);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:47','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',44.7289869189262);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:52','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',49.7290000319481);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:06:57','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',54.7290131449699);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:02','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.25,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',59.7289860248566);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:07','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',0.25,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',64.7289991378784);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:12','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',69.7290122509003);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:17','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',74.7289851307869);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:22','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',79.7289982438087);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:27','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',84.7290113568306);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:32','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',89.7289842367172);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:37','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',94.7289973497391);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:42','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',99.7290104627609);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:47','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',104.728983342648);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:52','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',109.728996455669);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:07:57','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',114.729009568691);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:02','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',119.728982448578);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:07','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',124.7289955616);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:12','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',129.729008674622);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:17','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',134.728981554508);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:22','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',139.72899466753);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:27','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',144.729007780552);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:32','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',149.728980660439);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:37','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',154.72899377346);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:42','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',159.729006886482);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:47','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',164.728979766369);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:52','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',169.728992879391);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:08:57','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',174.729005992413);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:02','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',179.728978872299);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:07','Interactive','com.google.android.youtube','VIDEO_PLAYERS','YouTube',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',184.728991985321);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:12','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',189.729005098343);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:17','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',194.72897797823);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:22','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',199.728991091251);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:27','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',204.729004204273);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:32','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',209.72897708416);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:37','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',214.728990197182);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:42','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',219.729003310204);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:47','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',224.72897619009);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:52','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',229.728989303112);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:09:57','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',234.729002416134);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:02','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',239.728975296021);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:07','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',244.728988409042);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:12','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',249.729001522064);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:17','Interactive','com.google.android.apps.magazines','NEWS_AND_MAGAZINES','Google 新聞',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',254.729014635086);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:22','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',259.728987514973);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:27','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:39','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',3.53596955537796);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:44','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',8.53598266839981);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:49','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',13.5359957814217);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:54','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',18.5360088944435);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:10:59','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',0.154012441635132);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:11:04','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:13:02','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:13:43','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',2.30298489332199);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:13:48','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',7.30299800634384);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:13:53','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',12.3030111193657);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:13:58','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',17.3029839992523);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:03','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',22.3029971122742);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:08','Interactive','com.google.android.apps.tachyon','PHONE_and_SMS','Google Duo - 高品質視訊通話應用程式',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',27.303010225296);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:13','Interactive','com.google.android.apps.tachyon','PHONE_and_SMS','Google Duo - 高品質視訊通話應用程式',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',32.3029831051826);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:18','Interactive','com.google.android.apps.tachyon','PHONE_and_SMS','Google Duo - 高品質視訊通話應用程式',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',37.3029962182045);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:23','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',42.3030093312263);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:28','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',47.302982211113);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:33','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',52.3029953241348);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:38','Interactive','com.google.android.calendar','Calendar','Calendar',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',57.3030084371567);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:43','Interactive','com.google.android.gms','ENTERTAINMENT','Google Play services',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',62.3029813170433);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:48','Interactive','com.google.android.gms','ENTERTAINMENT','Google Play services',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',67.3029944300652);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:53','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',72.303007543087);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:14:58','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',77.3029804229736);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:03','Interactive','com.google.android.gms','ENTERTAINMENT','Google Play services',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',82.3029935359955);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:08','Interactive','com.google.android.keep','PRODUCTIVITY','Keep Notes',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',87.3030066490173);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:13','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel Launcher',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',92.302979528904);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:18','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',97.3029926419258);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:23','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',102.303005754948);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:28','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',107.302978634834);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:33','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',112.302991747856);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:38','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',117.303004860878);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:43','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',122.302977740765);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:48','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',127.302990853786);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:53','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',132.303003966808);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:15:58','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',137.302976846695);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:03','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',142.302989959717);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:08','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',147.303003072739);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:13','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',152.30301618576);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:18','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',157.302989065647);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:23','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',162.303002178669);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:28','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',167.303015291691);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:33','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',172.302988171577);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:38','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',177.303001284599);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:43','Interactive','com.google.android.apps.maps','MAPS_AND_NAVIGATION','Maps',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',182.303014397621);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:48','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',187.302987277508);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:53','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',192.30300039053);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:16:58','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',197.303013503551);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:03','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',202.302986383438);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:08','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',207.30299949646);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:13','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',212.303012609482);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:18','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',217.302985489368);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:23','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',222.30299860239);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:28','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',227.303011715412);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:33','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',232.302984595299);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:38','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',237.302997708321);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:43','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',242.303010821342);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:48','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',247.302983701229);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:53','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',252.302996814251);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:17:58','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',257.303009927273);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:03','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',262.302982807159);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:08','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:13','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:18','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:23','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:28','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:33','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:38','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:43','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:48','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:53','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:18:58','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:03','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:08','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:13','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:18','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',1.08496695756912);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:23','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',6.08498007059097);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:28','Screen_off','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:33','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',3.17097455263138);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:38','Interactive','com.google.android.apps.nexuslauncher','Launcher','Pixel 啟動器',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',8.17098766565323);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:43','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',13.1710007786751);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:48','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',18.1709736585617);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:53','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',23.1709867715836);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:19:58','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',28.1709998846054);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:03','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',33.1710129976273);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:08','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',38.1709858775139);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:13','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',43.1709989905357);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:18','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',48.1710121035576);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:23','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',53.1709849834442);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:28','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',58.1709980964661);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:33','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',63.1710112094879);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:38','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',1.50797814130783);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:43','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',6.50799125432968);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:48','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',11.5080043673515);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:53','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',16.5079772472382);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:20:58','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',21.50799036026);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:03','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',26.5080034732819);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:08','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',31.5079763531685);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:13','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',36.5079894661903);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:48','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:53','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:21:58','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:03','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:08','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:13','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:48','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',1.05201601982117);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:53','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',6.05198889970779);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:22:58','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',11.0520020127296);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:03','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',16.0520151257515);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:08','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',21.0519880056381);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:13','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',26.05200111866);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:18','Interactive','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',31.0520142316818);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',36.0519871115685);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:48','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:53','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:23:58','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:03','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:08','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:13','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:48','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:53','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:24:58','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:03','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:08','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:13','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:48','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:53','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:25:58','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:03','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:08','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:13','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:48','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:53','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:26:58','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:03','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:08','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:13','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:48','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:53','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:27:58','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:03','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:08','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:13','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:23','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:28','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:33','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:38','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:43','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:48','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:53','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:28:58','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:29:03','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:29:08','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:29:13','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "phone_log" VALUES ('U00','2023-02-05 19:29:18','Screen_off','labelingStudy.nctu.boredom_detection','EVENTS','殺時間標記',0,'not charging',100,1.0,'Wifi',1,0,0,1,1,1,'Normal','Silent',1.0,0.0,0.0,0.0,1.0,-9999,'',-9999,'static',NULL);
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:42:29',1,'/1/U00_20230205174229');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:42:34',2,'/1/U00_20230205174229;/1/U00_20230205174234');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:42:39',3,'/1/U00_20230205174229;/1/U00_20230205174234;/1/U00_20230205174239');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:42:44',4,'/1/U00_20230205174229;/1/U00_20230205174234;/1/U00_20230205174239;/1/U00_20230205174244');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:42:49',5,'/1/U00_20230205174229;/1/U00_20230205174234;/1/U00_20230205174239;/1/U00_20230205174244;/1/U00_20230205174249');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:42:54',6,'/1/U00_20230205174229;/1/U00_20230205174234;/1/U00_20230205174239;/1/U00_20230205174244;/1/U00_20230205174249;/1/U00_20230205174254');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:04',6,'/1/U00_20230205174234;/1/U00_20230205174239;/1/U00_20230205174244;/1/U00_20230205174249;/1/U00_20230205174254;/1/U00_20230205174304');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:14',5,'/1/U00_20230205174244;/1/U00_20230205174249;/1/U00_20230205174254;/1/U00_20230205174304;/1/U00_20230205174314');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:19',5,'/1/U00_20230205174249;/1/U00_20230205174254;/1/U00_20230205174304;/1/U00_20230205174314;/1/U00_20230205174319');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:24',5,'/1/U00_20230205174254;/1/U00_20230205174304;/1/U00_20230205174314;/1/U00_20230205174319;/1/U00_20230205174324');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:29',5,'/1/U00_20230205174304;/1/U00_20230205174314;/1/U00_20230205174319;/1/U00_20230205174324;/1/U00_20230205174329');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:34',6,'/1/U00_20230205174304;/1/U00_20230205174314;/1/U00_20230205174319;/1/U00_20230205174324;/1/U00_20230205174329;/1/U00_20230205174334');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:39',6,'/1/U00_20230205174314;/1/U00_20230205174319;/1/U00_20230205174324;/1/U00_20230205174329;/1/U00_20230205174334;/1/U00_20230205174339');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:44',7,'/1/U00_20230205174314;/1/U00_20230205174319;/1/U00_20230205174324;/1/U00_20230205174329;/1/U00_20230205174334;/1/U00_20230205174339;/1/U00_20230205174344');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:49',7,'/1/U00_20230205174319;/1/U00_20230205174324;/1/U00_20230205174329;/1/U00_20230205174334;/1/U00_20230205174339;/1/U00_20230205174344;/1/U00_20230205174349');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:54',7,'/1/U00_20230205174324;/1/U00_20230205174329;/1/U00_20230205174334;/1/U00_20230205174339;/1/U00_20230205174344;/1/U00_20230205174349;/1/U00_20230205174354');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:43:59',7,'/1/U00_20230205174329;/1/U00_20230205174334;/1/U00_20230205174339;/1/U00_20230205174344;/1/U00_20230205174349;/1/U00_20230205174354;/1/U00_20230205174359');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:44:04',7,'/1/U00_20230205174334;/1/U00_20230205174339;/1/U00_20230205174344;/1/U00_20230205174349;/1/U00_20230205174354;/1/U00_20230205174359;/1/U00_20230205174404');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:44:09',7,'/1/U00_20230205174339;/1/U00_20230205174344;/1/U00_20230205174349;/1/U00_20230205174354;/1/U00_20230205174359;/1/U00_20230205174404;/1/U00_20230205174409');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:44:14',7,'/1/U00_20230205174344;/1/U00_20230205174349;/1/U00_20230205174354;/1/U00_20230205174359;/1/U00_20230205174404;/1/U00_20230205174409;/1/U00_20230205174414');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 17:44:19',7,'/1/U00_20230205174349;/1/U00_20230205174354;/1/U00_20230205174359;/1/U00_20230205174404;/1/U00_20230205174409;/1/U00_20230205174414;/1/U00_20230205174419');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 18:31:43',1,'/1/U00_20230205183143');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 18:31:48',2,'/1/U00_20230205183143;/1/U00_20230205183148');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 18:31:53',3,'/1/U00_20230205183143;/1/U00_20230205183148;/1/U00_20230205183153');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 18:31:58',4,'/1/U00_20230205183143;/1/U00_20230205183148;/1/U00_20230205183153;/1/U00_20230205183158');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 18:32:03',5,'/1/U00_20230205183143;/1/U00_20230205183148;/1/U00_20230205183153;/1/U00_20230205183158;/1/U00_20230205183203');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:02',1,'/1/U00_20230205190602');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:07',2,'/1/U00_20230205190602;/1/U00_20230205190607');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:12',3,'/1/U00_20230205190602;/1/U00_20230205190607;/1/U00_20230205190612');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:17',4,'/1/U00_20230205190602;/1/U00_20230205190607;/1/U00_20230205190612;/1/U00_20230205190617');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:22',5,'/1/U00_20230205190602;/1/U00_20230205190607;/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:27',6,'/1/U00_20230205190602;/1/U00_20230205190607;/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:32',7,'/1/U00_20230205190602;/1/U00_20230205190607;/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:37',7,'/1/U00_20230205190607;/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:42',7,'/1/U00_20230205190612;/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:47',7,'/1/U00_20230205190617;/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:52',7,'/1/U00_20230205190622;/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:06:57',7,'/1/U00_20230205190627;/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:02',7,'/1/U00_20230205190632;/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:07',7,'/1/U00_20230205190637;/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:12',7,'/1/U00_20230205190642;/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:17',7,'/1/U00_20230205190647;/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:22',7,'/1/U00_20230205190652;/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:27',7,'/1/U00_20230205190657;/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:32',7,'/1/U00_20230205190702;/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:37',7,'/1/U00_20230205190707;/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:42',7,'/1/U00_20230205190712;/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:47',7,'/1/U00_20230205190717;/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:52',7,'/1/U00_20230205190722;/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:07:57',7,'/1/U00_20230205190727;/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:02',7,'/1/U00_20230205190732;/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:07',7,'/1/U00_20230205190737;/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:12',7,'/1/U00_20230205190742;/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:17',7,'/1/U00_20230205190747;/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:22',7,'/1/U00_20230205190752;/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:27',7,'/1/U00_20230205190757;/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:32',7,'/1/U00_20230205190802;/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:37',7,'/1/U00_20230205190807;/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:42',7,'/1/U00_20230205190812;/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:47',7,'/1/U00_20230205190817;/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:52',7,'/1/U00_20230205190822;/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:08:57',7,'/1/U00_20230205190827;/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:02',7,'/1/U00_20230205190832;/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:07',7,'/1/U00_20230205190837;/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:12',7,'/1/U00_20230205190842;/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:17',7,'/1/U00_20230205190847;/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:22',7,'/1/U00_20230205190852;/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:27',7,'/1/U00_20230205190857;/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:32',7,'/1/U00_20230205190902;/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:37',7,'/1/U00_20230205190907;/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:42',7,'/1/U00_20230205190912;/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:47',7,'/1/U00_20230205190917;/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:52',7,'/1/U00_20230205190922;/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:09:57',7,'/1/U00_20230205190927;/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:10:02',7,'/1/U00_20230205190932;/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:10:07',7,'/1/U00_20230205190937;/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:10:12',7,'/1/U00_20230205190942;/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007;/1/U00_20230205191012');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:10:17',7,'/1/U00_20230205190947;/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007;/1/U00_20230205191012;/1/U00_20230205191017');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:10:22',7,'/1/U00_20230205190952;/1/U00_20230205190957;/1/U00_20230205191002;/1/U00_20230205191007;/1/U00_20230205191012;/1/U00_20230205191017;/1/U00_20230205191022');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:10:39',4,'/1/U00_20230205191012;/1/U00_20230205191017;/1/U00_20230205191022;/1/U00_20230205191039');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:10:59',2,'/1/U00_20230205191039;/1/U00_20230205191059');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:13:43',1,'/2/U00_20230205191343');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:13:48',2,'/2/U00_20230205191343;/2/U00_20230205191348');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:13:53',3,'/2/U00_20230205191343;/2/U00_20230205191348;/2/U00_20230205191353');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:13:58',4,'/2/U00_20230205191343;/2/U00_20230205191348;/2/U00_20230205191353;/2/U00_20230205191358');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:03',5,'/2/U00_20230205191343;/2/U00_20230205191348;/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:08',6,'/2/U00_20230205191343;/2/U00_20230205191348;/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403;/2/U00_20230205191408');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:13',7,'/2/U00_20230205191343;/2/U00_20230205191348;/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403;/2/U00_20230205191408;/2/U00_20230205191413');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:18',7,'/2/U00_20230205191348;/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403;/2/U00_20230205191408;/2/U00_20230205191413;/2/U00_20230205191418');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:23',7,'/2/U00_20230205191353;/2/U00_20230205191358;/2/U00_20230205191403;/2/U00_20230205191408;/2/U00_20230205191413;/2/U00_20230205191418;/2/U00_20230205191423');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:33',6,'/2/U00_20230205191403;/2/U00_20230205191408;/2/U00_20230205191413;/2/U00_20230205191418;/2/U00_20230205191423;/2/U00_20230205191433');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:38',6,'/2/U00_20230205191408;/2/U00_20230205191413;/2/U00_20230205191418;/2/U00_20230205191423;/2/U00_20230205191433;/2/U00_20230205191438');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:43',6,'/2/U00_20230205191413;/2/U00_20230205191418;/2/U00_20230205191423;/2/U00_20230205191433;/2/U00_20230205191438;/2/U00_20230205191443');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:48',6,'/2/U00_20230205191418;/2/U00_20230205191423;/2/U00_20230205191433;/2/U00_20230205191438;/2/U00_20230205191443;/2/U00_20230205191448');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:53',6,'/2/U00_20230205191423;/2/U00_20230205191433;/2/U00_20230205191438;/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:14:58',6,'/2/U00_20230205191433;/2/U00_20230205191438;/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:03',7,'/2/U00_20230205191433;/2/U00_20230205191438;/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:08',7,'/2/U00_20230205191438;/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:13',7,'/2/U00_20230205191443;/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:18',7,'/2/U00_20230205191448;/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:23',7,'/2/U00_20230205191453;/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:28',7,'/2/U00_20230205191458;/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:33',7,'/2/U00_20230205191503;/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:38',7,'/2/U00_20230205191508;/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:43',7,'/2/U00_20230205191513;/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:48',7,'/2/U00_20230205191518;/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:53',7,'/2/U00_20230205191523;/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:15:58',7,'/2/U00_20230205191528;/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:03',7,'/2/U00_20230205191533;/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:08',7,'/2/U00_20230205191538;/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:13',7,'/2/U00_20230205191543;/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:18',7,'/2/U00_20230205191548;/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:23',7,'/2/U00_20230205191553;/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:28',7,'/2/U00_20230205191558;/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:33',7,'/2/U00_20230205191603;/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:38',7,'/2/U00_20230205191608;/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633;/2/U00_20230205191638');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:43',7,'/2/U00_20230205191613;/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633;/2/U00_20230205191638;/2/U00_20230205191643');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:16:48',7,'/2/U00_20230205191618;/2/U00_20230205191623;/2/U00_20230205191628;/2/U00_20230205191633;/2/U00_20230205191638;/2/U00_20230205191643;/2/U00_20230205191648');
INSERT INTO "_screenshots_validation" VALUES ('U00','2023-02-05 19:18:03',1,'/2/U00_20230205191803');
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:42:29','U00_20230205174229',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:42:34','U00_20230205174234',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:42:39','U00_20230205174239',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:42:44','U00_20230205174244',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:42:49','U00_20230205174249',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:42:54','U00_20230205174254',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:04','U00_20230205174304',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:14','U00_20230205174314',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:19','U00_20230205174319',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:24','U00_20230205174324',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:29','U00_20230205174329',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:34','U00_20230205174334',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:39','U00_20230205174339',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:44','U00_20230205174344',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:49','U00_20230205174349',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:54','U00_20230205174354',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:43:59','U00_20230205174359',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:44:04','U00_20230205174404',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:44:09','U00_20230205174409',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:44:14','U00_20230205174414',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 17:44:19','U00_20230205174419',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 18:31:43','U00_20230205183143',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 18:31:48','U00_20230205183148',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 18:31:53','U00_20230205183153',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 18:31:58','U00_20230205183158',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 18:32:03','U00_20230205183203',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:02','U00_20230205190602',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:07','U00_20230205190607',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:12','U00_20230205190612',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:17','U00_20230205190617',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:22','U00_20230205190622',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:27','U00_20230205190627',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:32','U00_20230205190632',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:37','U00_20230205190637',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:42','U00_20230205190642',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:47','U00_20230205190647',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:52','U00_20230205190652',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:06:57','U00_20230205190657',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:02','U00_20230205190702',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:07','U00_20230205190707',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:12','U00_20230205190712',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:17','U00_20230205190717',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:22','U00_20230205190722',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:27','U00_20230205190727',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:32','U00_20230205190732',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:37','U00_20230205190737',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:42','U00_20230205190742',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:47','U00_20230205190747',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:52','U00_20230205190752',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:07:57','U00_20230205190757',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:02','U00_20230205190802',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:07','U00_20230205190807',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:12','U00_20230205190812',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:17','U00_20230205190817',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:22','U00_20230205190822',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:27','U00_20230205190827',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:32','U00_20230205190832',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:37','U00_20230205190837',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:42','U00_20230205190842',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:47','U00_20230205190847',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:52','U00_20230205190852',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:08:57','U00_20230205190857',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:02','U00_20230205190902',1,1,1,1,0);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:07','U00_20230205190907',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:12','U00_20230205190912',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:17','U00_20230205190917',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:22','U00_20230205190922',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:27','U00_20230205190927',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:32','U00_20230205190932',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:37','U00_20230205190937',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:42','U00_20230205190942',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:47','U00_20230205190947',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:52','U00_20230205190952',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:09:57','U00_20230205190957',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:10:02','U00_20230205191002',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:10:07','U00_20230205191007',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:10:12','U00_20230205191012',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:10:17','U00_20230205191017',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:10:22','U00_20230205191022',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:10:39','U00_20230205191039',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:10:59','U00_20230205191059',1,1,1,1,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:13:43','U00_20230205191343',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:13:48','U00_20230205191348',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:13:53','U00_20230205191353',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:13:58','U00_20230205191358',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:03','U00_20230205191403',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:08','U00_20230205191408',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:13','U00_20230205191413',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:18','U00_20230205191418',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:23','U00_20230205191423',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:33','U00_20230205191433',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:38','U00_20230205191438',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:43','U00_20230205191443',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:48','U00_20230205191448',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:53','U00_20230205191453',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:14:58','U00_20230205191458',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:03','U00_20230205191503',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:08','U00_20230205191508',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:13','U00_20230205191513',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:18','U00_20230205191518',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:23','U00_20230205191523',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:28','U00_20230205191528',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:33','U00_20230205191533',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:38','U00_20230205191538',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:43','U00_20230205191543',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:48','U00_20230205191548',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:53','U00_20230205191553',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:15:58','U00_20230205191558',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:03','U00_20230205191603',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:08','U00_20230205191608',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:13','U00_20230205191613',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:18','U00_20230205191618',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:23','U00_20230205191623',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:28','U00_20230205191628',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:33','U00_20230205191633',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:38','U00_20230205191638',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:43','U00_20230205191643',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:16:48','U00_20230205191648',1,2,0,0,1);
INSERT INTO "screenshots" VALUES ('U00','2023-02-05 19:18:03','U00_20230205191803',1,2,0,0,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:42:29',2,0,7,0,4,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:42:34',1,0,6,0,2,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:42:39',0,0,4,0,2,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:42:44',0,0,3,0,2,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:42:49',0,0,1,0,2,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,4,0,11,0,6,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:42:54',0,0,1,0,3,0,0,2,0,9,0,7,0,0,4,0,11,0,8,0,0,4,0,11,0,8,0,0,4,0,11,0,8,0,0,4,0,11,0,8,0,0,4,0,11,0,8,0,0,4,0,11,0,8,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:42:59',1,0,1,0,4,0,0,3,0,8,0,8,0,0,5,0,12,0,10,0,0,5,0,12,0,10,0,0,5,0,12,0,10,0,0,5,0,12,0,10,0,0,5,0,12,0,10,0,0,5,0,12,0,10,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:04',1,0,2,0,4,0,0,2,0,8,0,6,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:09',1,0,2,0,4,0,0,1,0,6,0,6,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,5,0,13,0,10,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:14',1,0,3,0,4,0,0,1,0,6,0,6,0,0,5,0,14,0,10,0,0,5,0,14,0,10,0,0,5,0,14,0,10,0,0,5,0,14,0,10,0,0,5,0,14,0,10,0,0,5,0,14,0,10,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:19',1,0,4,0,5,0,0,1,0,5,0,7,0,0,5,0,15,0,11,0,0,5,0,15,0,11,0,0,5,0,15,0,11,0,0,5,0,15,0,11,0,0,5,0,15,0,11,0,0,5,0,15,0,11,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:24',1,0,4,0,4,0,0,1,0,5,0,7,0,0,5,0,15,0,12,0,0,5,0,15,0,12,0,0,5,0,15,0,12,0,0,5,0,15,0,12,0,0,5,0,15,0,12,0,0,5,0,15,0,12,0,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:29',1,0,3,0,2,1,0,2,0,4,0,6,1,0,6,0,15,0,12,1,0,6,0,15,0,12,1,0,6,0,15,0,12,1,0,6,0,15,0,12,1,0,6,0,15,0,12,1,0,6,0,15,0,12,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:34',1,0,3,0,2,1,0,2,0,5,0,6,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:39',1,0,3,0,2,1,0,2,0,5,0,6,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:44',1,0,2,0,2,1,0,2,0,5,0,6,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:49',1,0,1,0,1,1,0,2,0,5,0,6,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:54',1,0,1,0,0,1,0,2,0,5,0,4,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:43:59',0,0,1,0,0,0,0,1,0,4,0,2,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,6,0,16,0,12,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:04',0,0,0,0,1,0,0,1,0,3,0,3,1,0,6,0,16,0,13,1,0,6,0,16,0,13,1,0,6,0,16,0,13,1,0,6,0,16,0,13,1,0,6,0,16,0,13,1,0,6,0,16,0,13,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:09',0,0,0,0,2,0,0,1,0,3,0,4,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:14',0,0,0,0,2,0,0,1,0,2,0,4,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,6,0,16,0,14,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:19',0,0,0,0,3,0,0,1,0,1,0,4,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:24',0,0,0,0,3,0,0,1,0,1,0,3,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:29',0,0,0,0,3,0,0,0,0,1,0,3,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:34',0,0,0,0,2,0,0,0,0,0,0,3,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:39',0,0,0,0,1,0,0,0,0,0,0,3,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:44',0,0,0,0,1,0,0,0,0,0,0,3,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:49',0,0,0,0,0,0,0,0,0,0,0,3,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:54',0,0,0,0,0,0,0,0,0,0,0,3,0,0,4,0,14,0,14,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:44:59',0,0,0,0,0,0,0,0,0,0,0,3,0,0,4,0,12,0,13,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:45:52',0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,5,0,8,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:46:47',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:52:47',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,5,0,9,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:52:51',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,5,0,8,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 17:57:39',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,5,0,9,1,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:01:24',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:04:54',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:05:47',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:13:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:15:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:20:57',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:24:01',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:24:06',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:25:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:30:35',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,16,0,15,1,0,0,0,0,0,0,0);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:31:43',0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,6,0,16,0,15,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:31:48',0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,6,0,17,0,15,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:31:53',0,0,3,0,0,1,0,0,0,3,0,0,1,0,0,0,3,0,0,1,0,0,0,3,0,0,1,0,0,0,3,0,0,1,0,0,0,3,0,0,1,0,0,0,3,0,0,1,0,6,0,19,0,15,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:31:58',0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:32:03',0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:32:08',0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:32:13',0,0,3,0,1,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:32:18',0,0,2,0,1,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:32:23',0,0,0,0,1,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:32:28',0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:34:04',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,1,1,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:36:59',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,0,0,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:40:26',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,0,0,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:40:31',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,6,0,19,0,16,2,0,0,0,1,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:46:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,0,1,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:52:32',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,0,0,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:53:01',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,0,0,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:54:22',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,0,0,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 18:59:01',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,0,0,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:01:39',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,3,0,1,1,0,0,0,0,0,1,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:02',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,1,1,0,0,0,0,0,0,1);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:07',0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,3,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:12',0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,3,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:17',1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:22',1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:27',1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:32',1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:37',1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:42',1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:47',0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:52',0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:06:57',0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:02',0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:07',0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:12',0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:17',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:22',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:27',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:32',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:37',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:42',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:47',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:52',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:07:57',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:02',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:07',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:12',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:17',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:22',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:27',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:32',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:37',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:42',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:47',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:52',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:08:57',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:02',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,1,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:07',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:12',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:17',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,1,0,4,0,1,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:22',1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,4,0,2,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:27',1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,1,0,1,1,0,2,0,4,0,2,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:32',1,0,1,0,2,0,0,1,0,1,0,2,0,0,1,0,1,0,2,0,0,2,0,2,0,2,1,0,2,0,2,0,2,1,0,2,0,2,0,2,1,0,2,0,2,0,2,1,0,2,0,5,0,3,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:37',2,0,2,0,3,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:42',2,0,2,0,3,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:47',2,0,2,0,3,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:52',1,0,2,0,2,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:09:57',1,0,2,0,2,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:02',1,0,1,0,1,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:07',0,0,0,0,0,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:12',0,0,0,0,0,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:17',0,0,0,0,0,0,0,2,0,2,0,3,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:22',0,0,0,0,0,0,0,1,0,2,0,2,0,0,2,0,2,0,3,0,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,3,0,3,1,0,3,0,6,0,4,2,0,0,1,1,1,1,2);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:27',0,0,0,0,0,1,0,1,0,2,0,2,1,0,2,0,2,0,3,1,0,3,0,3,0,3,2,0,3,0,3,0,3,2,0,3,0,3,0,3,2,0,3,0,3,0,3,2,0,3,0,6,0,4,3,0,1,2,2,2,2,3);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:39',0,0,0,0,0,2,0,0,0,0,0,0,2,0,2,0,2,0,3,2,0,3,0,3,0,3,3,0,3,0,3,0,3,3,0,3,0,3,0,3,3,0,3,0,3,0,3,3,0,3,0,6,0,4,4,0,2,3,3,3,3,4);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:44',1,0,1,0,1,2,0,1,0,1,0,1,2,0,3,0,3,0,4,2,0,4,0,4,0,4,3,0,4,0,4,0,4,3,0,4,0,4,0,4,3,0,4,0,4,0,4,3,0,4,0,7,0,5,4,0,2,3,3,3,3,4);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:49',1,0,3,0,1,2,0,1,0,3,0,1,2,0,3,0,5,0,4,2,0,4,0,6,0,4,3,0,4,0,6,0,4,3,0,4,0,6,0,4,3,0,4,0,6,0,4,3,0,4,0,9,0,5,4,0,2,3,3,3,3,4);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:54',1,0,3,0,1,1,0,1,0,3,0,1,2,0,3,0,5,0,4,2,0,4,0,6,0,4,3,0,4,0,6,0,4,3,0,4,0,6,0,4,3,0,4,0,6,0,4,3,0,4,0,9,0,5,4,0,2,3,3,3,3,4);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:10:59',1,0,3,0,2,1,0,1,0,3,0,2,2,0,3,0,5,0,5,2,0,4,0,6,0,5,3,0,4,0,6,0,5,3,0,4,0,6,0,5,3,0,4,0,6,0,5,3,0,4,0,9,0,6,4,0,3,4,4,4,4,5);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:11:04',1,0,3,0,2,1,0,1,0,3,0,2,2,0,3,0,5,0,5,2,0,4,0,6,0,5,2,0,4,0,6,0,5,3,0,4,0,6,0,5,3,0,4,0,6,0,5,3,0,4,0,9,0,6,4,0,3,3,4,4,4,5);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:13:02',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,3,0,2,2,0,3,0,5,0,5,2,0,4,0,6,0,5,3,0,4,0,6,0,5,3,0,4,0,6,0,5,3,0,4,0,9,0,6,4,0,3,3,4,4,4,5);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:13:43',0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,2,0,1,1,0,3,0,5,0,5,3,0,4,0,6,0,5,4,0,4,0,6,0,5,4,0,4,0,6,0,5,4,0,4,0,9,0,6,5,0,2,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:13:48',0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,1,1,0,3,0,5,0,5,3,0,4,0,6,0,5,4,0,4,0,6,0,5,4,0,4,0,6,0,5,4,0,4,0,9,0,6,5,0,2,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:13:53',1,0,0,0,1,1,0,1,0,0,0,1,1,0,1,0,0,0,2,1,0,4,0,5,0,6,3,0,5,0,6,0,6,4,0,5,0,6,0,6,4,0,5,0,6,0,6,4,0,5,0,9,0,7,5,0,2,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:13:58',3,0,1,0,1,1,0,3,0,1,0,1,1,0,3,0,1,0,1,1,0,6,0,6,0,6,3,0,7,0,7,0,6,4,0,7,0,7,0,6,4,0,7,0,7,0,6,4,0,7,0,10,0,7,5,0,2,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:03',3,0,1,0,2,1,0,3,0,1,0,2,1,0,3,0,1,0,2,1,0,6,0,6,0,7,3,0,7,0,7,0,7,4,0,7,0,7,0,7,4,0,7,0,7,0,7,4,0,7,0,10,0,8,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:08',4,0,2,0,2,1,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,7,0,7,0,7,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:13',4,0,2,0,2,0,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,7,0,7,0,7,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:18',4,0,2,0,2,0,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,7,0,7,0,7,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:23',3,0,2,0,1,0,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,6,0,7,0,6,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:28',1,0,1,0,1,0,0,4,0,2,0,2,1,0,4,0,2,0,2,1,0,6,0,7,0,6,3,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,8,0,7,4,0,8,0,11,0,8,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:33',2,0,1,0,1,0,0,5,0,2,0,3,1,0,5,0,2,0,3,1,0,7,0,6,0,6,3,0,9,0,8,0,8,4,0,9,0,8,0,8,4,0,9,0,8,0,8,4,0,9,0,11,0,9,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:38',1,0,1,0,1,0,0,5,0,3,0,3,1,0,5,0,3,0,3,1,0,6,0,6,0,5,3,0,9,0,9,0,8,4,0,9,0,9,0,8,4,0,9,0,9,0,8,4,0,9,0,12,0,9,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:43',1,0,1,0,1,0,0,5,0,3,0,3,0,0,5,0,3,0,3,1,0,6,0,6,0,5,3,0,9,0,9,0,8,4,0,9,0,9,0,8,4,0,9,0,9,0,8,4,0,9,0,12,0,9,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:48',1,0,1,0,1,0,0,5,0,3,0,3,0,0,5,0,3,0,3,1,0,6,0,6,0,5,3,0,9,0,9,0,8,4,0,9,0,9,0,8,4,0,9,0,9,0,8,4,0,9,0,12,0,9,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:53',1,1,1,0,1,0,0,4,1,3,0,2,0,0,5,1,3,0,3,1,0,6,1,6,0,5,3,0,9,1,9,0,8,4,0,9,1,9,0,8,4,0,9,1,9,0,8,4,0,9,1,12,0,9,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:14:58',2,1,1,0,2,0,0,3,1,2,0,3,0,0,6,1,3,0,4,1,0,7,1,6,0,6,3,0,10,1,9,0,9,4,0,10,1,9,0,9,4,0,10,1,9,0,9,4,0,10,1,12,0,10,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:03',1,1,2,0,1,0,0,3,1,3,0,2,0,0,6,1,4,0,4,1,0,7,1,7,0,6,3,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,13,0,10,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:08',1,1,1,0,1,0,0,2,1,2,0,2,0,0,6,1,4,0,4,1,0,7,1,7,0,6,3,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,10,0,9,4,0,10,1,13,0,10,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:13',2,1,1,0,3,0,0,3,1,2,0,4,0,0,7,1,4,0,6,1,0,8,1,7,0,8,3,0,11,1,10,0,11,4,0,11,1,10,0,11,4,0,11,1,10,0,11,4,0,11,1,13,0,12,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:18',2,1,2,0,3,0,0,3,1,3,0,4,0,0,7,1,5,0,6,1,0,8,1,8,0,8,3,0,11,1,11,0,11,4,0,11,1,11,0,11,4,0,11,1,11,0,11,4,0,11,1,14,0,12,5,0,1,4,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:23',3,0,3,0,4,0,0,4,1,4,0,5,0,0,8,1,6,0,7,1,0,9,1,9,0,9,3,0,12,1,12,0,12,4,0,12,1,12,0,12,4,0,12,1,12,0,12,4,0,12,1,15,0,13,5,0,1,3,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:28',2,0,4,0,4,0,0,4,1,5,0,6,0,0,8,1,7,0,8,1,0,9,1,10,0,10,2,0,12,1,13,0,13,4,0,12,1,13,0,13,4,0,12,1,13,0,13,4,0,12,1,16,0,14,5,0,1,3,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:33',2,0,3,0,5,0,0,3,1,5,0,6,0,0,8,1,7,0,9,1,0,9,1,10,0,11,2,0,12,1,13,0,14,4,0,12,1,13,0,14,4,0,12,1,13,0,14,4,0,12,1,16,0,15,5,0,1,3,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:38',2,1,5,0,6,0,1,3,2,6,0,7,0,1,8,2,9,0,10,1,1,9,2,12,0,12,1,1,12,2,15,0,15,4,1,12,2,15,0,15,4,1,12,2,15,0,15,4,1,12,2,18,0,16,5,1,1,2,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:43',1,1,6,0,6,0,1,3,2,7,0,9,0,1,8,2,10,0,12,1,1,8,2,12,0,13,1,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,19,0,18,5,1,1,2,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:48',1,1,5,0,6,0,1,3,2,7,0,9,0,1,8,2,10,0,12,1,1,8,2,11,0,13,1,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,16,0,17,4,1,12,2,19,0,18,5,1,1,2,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:53',0,1,4,0,6,0,1,3,1,7,0,10,0,1,8,2,10,0,13,1,1,8,2,10,0,14,1,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,19,0,19,5,1,1,2,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:15:58',0,1,3,0,5,0,1,2,1,7,0,9,0,1,8,2,10,0,13,1,1,8,2,10,0,13,1,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,16,0,18,4,1,12,2,19,0,19,5,1,1,2,5,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:03',1,1,3,0,6,0,1,3,1,6,0,11,0,1,9,2,10,0,15,1,1,9,2,10,0,15,1,1,13,2,16,0,20,4,1,13,2,16,0,20,4,1,13,2,16,0,20,4,1,13,2,19,0,21,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:08',1,0,2,0,7,0,0,3,1,7,0,13,0,1,9,2,11,0,17,1,1,9,2,11,0,17,1,1,13,2,17,0,22,3,1,13,2,17,0,22,4,1,13,2,17,0,22,4,1,13,2,20,0,23,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:13',1,0,2,0,6,0,0,2,1,8,0,12,0,1,9,2,12,0,18,1,1,9,2,12,0,18,1,1,13,2,18,0,23,3,1,13,2,18,0,23,4,1,13,2,18,0,23,4,1,13,2,21,0,24,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:18',1,0,4,0,7,0,0,2,1,9,0,13,0,1,9,2,14,0,19,1,1,9,2,14,0,19,1,1,12,2,19,0,24,3,1,13,2,20,0,24,4,1,13,2,20,0,24,4,1,13,2,23,0,25,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:23',2,0,5,0,7,0,0,2,1,9,0,13,0,1,10,2,15,0,20,1,1,10,2,15,0,20,1,1,13,2,20,0,25,3,1,14,2,21,0,25,4,1,14,2,21,0,25,4,1,14,2,24,0,26,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:28',4,0,6,0,7,0,0,4,1,9,0,12,0,1,12,2,16,0,20,1,1,12,2,16,0,20,1,1,15,2,21,0,25,3,1,16,2,22,0,25,4,1,16,2,22,0,25,4,1,16,2,25,0,26,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:33',4,0,8,0,6,0,0,5,1,11,0,12,0,1,13,2,18,0,21,1,1,13,2,18,0,21,1,1,16,2,23,0,26,3,1,17,2,24,0,26,4,1,17,2,24,0,26,4,1,17,2,27,0,27,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:38',5,0,8,0,4,0,0,6,0,10,0,11,0,0,14,2,19,0,21,1,1,14,2,19,0,21,1,1,17,2,24,0,26,3,1,18,2,25,0,26,4,1,18,2,25,0,26,4,1,18,2,28,0,27,5,1,1,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:43',5,0,7,0,3,0,0,6,0,9,0,9,0,0,14,2,19,0,21,0,1,14,2,19,0,21,1,1,17,2,24,0,26,3,1,18,2,25,0,26,4,1,18,2,25,0,26,4,1,18,2,28,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:48',5,0,5,0,2,0,0,6,0,9,0,9,0,0,14,2,19,0,21,0,1,14,2,19,0,21,1,1,17,2,24,0,26,3,1,18,2,25,0,26,4,1,18,2,25,0,26,4,1,18,2,28,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:53',5,0,6,0,1,0,0,7,0,11,0,8,0,0,14,2,21,0,20,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:16:58',3,0,5,0,1,0,0,7,0,11,0,8,0,0,12,2,20,0,20,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:03',2,0,3,0,0,0,0,6,0,11,0,6,0,0,12,2,20,0,19,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:08',1,0,2,0,0,0,0,6,0,10,0,4,0,0,11,2,19,0,19,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:13',1,0,2,0,0,0,0,6,0,9,0,3,0,0,11,2,19,0,19,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:18',1,0,2,0,0,0,0,6,0,7,0,2,0,0,11,2,19,0,19,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:23',0,0,0,0,0,0,0,5,0,6,0,1,0,0,11,2,19,0,19,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:28',0,0,0,0,0,0,0,3,0,5,0,1,0,0,11,2,19,0,19,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:33',0,0,0,0,0,0,0,2,0,3,0,0,0,0,10,2,19,0,18,0,1,15,2,21,0,21,1,1,18,2,26,0,26,3,1,19,2,27,0,26,4,1,19,2,27,0,26,4,1,19,2,30,0,27,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:38',0,0,0,1,1,0,0,1,0,2,1,1,0,0,10,2,18,1,19,0,1,15,2,21,1,22,1,1,18,2,26,1,27,3,1,19,2,27,1,27,4,1,19,2,27,1,27,4,1,19,2,30,1,28,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:43',0,0,1,1,2,0,0,1,0,3,1,2,0,0,10,2,19,1,20,0,1,15,2,22,1,23,1,1,18,2,27,1,28,3,1,19,2,28,1,28,4,1,19,2,28,1,28,4,1,19,2,31,1,29,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:48',0,0,2,1,2,0,0,1,0,4,1,2,0,0,10,2,20,1,20,0,1,15,2,23,1,23,1,1,18,2,28,1,28,3,1,19,2,29,1,28,4,1,19,2,29,1,28,4,1,19,2,32,1,29,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:53',0,0,2,1,3,0,0,0,0,2,1,3,0,0,10,1,20,1,21,0,1,15,2,23,1,24,1,1,18,2,28,1,29,3,1,19,2,29,1,29,4,1,19,2,29,1,29,4,1,19,2,32,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:17:58',0,0,3,1,3,0,0,0,0,3,1,3,0,0,9,1,21,1,20,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:03',0,0,3,1,3,0,0,0,0,3,1,3,0,0,9,1,20,1,20,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:08',0,0,3,0,2,0,0,0,0,3,1,3,0,0,9,1,20,1,20,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:13',0,0,2,0,1,0,0,0,0,3,1,3,0,0,8,1,20,1,18,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:18',0,0,1,0,1,0,0,0,0,3,1,3,0,0,8,1,19,1,18,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:23',0,0,1,0,0,0,0,0,0,3,1,3,0,0,7,1,18,1,17,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:28',0,0,0,0,0,0,0,0,0,3,1,3,0,0,7,1,17,1,16,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:33',0,0,0,0,0,0,0,0,0,3,1,3,0,0,7,1,17,1,15,0,1,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:38',0,0,0,0,0,0,0,0,0,3,0,2,0,0,7,0,15,1,14,0,0,15,2,24,1,24,1,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,1,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:43',0,0,0,0,0,0,0,0,0,2,0,1,0,0,7,0,14,1,12,0,0,15,2,24,1,24,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,0,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:48',0,0,0,0,0,0,0,0,0,1,0,1,0,0,7,0,14,1,12,0,0,15,2,24,1,24,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,0,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:53',0,0,0,0,0,0,0,0,0,1,0,0,0,0,7,0,14,1,11,0,0,14,2,24,1,23,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,0,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:18:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,7,0,14,1,11,0,0,12,2,23,1,23,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,0,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,14,1,9,0,0,12,2,23,1,22,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,0,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,13,1,7,0,0,11,2,22,1,22,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,0,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,12,1,6,0,0,11,2,22,1,22,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,0,0,4,5,5,6);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,10,1,5,0,0,11,2,22,1,22,0,1,18,2,29,1,29,3,1,19,2,30,1,29,4,1,19,2,30,1,29,4,1,19,2,33,1,30,5,1,1,1,5,6,6,7);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:23',0,0,0,0,0,1,0,0,0,0,0,0,1,0,5,0,9,1,4,1,0,11,2,22,1,22,1,1,17,2,29,1,28,4,1,19,2,30,1,29,5,1,19,2,30,1,29,5,1,19,2,33,1,30,6,1,1,1,5,6,6,7);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:28',0,0,0,0,1,1,0,0,0,0,0,1,1,0,3,0,8,1,5,1,0,11,2,22,1,23,1,1,17,2,29,1,29,4,1,19,2,30,1,30,5,1,19,2,30,1,30,5,1,19,2,33,1,31,6,1,1,1,5,6,6,7);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:33',0,0,0,0,1,2,0,0,0,0,0,1,2,0,2,0,6,1,4,2,0,10,2,22,1,22,2,1,17,2,28,1,28,5,1,19,2,30,1,30,6,1,19,2,30,1,30,6,1,19,2,33,1,31,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:38',0,0,0,0,1,2,0,0,0,0,0,1,2,0,1,0,5,1,4,2,0,10,2,21,1,22,2,1,16,2,27,1,27,5,1,19,2,30,1,30,6,1,19,2,30,1,30,6,1,19,2,33,1,31,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:43',1,0,2,0,2,2,0,1,0,2,0,2,2,0,2,0,7,1,5,2,0,11,2,23,1,23,2,1,17,2,29,1,28,5,1,20,2,32,1,31,6,1,20,2,32,1,31,6,1,20,2,35,1,32,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:48',1,0,2,0,2,2,0,1,0,2,0,2,2,0,2,0,7,1,5,2,0,11,2,23,1,23,2,1,17,2,29,1,28,5,1,20,2,32,1,31,6,1,20,2,32,1,31,6,1,20,2,35,1,32,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:53',1,0,3,0,2,1,0,1,0,3,0,2,2,0,1,0,6,1,5,2,0,11,1,24,1,23,2,1,17,2,30,1,28,5,1,20,2,33,1,31,6,1,20,2,33,1,31,6,1,20,2,36,1,32,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:19:58',1,0,4,0,1,1,0,1,0,4,0,2,2,0,1,0,7,1,5,2,0,10,1,25,1,22,2,1,17,2,31,1,28,5,1,20,2,34,1,31,6,1,20,2,34,1,31,6,1,20,2,37,1,32,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:03',1,0,5,0,2,0,0,1,0,5,0,3,2,0,1,0,8,1,6,2,0,10,1,25,1,23,2,1,17,2,32,1,29,5,1,20,2,35,1,32,6,1,20,2,35,1,32,6,1,20,2,38,1,33,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:08',1,0,5,0,3,0,0,1,0,5,0,4,2,0,1,0,8,1,7,2,0,10,1,25,1,24,2,1,17,2,32,1,30,5,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:13',0,0,3,0,2,0,0,1,0,5,0,4,2,0,1,0,8,1,7,2,0,9,1,25,1,22,2,1,17,2,32,1,30,5,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:18',0,0,3,0,2,0,0,1,0,5,0,4,2,0,1,0,8,1,7,2,0,9,1,24,1,22,2,1,17,2,32,1,30,5,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,2,2,6,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:23',0,0,2,0,2,0,0,1,0,5,0,4,1,0,1,0,8,1,7,2,0,8,1,23,1,21,2,1,17,2,32,1,30,5,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,2,2,5,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:28',0,0,1,0,2,0,0,1,0,5,0,3,1,0,1,0,8,1,7,2,0,8,1,22,1,20,2,1,17,2,32,1,30,4,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,2,2,5,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:33',0,0,0,0,1,0,0,1,0,5,0,3,0,0,1,0,8,1,7,2,0,8,1,22,1,19,2,1,17,2,32,1,30,4,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,2,2,5,7,7,8);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:38',0,0,0,0,0,0,0,1,0,5,0,3,0,0,1,0,8,0,6,2,0,8,0,20,1,18,2,0,17,2,32,1,30,3,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,3,3,5,8,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:43',0,0,0,0,0,0,0,0,0,3,0,2,0,0,1,0,7,0,5,2,0,8,0,19,1,16,2,0,16,2,31,1,29,3,1,20,2,35,1,33,6,1,20,2,35,1,33,6,1,20,2,38,1,34,7,1,3,3,5,8,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:48',0,0,0,0,1,0,0,0,0,3,0,3,0,0,1,0,6,0,6,2,0,8,0,19,1,17,2,0,16,2,30,1,30,3,1,20,2,35,1,34,6,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,5,8,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:53',0,0,0,0,1,0,0,0,0,2,0,3,0,0,1,0,6,0,5,2,0,8,0,19,1,16,2,0,16,2,29,1,30,3,1,20,2,35,1,34,6,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,5,8,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:20:58',0,0,0,0,1,0,0,0,0,1,0,3,0,0,1,0,5,0,5,2,0,8,0,19,1,16,2,0,16,2,29,1,29,3,1,20,2,35,1,34,6,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,5,8,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:03',0,0,0,0,1,0,0,0,0,0,0,2,0,0,1,0,5,0,5,2,0,7,0,19,1,14,2,0,16,2,29,1,29,3,1,20,2,35,1,34,6,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:08',0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,7,0,18,1,12,2,0,16,2,29,1,29,3,1,20,2,35,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:13',0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,7,0,17,1,11,2,0,16,2,29,1,29,3,1,20,2,35,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:18',0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,7,0,15,1,10,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:23',0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,6,0,14,1,9,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:28',0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,4,0,13,1,9,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:33',0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,3,0,11,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:38',0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,2,0,10,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:43',0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,5,0,5,2,0,2,0,10,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,2,0,2,0,10,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:53',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,2,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:21:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,2,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,2,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,2,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,2,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,3,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,2,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,2,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:23',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,5,1,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,2,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:28',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,4,1,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,2,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:33',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,4,0,0,1,0,8,1,8,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,1,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:38',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,4,0,0,1,0,8,0,7,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,1,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:43',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,0,0,1,0,7,0,6,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,1,3,4,7,8,9);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,0,0,1,0,6,0,6,2,0,16,2,29,1,29,3,1,19,2,34,1,34,5,1,20,2,35,1,34,6,1,20,2,38,1,35,7,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:53',0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,2,0,4,1,0,1,0,6,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:22:58',0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,1,0,4,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:03',0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,3,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:08',0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:13',0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:18',0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:23',0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:28',0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:33',0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,2,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:38',0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,5,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:43',0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,1,0,5,0,6,3,0,16,2,29,1,30,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:48',0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,0,5,0,6,3,0,16,2,29,1,30,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:53',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,6,3,0,15,2,29,1,29,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:23:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,6,3,0,13,2,28,1,29,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,6,3,0,13,2,28,1,28,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,6,3,0,12,2,27,1,28,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,6,3,0,12,2,27,1,28,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,4,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,6,3,0,12,2,27,1,28,3,1,19,2,34,1,35,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,3,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:23',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,6,2,0,12,2,27,1,28,3,1,18,2,34,1,34,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,3,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:28',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,5,2,0,12,2,27,1,28,3,1,18,2,34,1,34,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,3,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:33',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,5,1,0,11,2,27,1,27,3,1,18,2,33,1,33,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:38',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,5,0,5,1,0,11,2,26,1,27,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:43',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,3,0,4,1,0,11,2,26,1,27,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,3,0,4,1,0,11,2,26,1,27,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:53',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,2,0,4,1,0,11,1,26,1,27,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:24:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,4,1,0,10,1,26,1,26,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,3,1,0,10,1,25,1,26,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,10,1,25,1,26,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,9,1,25,1,24,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,9,1,24,1,24,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,8,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:23',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,8,1,23,1,23,3,1,17,2,32,1,32,6,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,7,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:28',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,8,1,22,1,22,3,1,17,2,32,1,32,5,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,7,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:33',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,8,1,22,1,21,3,1,17,2,32,1,32,5,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,2,4,7,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:38',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,8,0,20,1,20,3,0,17,2,32,1,32,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,1,4,6,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:43',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,8,0,19,1,18,3,0,16,2,31,1,31,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,1,1,4,6,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,8,0,19,1,18,3,0,16,2,30,1,31,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,6,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:53',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,8,0,19,1,17,3,0,16,2,29,1,31,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,6,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:25:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,8,0,19,1,17,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,6,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,7,0,19,1,15,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,7,0,18,1,13,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,7,0,17,1,12,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,7,0,15,1,11,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:23',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,6,0,14,1,10,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:28',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,4,0,13,1,10,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:33',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,3,0,11,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:38',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,2,0,10,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:43',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,2,0,10,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,2,0,10,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:53',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:26:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:23',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:28',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:33',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,1,9,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:38',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,8,0,8,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:43',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,7,0,7,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,1,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,6,0,7,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:53',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,6,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:27:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:23',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:28',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:33',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:38',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,4,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,5,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:43',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,4,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:48',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,16,2,29,1,30,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,4,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:53',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,15,2,29,1,29,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,4,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:28:58',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,13,2,28,1,29,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,4,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:29:03',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,13,2,28,1,28,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,4,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:29:08',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,12,2,27,1,28,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,4,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:29:13',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,12,2,27,1,28,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,4,4,9,10);
INSERT INTO "_action_count" VALUES ('U00','2023-02-05 19:29:18',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,5,0,6,3,0,12,2,27,1,28,3,1,20,2,35,1,35,7,1,20,2,38,1,36,8,1,0,0,3,4,9,10);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 18:31:40.969','2023-02-05 18:32:25.711',44.742);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:06:02.271','2023-02-05 19:10:22.495',260.224);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:10:22.699','2023-02-05 19:10:26.122',3.423);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:10:35.464','2023-02-05 19:10:58.693',23.229);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:10:58.846','2023-02-05 19:11:02.847',4.001);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:13:40.697','2023-02-05 19:18:07.124',266.427);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:19:16.915','2023-02-05 19:19:25.799',8.884);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:19:29.829','2023-02-05 19:20:35.870',66.041);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:20:36.492','2023-02-05 19:21:14.764',38.272);
INSERT INTO "_screen_time" VALUES ('U00','2023-02-05 19:22:46.948','2023-02-05 19:23:23.659',36.711);
INSERT INTO "_sessions" VALUES ('U00','2023-02-05','2023-02-05 18:31:40.969000','2023-02-05 18:32:25.711000',44.742,NULL,18,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0.0223503643109383,44.742,44.742,NULL,44.742,44.742,44.742,0,0.0,0,0.0,3,0.0670510929328148,0,0.0,1,0.0223503643109383,1,0.0223503643109383,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,44.742,0.0,0.0,0.0,0.0,44.742,0,0.0,0.0,44.742,0.0,0,0.0,44.742,0.0,0,2,0.0447007286218765,2,4.531,0.0,0.0,0.0,0.0,0.0,0.0,0.0,5.0,0.0,0.0,35.211,0.0,0.0,0.0,0.0);
INSERT INTO "_sessions" VALUES ('U00','2023-02-05','2023-02-05 19:06:02.271000','2023-02-05 19:11:02.847000',300.576,2016.56,19,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,0.0133077823911423,290.877,72.71925,125.341512496526,260.224,3.423,13.615,4,0.0133077823911423,0,0.0,5,0.0166347279889279,0,0.0,4,0.0133077823911423,3,0.00998083679335676,0,0.0,0.754545454545455,0.426253350945091,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,300.576,0.0,0.0,0.0,0.0,300.576,0,0.0,0.0,300.576,0.0,0,0.0,300.576,0.0,0,2,0.00687575848210756,2,62.454,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,45.0);
INSERT INTO "_sessions" VALUES ('U00','2023-02-05','2023-02-05 19:13:40.697000','2023-02-05 19:18:07.124000',266.427,157.85,19,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0.00375337334429318,266.427,266.427,NULL,266.427,266.427,266.427,15,0.0563006001643977,2,0.00750674668858637,20,0.0750674668858637,0,0.0,21,0.0788208402301568,1,0.00375337334429318,1,0.00375337334429318,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,266.427,0.0,0.0,0.0,0.0,266.427,0,0.0,0.0,266.427,0.0,0,0.0,266.427,0.0,0,6,0.0225202400657591,5,136.427,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,90.0,25.0);
INSERT INTO "_sessions" VALUES ('U00','2023-02-05','2023-02-05 19:19:16.915000','2023-02-05 19:21:14.764000',117.849,69.791,19,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,0.0254563042537484,113.197,37.7323333333333,28.5823213251362,66.041,8.884,38.272,1,0.00848543475124948,0,0.0,1,0.00848543475124948,0,0.0,3,0.0254563042537484,2,0.016970869502499,0,0.0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 18:31:43','2023-02-05','2023-02-05 18:31:40.969000',2.031,NULL,18,1,3,1,0.492368291482029,2.031,2.031,NULL,2.031,2.031,2.031,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,1,0.492368291482029,0,0.0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,1.0,NULL,1.0,1.0,1.0,0,100.0,NULL,100.0,100.0,100.0,0,0.0,0.0,2.031,0.0,0.0,0.0,0.0,2.031,0,0.0,0.0,2.031,0.0,0,0.0,2.031,0.0,0,0,0.0,NULL,2.031,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 18:31:48','2023-02-05','2023-02-05 18:31:40.969000',7.031,NULL,18,1,3,1,0.142227279192149,7.031,7.031,NULL,7.031,7.031,7.031,0,0.0,0,0.0,1,0.142227279192149,0,0.0,0,0.0,1,0.142227279192149,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,7.031,0.0,0.0,0.0,0.0,7.031,0,0.0,0.0,7.031,0.0,0,0.0,7.031,0.0,0,1,0.142227279192149,1,4.531,0.0,0.0,0.0,0.0,0.0,0.0,0.0,2.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 18:31:53','2023-02-05','2023-02-05 18:31:40.969000',12.031,NULL,18,1,3,1,0.0831186102568365,12.031,12.031,NULL,12.031,12.031,12.031,0,0.0,0,0.0,3,0.24935583077051,0,0.0,0,0.0,1,0.0831186102568365,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,12.031,0.0,0.0,0.0,0.0,12.031,0,0.0,0.0,12.031,0.0,0,0.0,12.031,0.0,0,2,0.166237220513673,2,4.531,0.0,0.0,0.0,0.0,0.0,0.0,0.0,5.0,0.0,0.0,2.5,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 18:31:58','2023-02-05','2023-02-05 18:31:40.969000',17.031,NULL,18,1,3,1,0.05871645822324,17.031,17.031,NULL,17.031,17.031,17.031,0,0.0,0,0.0,3,0.17614937466972,0,0.0,1,0.05871645822324,1,0.05871645822324,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,17.031,0.0,0.0,0.0,0.0,17.031,0,0.0,0.0,17.031,0.0,0,0.0,17.031,0.0,0,2,0.11743291644648,2,4.531,0.0,0.0,0.0,0.0,0.0,0.0,0.0,5.0,0.0,0.0,7.5,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 18:32:03','2023-02-05','2023-02-05 18:31:40.969000',22.031,NULL,18,1,3,1,0.0453905859924652,22.031,22.031,NULL,22.031,22.031,22.031,0,0.0,0,0.0,3,0.136171757977396,0,0.0,1,0.0453905859924652,1,0.0453905859924652,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,22.031,0.0,0.0,0.0,0.0,22.031,0,0.0,0.0,22.031,0.0,0,0.0,22.031,0.0,0,2,0.0907811719849303,2,4.531,0.0,0.0,0.0,0.0,0.0,0.0,0.0,5.0,0.0,0.0,12.5,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:02','2023-02-05','2023-02-05 19:06:02.271000',-0.271,2016.56,19,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,1.0,NULL,1.0,1.0,1.0,0,100.0,NULL,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:07','2023-02-05','2023-02-05 19:06:02.271000',4.729,2016.56,19,1,3,1,0.211461196870374,4.729,4.729,NULL,4.729,4.729,4.729,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,1,0.211461196870374,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,0,0.0,NULL,4.729,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:12','2023-02-05','2023-02-05 19:06:02.271000',9.729,2016.56,19,1,3,1,0.102785486689279,9.729,9.729,NULL,9.729,9.729,9.729,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,1,0.102785486689279,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.102785486689279,1,7.229,0.0,0.0,2.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:17','2023-02-05','2023-02-05 19:06:02.271000',14.729,2016.56,19,1,3,1,0.0678932717767669,14.729,14.729,NULL,14.729,14.729,14.729,1,0.0678932717767669,0,0.0,1,0.0678932717767669,0,0.0,0,0.0,1,0.0678932717767669,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0678932717767669,1,7.229,0.0,0.0,7.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:22','2023-02-05','2023-02-05 19:06:02.271000',19.729,2016.56,19,1,3,1,0.0506868062243398,19.729,19.729,NULL,19.729,19.729,19.729,1,0.0506868062243398,0,0.0,1,0.0506868062243398,0,0.0,0,0.0,1,0.0506868062243398,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0506868062243398,1,7.229,0.0,0.0,12.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:27','2023-02-05','2023-02-05 19:06:02.271000',24.729,2016.56,19,1,3,1,0.0404383517327834,24.729,24.729,NULL,24.729,24.729,24.729,1,0.0404383517327834,0,0.0,1,0.0404383517327834,0,0.0,0,0.0,1,0.0404383517327834,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0404383517327834,1,7.229,0.0,0.0,17.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:32','2023-02-05','2023-02-05 19:06:02.271000',29.729,2016.56,19,1,3,1,0.0336371892764641,29.729,29.729,NULL,29.729,29.729,29.729,1,0.0336371892764641,0,0.0,1,0.0336371892764641,0,0.0,0,0.0,1,0.0336371892764641,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0336371892764641,1,7.229,0.0,0.0,22.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:37','2023-02-05','2023-02-05 19:06:02.271000',34.729,2016.56,19,1,3,1,0.0287943793371534,34.729,34.729,NULL,34.729,34.729,34.729,1,0.0287943793371534,0,0.0,1,0.0287943793371534,0,0.0,0,0.0,1,0.0287943793371534,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0287943793371534,1,7.229,0.0,0.0,27.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:42','2023-02-05','2023-02-05 19:06:02.271000',39.729,2016.56,19,1,3,1,0.0251705303430743,39.729,39.729,NULL,39.729,39.729,39.729,1,0.0251705303430743,0,0.0,1,0.0251705303430743,0,0.0,0,0.0,1,0.0251705303430743,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0251705303430743,1,7.229,0.0,0.0,32.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:47','2023-02-05','2023-02-05 19:06:02.271000',44.729,2016.56,19,1,3,1,0.0223568602025532,44.729,44.729,NULL,44.729,44.729,44.729,1,0.0223568602025532,0,0.0,1,0.0223568602025532,0,0.0,0,0.0,1,0.0223568602025532,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0223568602025532,1,7.229,0.0,0.0,37.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:52','2023-02-05','2023-02-05 19:06:02.271000',49.729,2016.56,19,1,3,1,0.0201089907297553,49.729,49.729,NULL,49.729,49.729,49.729,1,0.0201089907297553,0,0.0,1,0.0201089907297553,0,0.0,0,0.0,1,0.0201089907297553,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0201089907297553,1,7.229,0.0,0.0,42.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:06:57','2023-02-05','2023-02-05 19:06:02.271000',54.729,2016.56,19,1,3,1,0.0182718485629191,54.729,54.729,NULL,54.729,54.729,54.729,1,0.0182718485629191,0,0.0,1,0.0182718485629191,0,0.0,0,0.0,1,0.0182718485629191,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0182718485629191,1,7.229,0.0,0.0,47.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:02','2023-02-05','2023-02-05 19:06:02.271000',59.729,2016.56,19,1,3,1,0.0167422859917293,59.729,59.729,NULL,59.729,59.729,59.729,1,0.0167422859917293,0,0.0,1,0.0167422859917293,0,0.0,0,0.0,1,0.0167422859917293,0,0.0,0.0192307692307692,0.0693375245281536,0.25,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0167422859917293,1,7.229,0.0,0.0,52.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:07','2023-02-05','2023-02-05 19:06:02.271000',64.729,2016.56,19,1,3,1,0.0154490259389146,64.729,64.729,NULL,64.729,64.729,64.729,1,0.0154490259389146,0,0.0,1,0.0154490259389146,0,0.0,0,0.0,1,0.0154490259389146,0,0.0,0.0357142857142857,0.0907841299003204,0.25,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0154490259389146,1,7.229,0.0,0.0,57.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:12','2023-02-05','2023-02-05 19:06:02.271000',69.729,2016.56,19,1,3,1,0.0143412353540134,69.729,69.729,NULL,69.729,69.729,69.729,1,0.0143412353540134,0,0.0,1,0.0143412353540134,0,0.0,0,0.0,1,0.0143412353540134,0,0.0,0.1,0.263899331455874,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0143412353540134,1,7.229,0.0,0.0,62.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:17','2023-02-05','2023-02-05 19:06:02.271000',74.729,2016.56,19,1,3,1,0.0133816858247802,74.729,74.729,NULL,74.729,74.729,74.729,1,0.0133816858247802,0,0.0,1,0.0133816858247802,0,0.0,0,0.0,1,0.0133816858247802,0,0.0,0.15625,0.340036762718386,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0133816858247802,1,7.229,0.0,0.0,67.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:22','2023-02-05','2023-02-05 19:06:02.271000',79.729,2016.56,19,1,3,1,0.0125424876770059,79.729,79.729,NULL,79.729,79.729,79.729,1,0.0125424876770059,0,0.0,1,0.0125424876770059,0,0.0,0,0.0,1,0.0125424876770059,0,0.0,0.205882352941176,0.387654143914544,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0125424876770059,1,7.229,0.0,0.0,72.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:27','2023-02-05','2023-02-05 19:06:02.271000',84.729,2016.56,19,1,3,1,0.0118023345017644,84.729,84.729,NULL,84.729,84.729,84.729,1,0.0118023345017644,0,0.0,1,0.0118023345017644,0,0.0,0,0.0,1,0.0118023345017644,0,0.0,0.25,0.420084025208403,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0118023345017644,1,7.229,0.0,0.0,77.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:32','2023-02-05','2023-02-05 19:06:02.271000',89.729,2016.56,19,1,3,1,0.0111446689476089,89.729,89.729,NULL,89.729,89.729,89.729,1,0.0111446689476089,0,0.0,1,0.0111446689476089,0,0.0,0,0.0,1,0.0111446689476089,0,0.0,0.289473684210526,0.443025879407243,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0111446689476089,1,7.229,0.0,0.0,82.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:37','2023-02-05','2023-02-05 19:06:02.271000',94.729,2016.56,19,1,3,1,0.010556429393322,94.729,94.729,NULL,94.729,94.729,94.729,1,0.010556429393322,0,0.0,1,0.010556429393322,0,0.0,0,0.0,1,0.010556429393322,0,0.0,0.325,0.459547832685909,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.010556429393322,1,7.229,0.0,0.0,87.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:42','2023-02-05','2023-02-05 19:06:02.271000',99.729,2016.56,19,1,3,1,0.0100271736405659,99.729,99.729,NULL,99.729,99.729,99.729,1,0.0100271736405659,0,0.0,1,0.0100271736405659,0,0.0,0,0.0,1,0.0100271736405659,0,0.0,0.357142857142857,0.471509733273268,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0100271736405659,1,7.229,0.0,0.0,92.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:47','2023-02-05','2023-02-05 19:06:02.271000',104.729,2016.56,19,1,3,1,0.00954845362793496,104.729,104.729,NULL,104.729,104.729,104.729,1,0.00954845362793496,0,0.0,1,0.00954845362793496,0,0.0,0,0.0,1,0.00954845362793496,0,0.0,0.386363636363636,0.480124442743213,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00954845362793496,1,7.229,0.0,0.0,97.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:52','2023-02-05','2023-02-05 19:06:02.271000',109.729,2016.56,19,1,3,1,0.00911336109870681,109.729,109.729,NULL,109.729,109.729,109.729,1,0.00911336109870681,0,0.0,1,0.00911336109870681,0,0.0,0,0.0,1,0.00911336109870681,0,0.0,0.41304347826087,0.486223244485762,1.0,0.0,0.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00911336109870681,1,7.229,0.0,0.0,102.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:07:57','2023-02-05','2023-02-05 19:06:02.271000',114.729,2016.56,19,1,3,1,0.00871619207000845,114.729,114.729,NULL,114.729,114.729,114.729,1,0.00871619207000845,0,0.0,1,0.00871619207000845,0,0.0,0,0.0,1,0.00871619207000845,0,0.0,0.4375,0.490396911118721,1.0,0.0,0.125,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00871619207000845,1,7.229,0.0,0.0,107.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:02','2023-02-05','2023-02-05 19:06:02.271000',119.729,2016.56,19,1,3,1,0.0083521953745542,119.729,119.729,NULL,119.729,119.729,119.729,1,0.0083521953745542,0,0.0,1,0.0083521953745542,0,0.0,0,0.0,1,0.0083521953745542,0,0.0,0.46,0.493077073082901,1.0,0.0,0.25,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.0083521953745542,1,7.229,0.0,0.0,112.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:07','2023-02-05','2023-02-05 19:06:02.271000',124.729,2016.56,19,1,3,1,0.00801738168348981,124.729,124.729,NULL,124.729,124.729,124.729,1,0.00801738168348981,0,0.0,1,0.00801738168348981,0,0.0,0,0.0,1,0.00801738168348981,0,0.0,0.480769230769231,0.494586074020877,1.0,0.0,0.25,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00801738168348981,1,7.229,0.0,0.0,117.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:12','2023-02-05','2023-02-05 19:06:02.271000',129.729,2016.56,19,1,3,1,0.00770837669295223,129.729,129.729,NULL,129.729,129.729,129.729,1,0.00770837669295223,0,0.0,1,0.00770837669295223,0,0.0,0,0.0,1,0.00770837669295223,0,0.0,0.5,0.495168968830144,1.0,0.0,0.25,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00770837669295223,1,7.229,0.0,0.0,122.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:17','2023-02-05','2023-02-05 19:06:02.271000',134.729,2016.56,19,1,3,1,0.00742230700146219,134.729,134.729,NULL,134.729,134.729,134.729,1,0.00742230700146219,0,0.0,1,0.00742230700146219,0,0.0,0,0.0,1,0.00742230700146219,0,0.0,0.517857142857143,0.495014830625995,1.0,0.0,0.625,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00742230700146219,1,7.229,0.0,0.0,127.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:22','2023-02-05','2023-02-05 19:06:02.271000',139.729,2016.56,19,1,3,1,0.00715671048959056,139.729,139.729,NULL,139.729,139.729,139.729,1,0.00715671048959056,0,0.0,1,0.00715671048959056,0,0.0,0,0.0,1,0.00715671048959056,0,0.0,0.53448275862069,0.494271369990331,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00715671048959056,1,7.229,0.0,0.0,132.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:27','2023-02-05','2023-02-05 19:06:02.271000',144.729,2016.56,19,1,3,1,0.00690946527648225,144.729,144.729,NULL,144.729,144.729,144.729,1,0.00690946527648225,0,0.0,1,0.00690946527648225,0,0.0,0,0.0,1,0.00690946527648225,0,0.0,0.55,0.493055218282762,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00690946527648225,1,7.229,0.0,0.0,137.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:32','2023-02-05','2023-02-05 19:06:02.271000',149.729,2016.56,19,1,3,1,0.00667873291079216,149.729,149.729,NULL,149.729,149.729,149.729,1,0.00667873291079216,0,0.0,1,0.00667873291079216,0,0.0,0,0.0,1,0.00667873291079216,0,0.0,0.564516129032258,0.49145931476015,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00667873291079216,1,7.229,0.0,0.0,142.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:37','2023-02-05','2023-02-05 19:06:02.271000',154.729,2016.56,19,1,3,1,0.00646291257618158,154.729,154.729,NULL,154.729,154.729,154.729,1,0.00646291257618158,0,0.0,1,0.00646291257618158,0,0.0,0,0.0,1,0.00646291257618158,0,0.0,0.578125,0.489558309815774,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00646291257618158,1,7.229,0.0,0.0,147.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:42','2023-02-05','2023-02-05 19:06:02.271000',159.729,2016.56,19,1,3,1,0.00626060389785199,159.729,159.729,NULL,159.729,159.729,159.729,1,0.00626060389785199,0,0.0,1,0.00626060389785199,0,0.0,0,0.0,1,0.00626060389785199,0,0.0,0.590909090909091,0.487412579574299,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00626060389785199,1,7.229,0.0,0.0,152.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:47','2023-02-05','2023-02-05 19:06:02.271000',164.729,2016.56,19,1,3,1,0.00607057652265236,164.729,164.729,NULL,164.729,164.729,164.729,1,0.00607057652265236,0,0.0,1,0.00607057652265236,0,0.0,0,0.0,1,0.00607057652265236,0,0.0,0.602941176470588,0.485071250072666,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00607057652265236,1,7.229,0.0,0.0,157.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:52','2023-02-05','2023-02-05 19:06:02.271000',169.729,2016.56,19,1,3,1,0.00589174507597405,169.729,169.729,NULL,169.729,169.729,169.729,1,0.00589174507597405,0,0.0,1,0.00589174507597405,0,0.0,0,0.0,1,0.00589174507597405,0,0.0,0.614285714285714,0.482574503326175,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00589174507597405,1,7.229,0.0,0.0,162.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:08:57','2023-02-05','2023-02-05 19:06:02.271000',174.729,2016.56,19,1,3,1,0.00572314841840793,174.729,174.729,NULL,174.729,174.729,174.729,1,0.00572314841840793,0,0.0,1,0.00572314841840793,0,0.0,0,0.0,1,0.00572314841840793,0,0.0,0.625,0.479955355066638,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00572314841840793,1,7.229,0.0,0.0,167.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:02','2023-02-05','2023-02-05 19:06:02.271000',179.729,2016.56,19,1,3,1,0.00556393236483817,179.729,179.729,NULL,179.729,179.729,179.729,1,0.00556393236483817,0,0.0,1,0.00556393236483817,0,0.0,0,0.0,1,0.00556393236483817,0,0.0,0.635135135135135,0.477241038689056,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00556393236483817,1,7.229,0.0,0.0,172.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:07','2023-02-05','2023-02-05 19:06:02.271000',184.729,2016.56,19,1,3,1,0.00541333520995621,184.729,184.729,NULL,184.729,184.729,184.729,1,0.00541333520995621,0,0.0,1,0.00541333520995621,0,0.0,0,0.0,1,0.00541333520995621,0,0.0,0.644736842105263,0.474454092229165,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00541333520995621,1,7.229,0.0,0.0,177.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:12','2023-02-05','2023-02-05 19:06:02.271000',189.729,2016.56,19,1,3,1,0.00527067554248428,189.729,189.729,NULL,189.729,189.729,189.729,1,0.00527067554248428,0,0.0,1,0.00527067554248428,0,0.0,0,0.0,1,0.00527067554248428,0,0.0,0.653846153846154,0.471613219004812,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00527067554248428,1,9.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:17','2023-02-05','2023-02-05 19:06:02.271000',194.729,2016.56,19,1,3,1,0.00513534193674286,194.729,194.729,NULL,194.729,194.729,194.729,1,0.00513534193674286,0,0.0,1,0.00513534193674286,0,0.0,0,0.0,1,0.00513534193674286,0,0.0,0.6625,0.468733974085022,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00513534193674286,1,14.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:22','2023-02-05','2023-02-05 19:06:02.271000',199.729,2016.56,19,1,3,1,0.00500678419258095,199.729,199.729,NULL,199.729,199.729,199.729,2,0.0100135683851619,0,0.0,1,0.00500678419258095,0,0.0,1,0.00500678419258095,1,0.00500678419258095,0,0.0,0.670731707317073,0.465829315543271,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00500678419258095,1,19.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:27','2023-02-05','2023-02-05 19:06:02.271000',204.729,2016.56,19,1,3,1,0.00488450585896478,204.729,204.729,NULL,204.729,204.729,204.729,2,0.00976901171792956,0,0.0,1,0.00488450585896478,0,0.0,1,0.00488450585896478,1,0.00488450585896478,0,0.0,0.678571428571429,0.462910049886276,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00488450585896478,1,24.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:32','2023-02-05','2023-02-05 19:06:02.271000',209.729,2016.56,19,1,3,1,0.00476805782700533,209.729,209.729,NULL,209.729,209.729,209.729,2,0.00953611565401065,0,0.0,2,0.00953611565401065,0,0.0,2,0.00953611565401065,1,0.00476805782700533,0,0.0,0.686046511627907,0.459985194041658,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,1,0.00476805782700533,1,29.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:37','2023-02-05','2023-02-05 19:06:02.271000',214.729,2016.56,19,1,3,1,0.00465703281811027,214.729,214.729,NULL,214.729,214.729,214.729,3,0.0139710984543308,0,0.0,3,0.0139710984543308,0,0.0,3,0.0139710984543308,1,0.00465703281811027,0,0.0,0.693181818181818,0.457062271098516,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00931406563622054,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,2.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:42','2023-02-05','2023-02-05 19:06:02.271000',219.729,2016.56,19,1,3,1,0.00455106062467858,219.729,219.729,NULL,219.729,219.729,219.729,3,0.0136531818740357,0,0.0,3,0.0136531818740357,0,0.0,3,0.0136531818740357,1,0.00455106062467858,0,0.0,0.7,0.454147553114624,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00910212124935716,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,7.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:47','2023-02-05','2023-02-05 19:06:02.271000',224.729,2016.56,19,1,3,1,0.00444980398613441,224.729,224.729,NULL,224.729,224.729,224.729,3,0.0133494119584032,0,0.0,3,0.0133494119584032,0,0.0,3,0.0133494119584032,1,0.00444980398613441,0,0.0,0.706521739130435,0.451246261375978,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00889960797226882,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,12.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:52','2023-02-05','2023-02-05 19:06:02.271000',229.729,2016.56,19,1,3,1,0.00435295500350413,229.729,229.729,NULL,229.729,229.729,229.729,3,0.0130588650105124,0,0.0,3,0.0130588650105124,0,0.0,3,0.0130588650105124,1,0.00435295500350413,0,0.0,0.712765957446808,0.448362732266495,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00870591000700826,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,17.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:09:57','2023-02-05','2023-02-05 19:06:02.271000',234.729,2016.56,19,1,3,1,0.00426023201223539,234.729,234.729,NULL,234.729,234.729,234.729,3,0.0127806960367062,0,0.0,3,0.0127806960367062,0,0.0,3,0.0127806960367062,1,0.00426023201223539,0,0.0,0.71875,0.445500555197018,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00852046402447077,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,22.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:10:02','2023-02-05','2023-02-05 19:06:02.271000',239.729,2016.56,19,1,3,1,0.00417137684635568,239.729,239.729,NULL,239.729,239.729,239.729,3,0.012514130539067,0,0.0,3,0.012514130539067,0,0.0,3,0.012514130539067,1,0.00417137684635568,0,0.0,0.724489795918367,0.442662687722876,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00834275369271135,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,27.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:10:07','2023-02-05','2023-02-05 19:06:02.271000',244.729,2016.56,19,1,3,1,0.00408615243800285,244.729,244.729,NULL,244.729,244.729,244.729,3,0.0122584573140086,0,0.0,3,0.0122584573140086,0,0.0,3,0.0122584573140086,1,0.00408615243800285,0,0.0,0.73,0.43985155195259,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.0081723048760057,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,32.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:10:12','2023-02-05','2023-02-05 19:06:02.271000',249.729,2016.56,19,1,3,1,0.00400434070532457,249.729,249.729,NULL,249.729,249.729,249.729,3,0.0120130221159737,0,0.0,3,0.0120130221159737,0,0.0,3,0.0120130221159737,1,0.00400434070532457,0,0.0,0.735294117647059,0.437069115546621,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00800868141064914,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,37.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:10:17','2023-02-05','2023-02-05 19:06:02.271000',254.729,2016.56,19,1,3,1,0.00392574068912452,254.729,254.729,NULL,254.729,254.729,254.729,3,0.0117772220673736,0,0.0,3,0.0117772220673736,0,0.0,3,0.0117772220673736,1,0.00392574068912452,0,0.0,0.740384615384615,0.434316959972158,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00785148137824904,2,32.229,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,42.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:10:22','2023-02-05','2023-02-05 19:06:02.271000',259.729,2016.56,19,1,3,1,0.00385016690473532,259.729,259.729,NULL,259.729,259.729,259.729,3,0.011550500714206,0,0.0,3,0.011550500714206,0,0.0,3,0.011550500714206,1,0.00385016690473532,0,0.0,0.745283018867924,0.431596338178596,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00770033380947064,2,34.729,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,45.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:10:39','2023-02-05','2023-02-05 19:06:02.271000',276.729,2016.56,19,1,3,3,0.0108409310191559,267.183,89.061,148.231516955741,260.224,3.423,3.536,3,0.0108409310191559,0,0.0,3,0.0108409310191559,0,0.0,3,0.0108409310191559,3,0.0108409310191559,0,0.0,0.75,0.428908223459219,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,NULL,0.0,0.0,0.0,0.0,NULL,0,0.0,0.0,NULL,0.0,0,0.0,NULL,0.0,0,2,0.00748550618864224,2,38.76,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,45.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:10:59','2023-02-05','2023-02-05 19:06:02.271000',296.729,2016.56,19,1,3,4,0.0134803136868995,287.03,71.7575,126.057264813787,260.224,0.154,13.326,4,0.0134803136868995,0,0.0,5,0.0168503921086244,0,0.0,4,0.0134803136868995,3,0.0101102352651746,0,0.0,0.754545454545455,0.426253350945091,1.0,0.0,1.0,1,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,296.729,0.0,0.0,0.0,0.0,296.729,0,0.0,0.0,296.729,0.0,0,0.0,296.729,0.0,0,2,0.00696791276173222,2,58.607,0.0,0.0,180.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,45.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:13:43','2023-02-05','2023-02-05 19:13:40.697000',2.303,157.85,19,1,3,1,0.434216239687364,2.303,2.303,NULL,2.303,2.303,2.303,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,1,0.434216239687364,0,0.0,1.0,NULL,1.0,1.0,1.0,0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,0.0,NULL,0.0,0.0,0.0,0,1.0,NULL,1.0,1.0,1.0,0,100.0,NULL,100.0,100.0,100.0,0,0.0,0.0,2.303,0.0,0.0,0.0,0.0,2.303,0,0.0,0.0,2.303,0.0,0,0.0,2.303,0.0,0,0,0.0,NULL,2.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:13:48','2023-02-05','2023-02-05 19:13:40.697000',7.303,157.85,19,1,3,1,0.136930028755306,7.303,7.303,NULL,7.303,7.303,7.303,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,1,0.136930028755306,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,7.303,0.0,0.0,0.0,0.0,7.303,0,0.0,0.0,7.303,0.0,0,0.0,7.303,0.0,0,0,0.0,NULL,7.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:13:53','2023-02-05','2023-02-05 19:13:40.697000',12.303,157.85,19,1,3,1,0.0812809883768187,12.303,12.303,NULL,12.303,12.303,12.303,1,0.0812809883768187,0,0.0,0,0.0,0,0.0,1,0.0812809883768187,1,0.0812809883768187,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,12.303,0.0,0.0,0.0,0.0,12.303,0,0.0,0.0,12.303,0.0,0,0.0,12.303,0.0,0,0,0.0,NULL,12.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:13:58','2023-02-05','2023-02-05 19:13:40.697000',17.303,157.85,19,1,3,1,0.0577934462231983,17.303,17.303,NULL,17.303,17.303,17.303,3,0.173380338669595,0,0.0,1,0.0577934462231983,0,0.0,1,0.0577934462231983,1,0.0577934462231983,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,17.303,0.0,0.0,0.0,0.0,17.303,0,0.0,0.0,17.303,0.0,0,0.0,17.303,0.0,0,0,0.0,NULL,17.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:03','2023-02-05','2023-02-05 19:13:40.697000',22.303,157.85,19,1,3,1,0.0448370174415998,22.303,22.303,NULL,22.303,22.303,22.303,3,0.134511052324799,0,0.0,1,0.0448370174415998,0,0.0,2,0.0896740348831996,1,0.0448370174415998,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,22.303,0.0,0.0,0.0,0.0,22.303,0,0.0,0.0,22.303,0.0,0,0.0,22.303,0.0,0,0,0.0,NULL,22.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:08','2023-02-05','2023-02-05 19:13:40.697000',27.303,157.85,19,1,3,1,0.0366260117935758,27.303,27.303,NULL,27.303,27.303,27.303,4,0.146504047174303,0,0.0,2,0.0732520235871516,0,0.0,2,0.0732520235871516,1,0.0366260117935758,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,27.303,0.0,0.0,0.0,0.0,27.303,0,0.0,0.0,27.303,0.0,0,0.0,27.303,0.0,0,1,0.0366260117935758,1,24.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,2.5,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:13','2023-02-05','2023-02-05 19:13:40.697000',32.303,157.85,19,1,3,1,0.0309568770702412,32.303,32.303,NULL,32.303,32.303,32.303,4,0.123827508280965,0,0.0,2,0.0619137541404823,0,0.0,2,0.0619137541404823,1,0.0309568770702412,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,32.303,0.0,0.0,0.0,0.0,32.303,0,0.0,0.0,32.303,0.0,0,0.0,32.303,0.0,0,1,0.0309568770702412,1,24.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,7.5,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:18','2023-02-05','2023-02-05 19:13:40.697000',37.303,157.85,19,1,3,1,0.026807495375707,37.303,37.303,NULL,37.303,37.303,37.303,4,0.107229981502828,0,0.0,2,0.0536149907514141,0,0.0,2,0.0536149907514141,1,0.026807495375707,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,37.303,0.0,0.0,0.0,0.0,37.303,0,0.0,0.0,37.303,0.0,0,0.0,37.303,0.0,0,1,0.026807495375707,1,24.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,12.5,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:23','2023-02-05','2023-02-05 19:13:40.697000',42.303,157.85,19,1,3,1,0.023638985414746,42.303,42.303,NULL,42.303,42.303,42.303,4,0.094555941658984,0,0.0,2,0.047277970829492,0,0.0,2,0.047277970829492,1,0.023638985414746,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,42.303,0.0,0.0,0.0,0.0,42.303,0,0.0,0.0,42.303,0.0,0,0.0,42.303,0.0,0,1,0.023638985414746,1,27.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:33','2023-02-05','2023-02-05 19:13:40.697000',52.303,157.85,19,1,3,1,0.0191193621780777,52.303,52.303,NULL,52.303,52.303,52.303,5,0.0955968108903887,0,0.0,2,0.0382387243561555,0,0.0,3,0.0573580865342332,1,0.0191193621780777,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,52.303,0.0,0.0,0.0,0.0,52.303,0,0.0,0.0,52.303,0.0,0,0.0,52.303,0.0,0,1,0.0191193621780777,1,37.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,0.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:38','2023-02-05','2023-02-05 19:13:40.697000',57.303,157.85,19,1,3,1,0.0174510933109959,57.303,57.303,NULL,57.303,57.303,57.303,5,0.0872554665549797,0,0.0,3,0.0523532799329878,0,0.0,3,0.0523532799329878,1,0.0174510933109959,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,57.303,0.0,0.0,0.0,0.0,57.303,0,0.0,0.0,57.303,0.0,0,0.0,57.303,0.0,0,2,0.0349021866219919,2,39.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,2.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:43','2023-02-05','2023-02-05 19:13:40.697000',62.303,157.85,19,1,3,1,0.0160505914642955,62.303,62.303,NULL,62.303,62.303,62.303,5,0.0802529573214773,0,0.0,3,0.0481517743928864,0,0.0,3,0.0481517743928864,1,0.0160505914642955,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,62.303,0.0,0.0,0.0,0.0,62.303,0,0.0,0.0,62.303,0.0,0,0.0,62.303,0.0,0,3,0.0481517743928864,3,39.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,7.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:48','2023-02-05','2023-02-05 19:13:40.697000',67.303,157.85,19,1,3,1,0.0148581786844569,67.303,67.303,NULL,67.303,67.303,67.303,5,0.0742908934222843,0,0.0,3,0.0445745360533706,0,0.0,3,0.0445745360533706,1,0.0148581786844569,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,67.303,0.0,0.0,0.0,0.0,67.303,0,0.0,0.0,67.303,0.0,0,0.0,67.303,0.0,0,3,0.0445745360533706,3,39.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,12.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:53','2023-02-05','2023-02-05 19:13:40.697000',72.303,157.85,19,1,3,1,0.0138306847572023,72.303,72.303,NULL,72.303,72.303,72.303,5,0.0691534237860117,1,0.0138306847572023,3,0.041492054271607,0,0.0,3,0.041492054271607,1,0.0138306847572023,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,72.303,0.0,0.0,0.0,0.0,72.303,0,0.0,0.0,72.303,0.0,0,0.0,72.303,0.0,0,3,0.041492054271607,3,42.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,15.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:14:58','2023-02-05','2023-02-05 19:13:40.697000',77.303,157.85,19,1,3,1,0.012936108559823,77.303,77.303,NULL,77.303,77.303,77.303,6,0.0776166513589382,1,0.012936108559823,3,0.0388083256794691,0,0.0,4,0.0517444342392921,1,0.012936108559823,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,77.303,0.0,0.0,0.0,0.0,77.303,0,0.0,0.0,77.303,0.0,0,0.0,77.303,0.0,0,3,0.0388083256794691,3,47.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,15.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:03','2023-02-05','2023-02-05 19:13:40.697000',82.303,157.85,19,1,3,1,0.0121502253866809,82.303,82.303,NULL,82.303,82.303,82.303,6,0.0729013523200855,1,0.0121502253866809,4,0.0486009015467237,0,0.0,4,0.0486009015467237,1,0.0121502253866809,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,82.303,0.0,0.0,0.0,0.0,82.303,0,0.0,0.0,82.303,0.0,0,0.0,82.303,0.0,0,4,0.0486009015467237,3,49.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,17.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:08','2023-02-05','2023-02-05 19:13:40.697000',87.303,157.85,19,1,3,1,0.0114543601021729,87.303,87.303,NULL,87.303,87.303,87.303,6,0.0687261606130374,1,0.0114543601021729,4,0.0458174404086916,0,0.0,4,0.0458174404086916,1,0.0114543601021729,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,87.303,0.0,0.0,0.0,0.0,87.303,0,0.0,0.0,87.303,0.0,0,0.0,87.303,0.0,0,5,0.0572718005108645,4,49.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,22.5);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:13','2023-02-05','2023-02-05 19:13:40.697000',92.303,157.85,19,1,3,1,0.0108338840557728,92.303,92.303,NULL,92.303,92.303,92.303,7,0.0758371883904098,1,0.0108338840557728,4,0.0433355362230913,0,0.0,6,0.065003304334637,1,0.0108338840557728,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,92.303,0.0,0.0,0.0,0.0,92.303,0,0.0,0.0,92.303,0.0,0,0.0,92.303,0.0,0,5,0.0541694202788642,4,52.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,0.0,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:18','2023-02-05','2023-02-05 19:13:40.697000',97.303,157.85,19,1,3,1,0.0102771754211073,97.303,97.303,NULL,97.303,97.303,97.303,7,0.0719402279477508,1,0.0102771754211073,5,0.0513858771055363,0,0.0,6,0.0616630525266436,1,0.0102771754211073,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,97.303,0.0,0.0,0.0,0.0,97.303,0,0.0,0.0,97.303,0.0,0,0.0,97.303,0.0,0,6,0.0616630525266436,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,2.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:23','2023-02-05','2023-02-05 19:13:40.697000',102.303,157.85,19,1,3,1,0.00977488441199183,102.303,102.303,NULL,102.303,102.303,102.303,8,0.0781990752959346,1,0.00977488441199183,6,0.058649306471951,0,0.0,7,0.0684241908839428,1,0.00977488441199183,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,102.303,0.0,0.0,0.0,0.0,102.303,0,0.0,0.0,102.303,0.0,0,0.0,102.303,0.0,0,6,0.058649306471951,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,7.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:28','2023-02-05','2023-02-05 19:13:40.697000',107.303,157.85,19,1,3,1,0.00931940393092458,107.303,107.303,NULL,107.303,107.303,107.303,8,0.0745552314473966,1,0.00931940393092458,7,0.065235827516472,0,0.0,8,0.0745552314473966,1,0.00931940393092458,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,107.303,0.0,0.0,0.0,0.0,107.303,0,0.0,0.0,107.303,0.0,0,0.0,107.303,0.0,0,6,0.0559164235855475,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,12.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:33','2023-02-05','2023-02-05 19:13:40.697000',112.303,157.85,19,1,3,1,0.00890448162560217,112.303,112.303,NULL,112.303,112.303,112.303,8,0.0712358530048173,1,0.00890448162560217,7,0.0623313713792152,0,0.0,9,0.0801403346304195,1,0.00890448162560217,0,0.0,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,112.303,0.0,0.0,0.0,0.0,112.303,0,0.0,0.0,112.303,0.0,0,0.0,112.303,0.0,0,6,0.053426889753613,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,17.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:38','2023-02-05','2023-02-05 19:13:40.697000',117.303,157.85,19,1,3,1,0.00852493116118087,117.303,117.303,NULL,117.303,117.303,117.303,8,0.068199449289447,2,0.0170498623223617,9,0.0767243804506279,0,0.0,10,0.0852493116118087,1,0.00852493116118087,1,0.00852493116118087,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,117.303,0.0,0.0,0.0,0.0,117.303,0,0.0,0.0,117.303,0.0,0,0.0,117.303,0.0,0,6,0.0511495869670852,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,22.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:43','2023-02-05','2023-02-05 19:13:40.697000',122.303,157.85,19,1,3,1,0.00817641431526618,122.303,122.303,NULL,122.303,122.303,122.303,8,0.0654113145221295,2,0.0163528286305324,10,0.0817641431526618,0,0.0,12,0.0981169717831942,1,0.00817641431526618,1,0.00817641431526618,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,122.303,0.0,0.0,0.0,0.0,122.303,0,0.0,0.0,122.303,0.0,0,0.0,122.303,0.0,0,6,0.0490584858915971,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,27.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:48','2023-02-05','2023-02-05 19:13:40.697000',127.303,157.85,19,1,3,1,0.007855274424012,127.303,127.303,NULL,127.303,127.303,127.303,8,0.062842195392096,2,0.015710548848024,10,0.07855274424012,0,0.0,12,0.094263293088144,1,0.007855274424012,1,0.007855274424012,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,127.303,0.0,0.0,0.0,0.0,127.303,0,0.0,0.0,127.303,0.0,0,0.0,127.303,0.0,0,6,0.047131646544072,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,32.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:53','2023-02-05','2023-02-05 19:13:40.697000',132.303,157.85,19,1,3,1,0.00755840759468795,132.303,132.303,NULL,132.303,132.303,132.303,8,0.0604672607575036,2,0.0151168151893759,10,0.0755840759468795,0,0.0,13,0.0982592987309434,1,0.00755840759468795,1,0.00755840759468795,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,132.303,0.0,0.0,0.0,0.0,132.303,0,0.0,0.0,132.303,0.0,0,0.0,132.303,0.0,0,6,0.0453504455681277,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,37.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:15:58','2023-02-05','2023-02-05 19:13:40.697000',137.303,157.85,19,1,3,1,0.00728316205763894,137.303,137.303,NULL,137.303,137.303,137.303,8,0.0582652964611116,2,0.0145663241152779,10,0.0728316205763894,0,0.0,13,0.0946811067493063,1,0.00728316205763894,1,0.00728316205763894,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,137.303,0.0,0.0,0.0,0.0,137.303,0,0.0,0.0,137.303,0.0,0,0.0,137.303,0.0,0,6,0.0436989723458337,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,42.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:03','2023-02-05','2023-02-05 19:13:40.697000',142.303,157.85,19,1,3,1,0.00702725873663942,142.303,142.303,NULL,142.303,142.303,142.303,9,0.0632453286297548,2,0.0140545174732788,10,0.0702725873663942,0,0.0,15,0.105408881049591,1,0.00702725873663942,1,0.00702725873663942,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,142.303,0.0,0.0,0.0,0.0,142.303,0,0.0,0.0,142.303,0.0,0,0.0,142.303,0.0,0,6,0.0421635524198365,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,47.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:08','2023-02-05','2023-02-05 19:13:40.697000',147.303,157.85,19,1,3,1,0.00678872799603538,147.303,147.303,NULL,147.303,147.303,147.303,9,0.0610985519643184,2,0.0135774559920708,11,0.0746760079563892,0,0.0,17,0.115408375932602,1,0.00678872799603538,1,0.00678872799603538,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,147.303,0.0,0.0,0.0,0.0,147.303,0,0.0,0.0,147.303,0.0,0,0.0,147.303,0.0,0,6,0.0407323679762123,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,52.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:13','2023-02-05','2023-02-05 19:13:40.697000',152.303,157.85,19,1,3,1,0.0065658588471665,152.303,152.303,NULL,152.303,152.303,152.303,9,0.0590927296244985,2,0.013131717694333,12,0.078790306165998,0,0.0,18,0.118185459248997,1,0.0065658588471665,1,0.0065658588471665,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,152.303,0.0,0.0,0.0,0.0,152.303,0,0.0,0.0,152.303,0.0,0,0.0,152.303,0.0,0,6,0.039395153082999,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,57.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:18','2023-02-05','2023-02-05 19:13:40.697000',157.303,157.85,19,1,3,1,0.00635715784187206,157.303,157.303,NULL,157.303,157.303,157.303,9,0.0572144205768485,2,0.0127143156837441,14,0.0890002097862088,0,0.0,19,0.120785998995569,1,0.00635715784187206,1,0.00635715784187206,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,157.303,0.0,0.0,0.0,0.0,157.303,0,0.0,0.0,157.303,0.0,0,0.0,157.303,0.0,0,6,0.0381429470512323,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,62.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:23','2023-02-05','2023-02-05 19:13:40.697000',162.303,157.85,19,1,3,1,0.00616131556409925,162.303,162.303,NULL,162.303,162.303,162.303,10,0.0616131556409925,2,0.0123226311281985,15,0.0924197334614887,0,0.0,20,0.123226311281985,1,0.00616131556409925,1,0.00616131556409925,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,162.303,0.0,0.0,0.0,0.0,162.303,0,0.0,0.0,162.303,0.0,0,0.0,162.303,0.0,0,6,0.0369678933845955,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,67.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:28','2023-02-05','2023-02-05 19:13:40.697000',167.303,157.85,19,1,3,1,0.00597717913008135,167.303,167.303,NULL,167.303,167.303,167.303,12,0.0717261495609762,2,0.0119543582601627,16,0.0956348660813016,0,0.0,20,0.119543582601627,1,0.00597717913008135,1,0.00597717913008135,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,167.303,0.0,0.0,0.0,0.0,167.303,0,0.0,0.0,167.303,0.0,0,0.0,167.303,0.0,0,6,0.0358630747804881,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,72.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:33','2023-02-05','2023-02-05 19:13:40.697000',172.303,157.85,19,1,3,1,0.00580372947656164,172.303,172.303,NULL,172.303,172.303,172.303,13,0.0754484831953013,2,0.0116074589531233,18,0.104467130578109,0,0.0,21,0.121878319007794,1,0.00580372947656164,1,0.00580372947656164,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,172.303,0.0,0.0,0.0,0.0,172.303,0,0.0,0.0,172.303,0.0,0,0.0,172.303,0.0,0,6,0.0348223768593698,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,77.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:38','2023-02-05','2023-02-05 19:13:40.697000',177.303,157.85,19,1,3,1,0.00564006249189241,177.303,177.303,NULL,177.303,177.303,177.303,14,0.0789608748864937,2,0.0112801249837848,19,0.107161187345956,0,0.0,21,0.118441312329741,1,0.00564006249189241,1,0.00564006249189241,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,177.303,0.0,0.0,0.0,0.0,177.303,0,0.0,0.0,177.303,0.0,0,0.0,177.303,0.0,0,6,0.0338403749513545,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,82.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:43','2023-02-05','2023-02-05 19:13:40.697000',182.303,157.85,19,1,3,1,0.00548537325222295,182.303,182.303,NULL,182.303,182.303,182.303,14,0.0767952255311213,2,0.0109707465044459,19,0.104222091792236,0,0.0,21,0.115192838296682,1,0.00548537325222295,1,0.00548537325222295,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,182.303,0.0,0.0,0.0,0.0,182.303,0,0.0,0.0,182.303,0.0,0,0.0,182.303,0.0,0,6,0.0329122395133377,5,54.803,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,87.5,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:16:48','2023-02-05','2023-02-05 19:13:40.697000',187.303,157.85,19,1,3,1,0.0053389427825502,187.303,187.303,NULL,187.303,187.303,187.303,14,0.0747451989557028,2,0.0106778855651004,19,0.101439912868454,0,0.0,21,0.112117798433554,1,0.0053389427825502,1,0.0053389427825502,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,187.303,0.0,0.0,0.0,0.0,187.303,0,0.0,0.0,187.303,0.0,0,0.0,187.303,0.0,0,6,0.0320336566953012,5,57.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,90.0,25.0);
INSERT INTO "_minuku_sessions" VALUES ('U00','2023-02-05 19:18:03','2023-02-05','2023-02-05 19:13:40.697000',262.303,157.85,19,1,3,1,0.00381238491363042,262.303,262.303,NULL,262.303,262.303,262.303,15,0.0571857737044563,2,0.00762476982726084,20,0.0762476982726084,0,0.0,21,0.0800600831862388,1,0.00381238491363042,1,0.00381238491363042,1.0,0.0,1.0,1.0,1.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,0.0,0.0,0.0,0.0,0.0,0,1.0,0.0,1.0,1.0,1.0,0,100.0,0.0,100.0,100.0,100.0,0,0.0,0.0,262.303,0.0,0.0,0.0,0.0,262.303,0,0.0,0.0,262.303,0.0,0,0.0,262.303,0.0,0,6,0.0228743094817825,5,132.303,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,15.0,0.0,90.0,25.0);
COMMIT;
