//
//  define.h
//  Jusfoun
//
//  Created by JUSFOUN on 14/12/4.
//  Copyright (c) 2014年 dh. All rights reserved.
//

#ifndef Jusfoun_define_h
#define Jusfoun_define_h






#define kUrlString @"http://localhost:9000/v1"


//sina相关
#define kAppKey         @"2002288860"
#define kRedirectURI    @"http://www.sina.com"
//标题












//获取应用UserDefaults
#define KUserDefaults                   [NSUserDefaults standardUserDefaults]
//系统常用
#define KIsIOS7             [[UIDevice currentDevice].systemVersion floatValue] < 7.0?NO:YES
#define KTabBarH            49.0
#define KDeviceH            [UIScreen mainScreen].bounds.size.height
#define KDeviceW            [UIScreen mainScreen].bounds.size.width

#define KAppBuildNumber     [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleVersion"]
#define KAppVersionNumber   [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define KNavigationH        64
#define KStatusBarH         KIsIOS7?20:0
#define KBTNTAG              100
#define KPICKV              1000



//常用类

//#import "MJRefresh.h"

#endif
