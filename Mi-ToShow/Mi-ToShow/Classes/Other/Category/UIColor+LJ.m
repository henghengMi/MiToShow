//
//  UIColor+LJ.m
//  LJMall
//
//  Created by 袁妙恒 on 15/9/20.
//  Copyright (c) 2015年 蒋林. All rights reserved.
//

#import "UIColor+LJ.h"

@implementation UIColor (LJ)

+ (UIColor *)LJUserManagerBgColor {
    return TSColor(240, 243, 246);
}

+ (UIColor *)LJUserManagerTextFilePlaceHolderColor {
    return [UIColor lightGrayColor];
}

+ (UIColor *)LJUserManagerDoneButtonNomalColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)LJUserManagerDoneButtonEnableColor
{
    return TSColor(28, 195, 210);
}

/** 显示浅色红 */
//+ (UIColor *)LJShowLightThemeColor {
//    return TSColor(250, 90, 85);
//}

/** 浅色红 */
+ (UIColor *)LJLightThemeColor {
    return TSColor(250, 125, 125);
}

/** logo颜色、价格、关键部位 */
+ (UIColor *)LJThemeColor {
    return TSColor(250, 90, 85);
}

/** 关键部位显示 */
+ (UIColor *)LJThemeHighlightColor  {
    return TSColor(240, 50, 38);
}



+ (UIColor *)LJNavigationBar_bigTitleColor
{
    return  TSColor(24, 28, 30);
}

/** 灰色底 228 */
+ (UIColor *)LJGrayBaseColor {
    return TSColor(228, 228, 228);
}

/** 灰色底 242 */
+ (UIColor *)LJGrayFlashBaseColor {
    return TSColor(242, 242, 242);
}

/** 小标题 灰色 */
+ (UIColor *)LJSmallTitleColor {
    return TSColor(150, 150, 150);
}

/** 文本介绍文字 */
+ (UIColor *)LJIntroductionTextColor {
    return TSColor(198, 199, 200);
}


+ (UIColor *) LJDividerGrayColor{
    return  TSColor(200, 199, 204);
}

/** 白底 */
+ (UIColor *)LJBackgroundColor {
    return TSColor(244, 246, 249);
}

+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (UIColor *)LJWriteOrderTextColor {
    return TSColor(87, 87, 87);
}

+ (UIColor *)LJGaryColor {
    return TSColor(238, 238, 238);
}

// add to 12-17
+ (UIColor *)LJSubtitleColor
{
    return TSColor_A(0, 0, 0, 0.5);
}

+ (UIColor *)LJGoodsBGColor
{
    return TSColor_A(228, 228, 228, 0.5);
}

+ (UIColor *)LJTableViewBGColor
{
    return TSColor(239, 239, 244);
}

// 小标题喜欢用这个颜色。
+ (UIColor *)LJGraySubTitleColor
{
    return TSColorHexA(0x181c1e, 0.8);
}
@end
