//
//  TSTool.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/16.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSTool.h"

#import "Singleton.h"

@interface TSTool : NSObject

singleton_interface(TSTool);

+ (NSArray *)getPullImages;
+ (NSArray *)getRefreshImages;
+ (NSArray *)getCenterXs;


- (MJRefreshGifHeader *)headerWithRefreshingWithView:(UIScrollView *)view Target:(id)target refreshingAction:(SEL)action;


@end
