//
//  TSNavigationController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSNavigationController.h"

@interface TSNavigationController ()

@end

@implementation TSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 全部隐藏导航栏
    self.navigationBarHidden = YES;

}


//拦截push
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.edgesForExtendedLayout = UIRectEdgeNone;//起始点从00开始

    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}
@end
