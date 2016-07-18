//
//  TSSomeOneView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/15.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSSomeOneView.h"

@interface TSSomeOneView ()

@property(nonatomic, weak)  UIButton *discoverToYouBtn ;

@end

@implementation TSSomeOneView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *discoverToYouBtn = [UIButton buttonWithType:0];
        [discoverToYouBtn setTitle:@"发现途友" forState:0];
        discoverToYouBtn.frame = CGRectMake(ScreenWidth - (ScreenWidth * 0.5) -10, 0, (ScreenWidth * 0.5), 55);
        [discoverToYouBtn setImage:IMAGE(@"Arrow_") forState:(UIControlStateNormal)];
        [self addSubview:discoverToYouBtn];
        discoverToYouBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [discoverToYouBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        discoverToYouBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        discoverToYouBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0,0, 20);
        discoverToYouBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 170, 0, 0);
        self.discoverToYouBtn = discoverToYouBtn;
//        discoverToYouBtn.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)someOneViewDiscoverBtnAddTager:(id)targer action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    
    [self.discoverToYouBtn addTarget:targer action:action forControlEvents:controlEvents];

}



- (void)setImages:(NSArray *)images
{
    _images = images;
    CGFloat imgWH = 35;
    
    for (int i = 0; i < images.count ; i ++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(10 + (imgWH + 10 ) * i, (55 - imgWH) * 0.5, imgWH, imgWH)];
        [button setBackgroundImage:IMAGE(@"Mi_02") forState:(UIControlStateNormal)];
        [self addSubview:button];
        button.clipsToBounds = YES;
        button.layer.cornerRadius = imgWH * 0.5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor blackColor].CGColor;
        button.tag = 100+ i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }

}

- (void)btnClick:(UIButton *)btn
{
    if (self.someOneClick) {
        self.someOneClick( (int)btn.tag - 100);
    }
}



@end
