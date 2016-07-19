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
//@property(nonatomic, assign) BOOL showingRight;
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
    
    
//       [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_tabBarItemClick object:nil userInfo:@{@"itemIndex":@(item.tag)}] ;
    // 监听来自tabBar的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabbarIndexClick:) name:kTSNotificationName_tabBarItemDidClick object:nil];

}

- (void)tabbarIndexClick:(NSNotification *)nf
{
    
    NSInteger index = [nf.userInfo[@"itemIndex"] integerValue];
    if (index != 0) return;
        
    
    if (self.showingRightVC) { // 发送右边的通知
        [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_tabBarRightItemClick object:nil userInfo:nil] ;

    }else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_tabBarleftItemClick object:nil userInfo:nil] ;

    }
    
    
}

//#pragma mark 监听到在showing左还是showing右发送通知
//- (void)setShowingRightVC:(BOOL)showingRightVC
//{
//    // 先调用父类
//    [super setShowingRightVC:showingRightVC];
//    
//    if(showingRightVC) // 正在展示左边
//    {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_tabBarItemClick object:nil userInfo:@{@"itemIndex":@(item.tag)}] ;
//
//    }else // 正在展示右边
//    {
//        
//    }
//    
//    
//}

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
    // 发通知
    
    
    
    
    
}

- (void)TSNavRightImageDidClick
{
    NSLog(@"TSNavRightImageDidClick");
}

- (void)TSNavLeftTitleDidClickisOnleft:(BOOL)onleft
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_leftTitleClick object:nil userInfo:@{@"isonleft": @(onleft)}];
   

    NSLog(@"TSNavLeftTitleDidClick");
    
}

- (void)TSNavRightTitleDidClickOnRight:(BOOL)onRight
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_rightleClick object:nil userInfo:@{@"isonright": @(onRight)}];

    NSLog(@"TSNavRightTitleDidClick");
}

@end