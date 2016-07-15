//
//  TSBasicViewController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//  基类~

#import "TSBasicViewController.h"
#import "TSNavigationBar.h"

@interface TSBasicViewController ()<UIScrollViewDelegate>

@property(nonatomic, weak) TSNavigationBar * navBar ;

@end

@implementation TSBasicViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


#pragma mark - 懒加载
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, TSNavigationHeight + 5, ScreenWidth, ScreenHeight - TSNavigationHeight - 5);
//        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 导航栏
    [self setupNavBar];
}



#pragma mark 配置左右标题控制器
- (void)setupChildControllerWithLeftControllerClass:(Class)leftControlleClass RightControllerClass:(Class)rightControllerClass
{
    // 把scrollView加进去
    [self.view addSubview:self.scrollView];
    
    
    UIViewController *leftVC = [[leftControlleClass alloc] init];
    [self addChildViewController:leftVC];
    [self.scrollView addSubview:leftVC.view];
    leftVC.view.height = self.scrollView.height;
     NSLog(@"leftVC.view.width %f",leftVC.view.width);
    
    UIViewController *rightVC = [[rightControllerClass alloc] init];
    [self addChildViewController:rightVC];
    [self.scrollView addSubview:rightVC.view];
    rightVC.view.height = self.scrollView.height;
    rightVC.view.x = ScreenWidth ;
    
    self.scrollView.contentSize = CGSizeMake(ScreenWidth * 2, 0) ;
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
    
    CGPoint offset = self.scrollView.contentOffset ;
    offset.x = 0;
    self.scrollView.contentOffset = offset;
    
    [self.navBar leftTitleBtnClick];
    [self TSNavLeftTitleDidClick];
    self.TSNavOnleftTitle = YES;
}
#pragma mark 点击右标题响应方法
- (void)TSNavRightTitleDidClick_Custom
{
    if (self.TSNavOnleftTitle == NO)  return;
    
    CGPoint offset = self.scrollView.contentOffset ;
    offset.x = ScreenWidth;
    self.scrollView.contentOffset = offset;
    
    [self.navBar rightTitleBtnClick];
    [self TSNavRightTitleDidClick];
    self.TSNavOnleftTitle = NO;
}

#pragma mark 导航栏标题
- (void)setTSNavTitle:(NSString *)TSNavTitle
{
    _TSNavTitle = TSNavTitle;
    self.navBar.traingleImgView.hidden = YES;
    self.navBar.centerTitleLabel.text = TSNavTitle;
}

#pragma mark 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    if (offset.x == 0) { // 左边
        [self TSNavLeftTitleDidClick_Custom];
    }else if (offset.x == ScreenWidth)
    {
        [self TSNavRightTitleDidClick_Custom];
    }
}


@end
