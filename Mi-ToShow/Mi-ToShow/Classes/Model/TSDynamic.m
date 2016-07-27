//
//  TSDynamic.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/21.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSDynamic.h"
#import "TSComment.h"
@implementation TSDynamic


- (instancetype)init
{
    if (self = [super init]) {
        [TSDynamic mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"comments" : [TSComment class],
                     };
        }];
    }
    return self;
    
}
@end
