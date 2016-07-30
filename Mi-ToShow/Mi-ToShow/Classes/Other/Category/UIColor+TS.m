//
//  UIColor+TS.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/18.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "UIColor+TS.h"

@implementation UIColor (TS)
+ (UIColor *)TSSectionColor
{
    return TSColor(241, 241, 241);
}

+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
