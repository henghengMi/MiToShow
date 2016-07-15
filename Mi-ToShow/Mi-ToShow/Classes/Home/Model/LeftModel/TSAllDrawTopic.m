//
//  TSAllDrawTopic.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSAllDrawTopic.h"
#import "DrawTopic.h"

@implementation TSAllDrawTopic

- (instancetype)init
{
    if (self = [super init]) {
        [TSAllDrawTopic mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     //                     @"works" : @"TSWork",
                     @"topiclist" : [DrawTopic class],
                     // @"ads" : [Ad class]
                     };
        }];
    }
    return self;
    
}

@end
