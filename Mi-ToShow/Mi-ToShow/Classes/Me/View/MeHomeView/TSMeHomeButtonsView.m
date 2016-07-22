//
//  TSMeHomeButtonsView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSMeHomeButtonsView.h"

#import "TSFourButton.h"

@interface TSMeHomeButtonsView ()

@property(nonatomic, strong) NSMutableArray * buttons;
@property(nonatomic, strong) UIImageView *imgView;
@end

@implementation TSMeHomeButtonsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"---initWithFrame----");
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setupUI];
}

- (void)setupUI
{
//    self.backgroundColor = [UIColor redColor];
    NSLog(@"---awakeFromNib----");
    self.buttons = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        TSFourButton *btn = [[TSFourButton alloc] init];
        [self addSubview:btn];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchDown)];
        [self.buttons addObject:btn];
    }
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"profile_02"];
    imgView.frame = CGRectMake(0, 60 - (25 * 15 / 30), 25, 25 * 15 / 30);
    [self addSubview:imgView];
    self.imgView = imgView;
    self.imgView.centerX = [[[TSTool getCenterXs] firstObject] floatValue];
}

- (void)setNamesAndCountsDic:(NSDictionary *)namesAndCountsDic
{
    NSArray *names = namesAndCountsDic[@"names"];
    NSArray *counts = namesAndCountsDic[@"counts"];
    UIColor *color = namesAndCountsDic[@"color"];
    int type = [namesAndCountsDic[@"type"] intValue];
    // 赋值
    for (int i = 0 ; i < names.count; i++) {
        TSFourButton *btn = self.buttons[i];
        [btn setTitle:counts[i] forState:(UIControlStateNormal)];
        btn.name = names[i];
        if (color) {
            [btn setTitleColor:color forState:(UIControlStateNormal)];
            btn.label.textColor = color;
        }
        if (type == 1) {
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 45, 0);
            btn.type = 1;
//            btn.label.y = 20;
        }
    }
}

- (void)btnClick:(UIButton *)btn
{
    int idx = (int)btn.tag - 100;
    [UIView animateWithDuration:0.2 animations:^{
        self.imgView.centerX = [[TSTool getCenterXs][idx] floatValue];
    }];

    if (self.btnClick) {
        
        self.btnClick(idx);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
       CGFloat w = ScreenWidth / 4;
    for (int i = 0; i < self.buttons.count; i++) {
        TSFourButton *btn = self.buttons[i];
        btn.frame =  btn.frame = CGRectMake(i * w , 0, w, self.height );
    }
    
    
    
}

@end
