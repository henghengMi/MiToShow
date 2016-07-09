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
    return RGB_Color(240, 243, 246);
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
    return RGB_Color(28, 195, 210);
}

/** 显示浅色红 */
//+ (UIColor *)LJShowLightThemeColor {
//    return RGB_Color(250, 90, 85);
//}

/** 浅色红 */
+ (UIColor *)LJLightThemeColor {
    return RGB_Color(250, 125, 125);
}

/** logo颜色、价格、关键部位 */
+ (UIColor *)LJThemeColor {
    return RGB_Color(250, 90, 85);
}

/** 关键部位显示 */
+ (UIColor *)LJThemeHighlightColor  {
    return RGB_Color(240, 50, 38);
}



+ (UIColor *)LJNavigationBar_bigTitleColor
{
    return  RGB_Color(24, 28, 30);
}

/** 灰色底 228 */
+ (UIColor *)LJGrayBaseColor {
    return RGB_Color(228, 228, 228);
}

/** 灰色底 242 */
+ (UIColor *)LJGrayFlashBaseColor {
    return RGB_Color(242, 242, 242);
}

/** 小标题 灰色 */
+ (UIColor *)LJSmallTitleColor {
    return RGB_Color(150, 150, 150);
}

/** 文本介绍文字 */
+ (UIColor *)LJIntroductionTextColor {
    return RGB_Color(198, 199, 200);
}


+ (UIColor *) LJDividerGrayColor{
    return  RGB_Color(200, 199, 204);
}

/** 白底 */
+ (UIColor *)LJBackgroundColor {
    return RGB_Color(244, 246, 249);
}

+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (UIColor *)LJWriteOrderTextColor {
    return RGB_Color(87, 87, 87);
}

+ (UIColor *)LJGaryColor {
    return RGB_Color(238, 238, 238);
}

// add to 12-17
+ (UIColor *)LJSubtitleColor
{
    return RGBA_Color(0, 0, 0, 0.5);
}

+ (UIColor *)LJGoodsBGColor
{
    return RGBA_Color(228, 228, 228, 0.5);
}

+ (UIColor *)LJTableViewBGColor
{
    return RGB_Color(239, 239, 244);
}

// 小标题喜欢用这个颜色。
+ (UIColor *)LJGraySubTitleColor
{
    return LJColorHexA(0x181c1e, 0.8);
}
@end
