//
//  TSMeHomeHeaderView.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import "TSMeHomeHeaderView.h"
#import "TSMeHomeButtonsView.h"

@interface TSMeHomeHeaderView ()


@end
@implementation TSMeHomeHeaderView

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor];
    
        __weak typeof (self)weakSelf =  self;
        weakSelf.buttonsView.btnClick = ^ (int index){
            if (weakSelf.btnClick) {
                weakSelf.btnClick(index);
            }
        };
//        self.buttonsView.backgroundColor = [UIColor yellowColor];
    
}

+ (instancetype)headView
{
  return  [[[NSBundle mainBundle] loadNibNamed:@"TSMeHomeHeaderView" owner:self options:nil] lastObject];
}

- (void)setTextColor:(UIColor *)textColor
{
    
}

@end
