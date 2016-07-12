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

//- (void)setupChildControllerWithLeftControllerClass:(Class)leftControlleClass RightControllerClass:(Class)rightControllerClass
//{
//    // 把scrollView加进去
//    [self.view addSubview:self.scrollView];
//    
//     UIViewController *leftVC = [[leftControlleClass alloc] init];
//    [self addChildViewController:leftVC];
//    [self.scrollView addSubview:leftVC.view];
//    leftVC.view.height = self.scrollView.height;
//    
//    UIViewController *rightVC = [[leftControlleClass alloc] init];
//    [self addChildViewController:rightVC];
//    [self.scrollView addSubview:rightVC.view];
//    rightVC.view.height = self.scrollView.height;
//    rightVC.view.x = ScreenWidth;
//    
//    self.scrollView.contentSize = CGSizeMake(ScreenWidth * 2, 0) ;
//}

- (void)setupChildController
{
    // 把scrollView加进去
     [self.view addSubview:self.scrollView];
    
    // 开始进来自动加载《画题》
    [self addChildViewController:self.leftVC];
    [self.scrollView addSubview:self.leftVC.view];
    self.leftVC.view.height = self.scrollView.height;
    
    // 右边的广场
    [self.scrollView addSubview:self.rightVC.view];
    self.rightVC.view.height = self.scrollView.height;
    self.rightVC.view.x = ScreenWidth;
    
    self.scrollView.contentSize = CGSizeMake(ScreenWidth * 2, 0) ;

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
//    CGPoint offset = self.scrollView.contentOffset ;
//    offset.x = 0;
//    self.scrollView.contentOffset = offset;
}

- (void)TSNavRightTitleDidClick
{
//    CGPoint offset = self.scrollView.contentOffset ;
//    offset.x = ScreenWidth;
//    self.scrollView.contentOffset = offset;
    
    NSLog(@"TSNavRightTitleDidClick");
}



@end