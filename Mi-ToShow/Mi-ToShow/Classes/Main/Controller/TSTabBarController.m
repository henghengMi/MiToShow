//
//  TSTabBarController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSTabBarController.h"

#import "TSHomeController.h"
#import "TSMeController.h"
#import "TSMessageController.h"
#import "TSDrawController.h"
#import "TSCareController.h"
//#import "TSTabBar.h"
#import "TSNavigationController.h"
#import "TSCustomTabBar.h"
@interface TSTabBarController ()
{
    NSInteger _indexTag;
}
//@property(nonatomic, weak) TSTabBar * myTabBar;
@end

@implementation TSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // 子控制器
    [self setupChildVC];
    
    // 2.更换系统自带的tabbar
    TSCustomTabBar *tabBar = [[TSCustomTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    // 3.增加中间的按钮
    [self setupDrawButton];
}

-(void)setupChildVC
{
    //    //新闻列表
    TSHomeController  *homeVC = [[TSHomeController alloc] init];
    [self addChildVc:homeVC title:@"首页" image:@"home-screen_01" selectedImage:@"home-screen_02"];
    //图片新闻
    TSCareController *careVC = [[TSCareController alloc] init];
    [self addChildVc:careVC title:@"关注" image:@"Recommend_01" selectedImage:@"Recommend_02"];
    
    //视频新闻
    TSMessageController *messageVC = [[TSMessageController alloc] init];
    [self addChildVc:messageVC title:@"消息" image:@"notice_01" selectedImage:@"notice_02"];
    
    //我
    TSMeController *meVC = [[TSMeController alloc] init];
    [self addChildVc:meVC title:@"我" image:@"Personal-Center_01" selectedImage:@"Personal-Center_02"];
}

#pragma mark 设置中间的按钮
- (void)setupDrawButton
{
    // 添加一个按钮到tabbar中
    UIButton *drawBtn = [[UIButton alloc] init];
    [drawBtn setImage:[UIImage imageNamed:@"drawicon_"] forState:UIControlStateNormal];
    [drawBtn setImage:[UIImage imageNamed:@"drawicon_"] forState:UIControlStateHighlighted];
    drawBtn.size = CGSizeMake(65, 65);
    drawBtn.centerX = ScreenWidth * 0.5;
    drawBtn.centerY = ScreenHeight - drawBtn.size.height * 0.5  ;
    drawBtn.tag = 999;
    
    [drawBtn addTarget:self action:@selector(drawBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:drawBtn];
    drawBtn.clipsToBounds = YES;
    drawBtn.layer.cornerRadius = 35;
}

#pragma mark 增加子控制器 并且包装导航栏
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 赋值tag
   
    // 先给外面传进来的小控制器 包装 一个导航控制器
    TSNavigationController *nav = [[TSNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
    nav.tabBarItem.tag = _indexTag;
    _indexTag++;
    __weak typeof (TSNavigationController *)weakNav =  nav;
    weakNav.pushBlock = ^{
        [self hideCenterImage];
    };
}

#pragma mark 导航栏push的时候隐藏中间图片
- (void)hideCenterImage
{
    UIButton *drawBtn = [self.view viewWithTag:999];
    drawBtn.hidden = YES;
}

#pragma mark 点击加号
- (void)drawBtnClick
{
    NSLog(@"点击加号");
    TSDrawController *drawVC = [[TSDrawController alloc] init];
//    TSNavigationController *nav = [[TSNavigationController alloc] initWithRootViewController:self];
//    [nav  pushViewController:drawVC animated:YES];
    [self.navigationController pushViewController:drawVC animated:YES];
    
    
    
}

#pragma mark 监听点击~~~
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
     NSLog(@"itemtag:%ld",item.tag);
    [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_tabBarItemDidClick object:nil userInfo:@{@"itemIndex":@(item.tag)}] ;
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotificationName_tabBarRightItemClick object:nil userInfo:@{@"itemIndex":@(item.tag)}] ;
}

- (BOOL)prefersStatusBarHidden
{
    // iOS7后,[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    // 已经不起作用了
    return YES;
}

@end
