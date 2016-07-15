//
//  DrawTopic.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSUser.h"

#import "MJExtension.h"


@interface DrawTopic : NSObject

@property(nonatomic, copy) NSString * pngurl;
@property(nonatomic, copy) NSString * timestamp;
@property(nonatomic, copy) NSString * topicid;
@property(nonatomic, copy) NSString * topictitle;
@property(nonatomic, copy) NSString * topicworkcount;
@property(nonatomic, copy) NSString * workid;

@property(nonatomic, strong) TSUser *  user;
@property(nonatomic, strong) NSArray * works ;

@end

/**
 pngurl
 timestamp
 topicid
 topictitle
 topicworkcount
 
 user // 对象
 workid
 works // 数组
 
 **/