//
//  DrawTopic.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "DrawTopic.h"

#import "TSWork.h"

@implementation DrawTopic


- (instancetype)init
{
    if (self = [super init]) {
        [DrawTopic mj_setupObjectClassInArray:^NSDictionary *{
            return @{
//                     @"works" : @"TSWork",
                      @"works" : [TSWork class],
                     // @"ads" : [Ad class]
                     };
        }];
    }
    return self;
    
}



@end
