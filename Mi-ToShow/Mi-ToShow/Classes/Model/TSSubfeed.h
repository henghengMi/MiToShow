//
//  TSSubfeed.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/21.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSUser.h"
#import "TSAction.h"
@interface TSSubfeed : NSObject
@property(nonatomic, strong) TSUser * user ;
@property(nonatomic, copy) NSString * text;
@property(nonatomic, strong) TSAction * action;
@property(nonatomic, copy) NSString *feedid;

@end
