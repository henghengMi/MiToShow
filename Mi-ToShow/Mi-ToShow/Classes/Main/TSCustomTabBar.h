//
//  TSCustomTabBar.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSCustomTabBar;

#warning 因为HWTabBar继承自UITabBar，所以称为HWTabBar的代理，也必须实现UITabBar的代理协议
@protocol TSCustomTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(TSCustomTabBar *)tabBar;
@end

@interface TSCustomTabBar : UITabBar

@property (nonatomic, weak) id<TSCustomTabBarDelegate> delegate;

@end
