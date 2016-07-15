//
//  TSBanner.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSBanner.h"

@implementation TSBanner

- (void)setBanner_url:(NSString *)banner_url
{
    _banner_url = [banner_url copy];
    if (banner_url) {
        _banner_url = [NSString stringWithFormat:@"%@%@",TSImageHost,banner_url];
    }
}

@end
