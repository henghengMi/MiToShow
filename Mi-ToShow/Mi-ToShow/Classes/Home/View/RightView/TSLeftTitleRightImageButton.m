//
//  TSLeftTitleRightImageButton.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/16.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSLeftTitleRightImageButton.h"

@implementation TSLeftTitleRightImageButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}



- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return  CGRectMake(0, 0, ScreenWidth, contentRect.size.height);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat W = [self.currentTitle sizeWithFont:self.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, contentRect.size.height)].width;
    return CGRectMake(contentRect.size.width  * 0.5 + W * 0.5 + 8, (contentRect.size.height - self.currentImage.size.height) * 0.5, self.currentImage.size.width, self.currentImage.size.height);
}

@end
