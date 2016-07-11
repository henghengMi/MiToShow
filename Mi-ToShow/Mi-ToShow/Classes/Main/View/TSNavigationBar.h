//
//  TSNavigationBar.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/11.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSNavigationBar : UIView

@property(nonatomic, strong) UIButton * leftBtn;
@property(nonatomic, strong) UIButton * rightBtn;
@property(nonatomic, strong) UIButton * leftTitleBtn;
@property(nonatomic, strong) UIButton * rightTitleBtn;
@property(nonatomic, strong) UILabel * centerTitleLabel;
@property(nonatomic, weak)  UIImageView *traingleImgView ;

- (void)leftTitleBtnClick;
- (void)rightTitleBtnClick;


@end
