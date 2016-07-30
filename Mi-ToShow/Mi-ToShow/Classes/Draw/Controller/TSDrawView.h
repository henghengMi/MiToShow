//
//  TSDrawView.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/29.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LineWidthType) {
    LineWidthTypeSmall = 0,
    LineWidthTypeCenter,
    LineWidthTypeBig,
};

@interface TSDrawView : UIView

@property(nonatomic,assign)CGFloat lineW;
@property(nonatomic,strong)UIColor *pathColor;
@property(nonatomic, assign) LineWidthType lineWidthType;

- (BOOL)back;
- (void)clear;
- (void)eraser;
- (int)forward;

@end


