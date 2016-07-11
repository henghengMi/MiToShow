//
//  TSNavigationBar.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/11.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSNavigationBar.h"

@interface TSNavigationBar ()

@end

@implementation TSNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat navHeight = TSNavigationHeight;
        CGFloat btnW = 50;
 
        // 左图标
        UIButton *leftBtn = [UIButton buttonWithType:0];
        [self addSubview:leftBtn];
        self.leftBtn = leftBtn;
        leftBtn.frame = CGRectMake(0, 0, btnW, navHeight);
        leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        
        // 右图标
        UIButton *rightBtn = [UIButton buttonWithType:0];
        [self addSubview:rightBtn];
        self.rightBtn = rightBtn;
        rightBtn.frame = CGRectMake(ScreenWidth - btnW, 0, btnW, navHeight);
        rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
        
        // 中间label
        UILabel *centerTitleLabel = [[UILabel alloc] init];
        [self addSubview:centerTitleLabel];
        centerTitleLabel.font = [UIFont systemFontOfSize:14];
        centerTitleLabel.frame = CGRectMake(0, 0, ScreenWidth, navHeight);
        centerTitleLabel.textColor = [UIColor whiteColor];
        centerTitleLabel.textAlignment = NSTextAlignmentCenter;
        self.centerTitleLabel = centerTitleLabel;
        
        CGFloat titleBtnW = 85;
        // 左边label
        UIButton *leftTitleBtn = [[UIButton alloc] init];
        [self addSubview:leftTitleBtn];
        leftTitleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        leftTitleBtn.frame = CGRectMake(ScreenWidth * 0.5  - titleBtnW, 0, titleBtnW, navHeight);
        [leftTitleBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)] ;
        leftTitleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.leftTitleBtn = leftTitleBtn;
        
        // 右边label
        UIButton *rightTitleBtn = [[UIButton alloc] init];
        [self addSubview:rightTitleBtn];
        rightTitleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        rightTitleBtn.frame = CGRectMake(ScreenWidth * 0.5 , 0, titleBtnW, navHeight);
        rightTitleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [rightTitleBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)] ;
        self.rightTitleBtn = rightTitleBtn;
        
        // 三角形
        UIImageView *traingleImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,(20.5 * 11.5) / 12.5, 11.5)];
        [self addSubview:traingleImgView];
        traingleImgView.image = IMAGE(@"square_02");
        traingleImgView.centerX = leftTitleBtn.centerX;
        traingleImgView.y = navHeight - traingleImgView.height + 2.5; // 不知道为什么要加2.5
        self.traingleImgView = traingleImgView;
        traingleImgView.hidden = YES;
        
    }
    return self;
}


- (void)leftTitleBtnClick;  //Complete:(void (^)(void))complete
{
    [UIView animateWithDuration:0.25 animations:^{
        self.traingleImgView.centerX = self.leftTitleBtn.centerX;
    }];
}

- (void)rightTitleBtnClick
{
    [UIView animateWithDuration:0.25 animations:^{
        self.traingleImgView.centerX = self.rightTitleBtn.centerX;
    }];
}


@end

