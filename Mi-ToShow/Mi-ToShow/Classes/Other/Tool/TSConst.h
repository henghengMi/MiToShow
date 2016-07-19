//
//  LJConst.h
//  LJMall
//
//  Created by YuanMiaoHeng on 15/10/8.
//  Copyright (c) 2015年 蒋林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/message.h>

// 运行时objc_MJRefreshMsgSend
//#define MJRefreshMsgSend(...) ((void (*)(void *, SEL, UIView *))objc_msgSend)(__VA_ARGS__)
//#define MJRefreshMsgTarget(target) (__bridge void *)(target)

/******************************************** 常量 *************************************************************/






/****************************************************** 字符串 **************************************************/

/** 提示字符串 **/
//UIKIT_EXTERN NSString *const requstFail;
//UIKIT_EXTERN NSString *const requstNoNet;

/** 通知名 **/
UIKIT_EXTERN NSString *const kTSNotificationName_leftTitleClick ;
UIKIT_EXTERN NSString *const kTSNotificationName_rightleClick ;


UIKIT_EXTERN NSString *const kTSNotificationName_tabBarItemDidClick ;
UIKIT_EXTERN NSString *const kTSNotificationName_tabBarleftItemClick ;
UIKIT_EXTERN NSString *const kTSNotificationName_tabBarRightItemClick ;



/***************************************************************************************************************/

