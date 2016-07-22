//
//  TSCellBottomLine.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/13.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSCellBottomLine.h"

@implementation TSCellBottomLine

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    /**
       思路一 ： 用贝塞尔曲线 -> 二次贝塞尔曲线
     */
    // 1. 上下波动的范围
//    CGFloat upDownRange = rect.size.height;
    
    [TSColor(222, 222, 222) set];  //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 0.5;
    aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
    
    [aPath moveToPoint:CGPointMake(0, arc4random_uniform(rect.size.height)+ 1)];

    [aPath addCurveToPoint:CGPointMake(rect.size.width, arc4random_uniform(rect.size.height)+ 1) controlPoint1:CGPointMake(arc4random_uniform(100), arc4random_uniform(rect.size.height)+ 1) controlPoint2:CGPointMake(rect.size.width - arc4random_uniform(100) + 100, arc4random_uniform(rect.size.height)+ 1)];
    
    [aPath stroke];
    
}

@end
