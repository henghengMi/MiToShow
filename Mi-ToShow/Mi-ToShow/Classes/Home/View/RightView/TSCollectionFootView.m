//
//  UICollectionFootView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/16.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSCollectionFootView.h"
#import "TSCellBottomLine.h"

@interface TSCollectionFootView ()



@end

@implementation TSCollectionFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame]) {
        
//        
//        UIButton *footBtn = [UIButton buttonWithType:0];
//        footBtn.frame = CGRectMake(0, 0, ScreenWidth, 35);
//        [fv addSubview:footBtn];
//        [footBtn setTitle:@"查看更多热门话题" forState:(UIControlStateNormal)];
//        [footBtn setImage:IMAGE(@"right_gray_arrow") forState:(UIControlStateNormal)];
//        [footBtn setTitleColor:TSColor(167, 167, 167) forState:(UIControlStateNormal)];
//        footBtn.titleLabel.font = [UIFont systemFontOfSize:11];
//        footBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 60);
//        footBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 150, 0, 0);
//        
//        UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, 35, ScreenWidth, 10)];
//        footV.backgroundColor = TSColor(243, 243, 243);
//        [fv addSubview:footV];
        
        TSLeftTitleRightImageButton *btn = [[TSLeftTitleRightImageButton alloc] init];
        [btn  setTitle:@"查看更多热门话题" forState:(UIControlStateNormal)];
        [btn setImage:IMAGE(@"right_gray_arrow") forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:TSColor(167, 167, 167) forState:(UIControlStateNormal)];
        [self addSubview:btn];
        btn.backgroundColor = [UIColor whiteColor];
        self.btn = btn;
        
        TSCellBottomLine *line = [[TSCellBottomLine alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 3)];
        [self addSubview:line];
        
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.btn.frame = CGRectMake(0, 0, ScreenWidth, self.height - 10);
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
//        self.btn.height = 40;
//        
//    }else if (indexPath.section == 1) {
//        self.btn.height = 0;
////        self.btn.hidden = YES;
//        
//    }
    
    self.btn.hidden = indexPath.section == 1;
}

@end
