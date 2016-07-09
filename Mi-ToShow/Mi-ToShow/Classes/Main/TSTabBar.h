//
//  TSTabBar.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSTabBar;

@protocol TSTabBarDelegate <NSObject>

@optional
- (void)tabBar:(TSTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;

@end

@interface TSTabBar : UIView

@property (nonatomic, weak) id<TSTabBarDelegate> delegate;

/**
 *  用来添加一个内部的按钮
 *
 *  @param name    按钮图片
 *  @param selName 按钮选中时的图片
 */
- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName;
@end
