//
//  HomeController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//  首页控制器

#import "TSHomeController.h"

@interface TSHomeController ()

@end

@implementation TSHomeController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
//    self.TSNavTitle = @"首页";
    self.TSNavLeftImageName = @"addFeed";
    self.TSNavRightImageName = @"square_03";
    self.TSNavLeftTitle  = @"画题";
    self.TSNavRightTitle = @"广场";
}

- (void)TSNavLeftImageDidClick
{
     NSLog(@"TSNavLeftImageDidClick");
}

- (void)TSNavRightImageDidClick
{
    NSLog(@"TSNavRightImageDidClick");
}

- (void)TSNavLeftTitleDidClick
{
    
    NSLog(@"TSNavLeftTitleDidClick");
}

- (void)TSNavRightTitleDidClick
{
    NSLog(@"TSNavRightTitleDidClick");
}


@end