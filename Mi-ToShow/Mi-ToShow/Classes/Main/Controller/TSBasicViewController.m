//
//  TSBasicViewController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//  基类~

#import "TSBasicViewController.h"
#import "TSNavigationBar.h"

@interface TSBasicViewController ()

@property(nonatomic, weak) TSNavigationBar * navBar ;

@end

@implementation TSBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 导航栏
    [self setupNavBar];
    
}


#pragma mark - 导航栏
#pragma mark 创建导航栏
- (void)setupNavBar
{
    TSNavigationBar * navBar = [[TSNavigationBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,TSNavigationHeight)];
    [self.view addSubview:navBar];
    self.navBar = navBar;
    navBar.backgroundColor = [UIColor blackColor];
   
}

#pragma mark 左图名字
- (void)setTSNavLeftImageName:(NSString *)TSNavLeftImageName
{
    [self.navBar.leftBtn setImage:[UIImage imageNamed:TSNavLeftImageName] forState:(UIControlStateNormal)];
    [self.navBar.leftBtn addTarget:self action:@selector(TSNavLeftImageDidClick) forControlEvents:(UIControlEventTouchUpInside)];
}
#pragma mark 右图名字
- (void)setTSNavRightImageName:(NSString *)TSNavRightImageName
{
    [self.navBar.rightBtn setImage:[UIImage imageNamed:TSNavRightImageName] forState:(UIControlStateNormal)];
    [self.navBar.rightBtn addTarget:self action:@selector(TSNavRightImageDidClick) forControlEvents:(UIControlEventTouchUpInside)];
}
#pragma mark 左标题名字
- (void)setTSNavLeftTitle:(NSString *)TSNavLeftTitle
{
    self.navBar.traingleImgView.hidden = NO; // 显示三角形
    self.TSNavOnleftTitle = YES;

    [self.navBar.leftTitleBtn setTitle:TSNavLeftTitle forState:(UIControlStateNormal)];
    [self.navBar.leftTitleBtn addTarget:self action:@selector(TSNavLeftTitleDidClick_Custom) forControlEvents:(UIControlEventTouchUpInside)];

}
#pragma mark 右标题名字
- (void)setTSNavRightTitle:(NSString *)TSNavRightTitle
{
    [self.navBar.rightTitleBtn setTitle:TSNavRightTitle forState:(UIControlStateNormal)];
    [self.navBar.rightTitleBtn addTarget:self action:@selector(TSNavRightTitleDidClick_Custom) forControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark 点击左标题响应方法
- (void)TSNavLeftTitleDidClick_Custom
{
    if (self.TSNavOnleftTitle == YES)  return;
    [self.navBar leftTitleBtnClick];
    [self TSNavLeftTitleDidClick];
    self.TSNavOnleftTitle = YES;
}
#pragma mark 点击右标题响应方法
- (void)TSNavRightTitleDidClick_Custom
{
    if (self.TSNavOnleftTitle == NO)  return;
    [self.navBar rightTitleBtnClick];
    [self TSNavRightTitleDidClick];
    self.TSNavOnleftTitle = NO;
}

#pragma mark 导航栏标题
- (void)setTSNavTitle:(NSString *)TSNavTitle
{
    _TSNavTitle = TSNavTitle;
//    if (TSNavTitle) {
        self.navBar.traingleImgView.hidden = YES;
        self.navBar.centerTitleLabel.text = TSNavTitle;
//    }
}

#pragma mark 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
