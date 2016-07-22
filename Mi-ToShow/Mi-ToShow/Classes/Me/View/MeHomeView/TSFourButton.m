//
//  TSFourButton.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/20.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSFourButton.h"

@implementation TSFourButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.font = [UIFont systemFontOfSize:13];
        self.label = label;
        label.textAlignment =  NSTextAlignmentCenter;
        label.text = @"动态";
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 18, 0);
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}




- (void)layoutSubviews
{
    [super layoutSubviews];
   
    self.label.frame = CGRectMake(0,25, self.width, 14);
     if(self.type)
     {
        self.titleLabel.font = [UIFont systemFontOfSize:15];
         self.label.font = [UIFont systemFontOfSize:15];
        return;
     }
    
    self.label.centerY = self.height * 0.5 + 12;
}


- (void)setName:(NSString *)name
{
    self.label.text = name;
}

@end
