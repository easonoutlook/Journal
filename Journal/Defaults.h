//
//  Defaults.h
//  Journal
//
//  Created by Eason on 12/17/12.
//  Copyright (c) 2012 iTalk. All rights reserved.
//

#ifndef Journal_Defaults_h
#define Journal_Defaults_h

/*
 *  System Versioning Preprocessor Macros
 */

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


/**
 重新定义系统的NSLog，__OPTIMIZE__ 是release 默认会加的宏
 对要用到的宏进行一些说明:
 1) __VA_ARGS__ 是一个可变参数的宏，这个可变参数的宏是新的C99规范中新增的，目前似乎只有gcc支持（VC6.0的编译器不支持）。宏前面加上##的作用在于，当可变参数的个数为0时，这里的##起到把前面多余的","去掉,否则会编译出错。
 2) __FILE__ 宏在预编译时会替换成当前的源文件名
 3) __LINE__宏在预编译时会替换成当前的行号
 4) __FUNCTION__宏在预编译时会替换成当前的函数名称
 */

#ifdef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#endif

//这个方式打印出的信息太过于冗余, 大体和上面的功能差不多
//NSLog((@"[FileName:%s]" "[Function:%s]" "[Line:%d]" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)


//thirds
#import "FMDatabase.h"
#import "LoggerClient.h"
#import "UncaughtExceptionHandler.h"
#import "MobClick.h"
#import "VRGCalendarView.h"


//self
#import "Globals.h"
#import "PublicMethods.h"
#import "NavBarController.h"
#import "NavigationBar.h"
#import "AddViewController.h"
#import "AddRecordViewController.h"
#import "AnalysisViewController.h"
#import "AccountViewController.h"
#import "OtherViewController.h"
#import "SettingViewController.h"
#import "Database.h"
#import "UIPlaceHolderTextView.h"
#import "RemarkCell.h"



//一些后面可能用到的代码
/*
 
 NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"navbar_back@2x" ofType:@"png"];
 UIButton *customBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
 customBarButton.frame = CGRectMake(0.f, 0.f, 56.f, 66.f);
 [customBarButton setImage:[UIImage imageWithContentsOfFile:imagePath] forState:UIControlStateNormal];
 [customBarButton addTarget:self action:@selector(dismissAddRecordViewController:) forControlEvents:UIControlEventTouchUpInside];
 UIBarButtonItem *dismissViewButton = [[UIBarButtonItem alloc] initWithCustomView:customBarButton];
 [self.navigationItem setLeftBarButtonItem:dismissViewButton];
 [dismissViewButton release];
 
 */



#endif
