//
//  TSCustomTabBar.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSCustomTabBar.h"
@interface TSCustomTabBar()
@property (nonatomic, weak) UIButton *drawBtn;
@end
@implementation TSCustomTabBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.barTintColor = [UIColor whiteColor];
//
//        // 添加一个按钮到tabbar中
//        UIButton *drawBtn = [[UIButton alloc] init];
////        [drawBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
////        [drawBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
//
//        [drawBtn setBackgroundImage:[UIImage imageNamed:@"drawicon_"] forState:UIControlStateNormal];
//        [drawBtn setBackgroundImage:[UIImage imageNamed:@"drawicon_"] forState:UIControlStateHighlighted];
//        
////        [drawBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//        [drawBtn setImage:[UIImage imageNamed:@"drawicon_"] forState:UIControlStateNormal];
//        [drawBtn setImage:[UIImage imageNamed:@"drawicon_"] forState:UIControlStateHighlighted];
//        drawBtn.size = CGSizeMake(65, 65);
//        [drawBtn addTarget:self action:@selector(drawBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:drawBtn];
//        self.drawBtn = drawBtn;
//        drawBtn.clipsToBounds = YES;
//        drawBtn.layer.cornerRadius = 35;
        
    }
    return self;
    
}
/**
 *  加号按钮点击
 */
- (void)drawBtnClick
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
//    self.drawBtn.centerX = self.width * 0.5;
//    self.drawBtn.centerY = self.height * 0.5 - 5;
//    
    // 2.设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
  
    for (UIView *child in self.subviews) {
         NSLog(@"view:%@",child);
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            child.width = tabbarButtonW;
            // 设置x
            child.x = tabbarButtonIndex * tabbarButtonW;
            child.y = 5;
            child.height = self.height;
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}

@end
