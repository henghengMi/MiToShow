//
//  TSNavigationController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSNavigationController.h"
#import "TSTabBarController.h"

@interface TSNavigationController ()

@end

@implementation TSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 全部隐藏导航栏
    self.navigationBarHidden = YES;
    
    // 禁止右滑
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

//拦截push
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.edgesForExtendedLayout = UIRectEdgeNone;//起始点从00开始

    
    if (self.viewControllers.count >0) {
//        TSTabBarController * tabBar =  (TSTabBarController *)[self.superclass class];
//        [tabBar hideCenterImage];
        if(self.pushBlock)
            self.pushBlock();
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
     NSLog(@"---%ld",self.viewControllers.count);
    
    if(self.viewControllers.count == 2)
    {
        // 发出信号
      TSTabBarController *  tb = (TSTabBarController *)self.parentViewController ;
        [tb showCenterImage];
        NSLog(@"返回跟页面，通知显示");
    }
    
    return   [super popViewControllerAnimated:animated];;
}




@end
