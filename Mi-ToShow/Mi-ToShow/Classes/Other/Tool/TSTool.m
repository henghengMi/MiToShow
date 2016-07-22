//
//  TSTool.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/16.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSTool.h"

@implementation TSTool
singleton_implementation(TSTool)

static  NSMutableArray * refreshingImages;
static NSMutableArray * pullImages;
static NSMutableArray * centerXs;

+ (NSArray *)getPullImages
{
    if (pullImages == nil) {
       pullImages = [NSMutableArray array];
        for (int i = 1; i <= 40; i++ ) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"pull_%d",i]];
            [pullImages addObject:img];
        }
    }

    return pullImages;
}

+ (NSArray *)getRefreshImages
{
    if (refreshingImages == nil) {
      refreshingImages = [NSMutableArray array];
        for (int i = 1; i <= 12; i++ ) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%d",i]];
            [refreshingImages addObject:img];
        }
    }
    return refreshingImages;
}


+ (NSArray *)getCenterXs
{
    if (!centerXs) {
        centerXs = [NSMutableArray array];
        CGFloat w = ScreenWidth / 4;
        for (int i = 0;  i < 4; i++) {
            CGFloat centerX = (i * w) + (w * 0.5);
            [centerXs addObject:@(centerX)];
        }
    }
    return centerXs;
}

- (MJRefreshGifHeader *)headerWithRefreshingWithView:(UIScrollView *)view Target:(id)target refreshingAction:(SEL)action
{
    if (view) {
        [view.mj_header endRefreshing];
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:action];
        [header setImages:[TSTool getPullImages] forState:MJRefreshStateIdle];
        [header setImages:[TSTool getRefreshImages]  forState:MJRefreshStateRefreshing];
        view.mj_header = header;
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        return header;
    }
    else
    {
         NSLog(@"传进来的View为空！");
    }
    return nil;
}

@end
