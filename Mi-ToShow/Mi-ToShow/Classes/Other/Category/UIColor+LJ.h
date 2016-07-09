//
//  UIColor+LJ.h
//  LJMall
//
//  Created by 袁妙恒 on 15/9/20.
//  Copyright (c) 2015年 蒋林. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (LJ)

// 背景颜色
+ (UIColor *)LJUserManagerBgColor;

// plceholder 颜色
+ (UIColor *)LJUserManagerTextFilePlaceHolderColor;

// 完成按钮的正常颜色
+ (UIColor *)LJUserManagerDoneButtonNomalColor;

// 完成按钮不能点击时候的颜色
+ (UIColor *)LJUserManagerDoneButtonEnableColor;

/** 分割线 */
+ (UIColor *) LJDividerGrayColor;

/** 背景浅色 */
+ (UIColor *)LJBackgroundColor;

/** 取随机色 */
+ (UIColor *)randomColor;


/** 文字浅灰色 */
+ (UIColor *)LJWriteOrderTextColor;

/** 238 */
+ (UIColor *)LJGaryColor;

/** 说明的文字颜色 **/
+ (UIColor *)LJSubtitleColor;


/** 商品imgView的背景色 **/
+ (UIColor *)LJGoodsBGColor;

/** tableView的背景颜色 **/
+ (UIColor *)LJTableViewBGColor;


/** 显示浅色红 */
//+ (UIColor *)LJShowLightThemeColor;

/** 浅色红 (亮) */
+ (UIColor *)LJLightThemeColor;


/** 显示红 LJ色*/
+ (UIColor *)LJThemeColor;

/** 高亮红（亮） LJ色*/
+ (UIColor *)LJThemeHighlightColor;

/** 导航栏颜色、大标题*/
+ (UIColor *) LJNavigationBar_bigTitleColor;

/** 灰色底 228 */
+ (UIColor *)LJGrayBaseColor;

/** 灰色底 242 */
+ (UIColor *)LJGrayFlashBaseColor;

/** 小标题 灰色 */
+ (UIColor *)LJSmallTitleColor;

/** 文本介绍文字 */
+ (UIColor *)LJIntroductionTextColor;

/**  灰色小标题特别喜欢用这个颜色(181e的80%) **/
+ (UIColor *)LJGraySubTitleColor;

@end
