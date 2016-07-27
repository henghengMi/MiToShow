//
//  UIView+TSAddShadow.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/27.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "UIView+TSAddShadow.h"

@implementation UIView (TSAddShadow)

-(void) shaodowByFrame:(CGRect)frame
{
//    CGFloat WH = (ScreenWidth - 4 * 10) / 3;
    CGRect rect = frame;  //CGRectMake(0, 0, WH  , WH);
    [self layer].shadowPath =[UIBezierPath bezierPathWithRect:rect].CGPath;
    [self layer].masksToBounds = NO;
    self.layer.shadowColor = TSColor(198, 198, 198).CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(1,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 1.0;//阴影透明度，默认0
    self.layer.shadowRadius = 1;
    
}

- (void)addShadow
{
    CGRect rect = self.frame;  //CGRectMake(0, 0, WH  , WH);
    [self layer].shadowPath =[UIBezierPath bezierPathWithRect:rect].CGPath;
    [self layer].masksToBounds = NO;
    self.layer.shadowColor = TSColor(198, 198, 198).CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(1,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 1.0;//阴影透明度，默认0
    self.layer.shadowRadius = 1;
}

@end
