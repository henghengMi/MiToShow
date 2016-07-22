//
//  TSMeHomeHeaderView.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSMeHomeButtonsView.h"
typedef void (^BtnClickBlock)(int btnTag) ;

@interface TSMeHomeHeaderView : UIView

+ (instancetype)headView;
@property(nonatomic, copy) BtnClickBlock  btnClick ;

@property (weak, nonatomic) IBOutlet TSMeHomeButtonsView *buttonsView;

@property(nonatomic, strong) UIColor * textColor;
@end
