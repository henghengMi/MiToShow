//
//  HomeController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//  首页控制器

#import "TSHomeController.h"

#import "TSHomeLeftController.h"

#import "TSHomeRightController.h"

@interface TSHomeController ()<UIScrollViewDelegate>

//@property(nonatomic, strong) UIScrollView * scrollView;

@property(nonatomic, strong) TSHomeLeftController * leftVC;
@property(nonatomic, strong)  TSHomeRightController * rightVC;

@end

@implementation TSHomeController

- (TSHomeLeftController *)leftVC
{
    if (!_leftVC) {
        _leftVC = [[TSHomeLeftController alloc] init];
    }
    return _leftVC;
}

- (TSHomeRightController *)rightVC
{
    if (!_rightVC) {
        _rightVC = [[TSHomeRightController alloc] init];
    }
    return _rightVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavgation];
    
    [self setupChildControllerWithLeftControllerClass:[TSHomeLeftController class] RightControllerClass:[TSHomeRightController class]];
}



#pragma mark - 导航栏
-(void)setupNavgation
{
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