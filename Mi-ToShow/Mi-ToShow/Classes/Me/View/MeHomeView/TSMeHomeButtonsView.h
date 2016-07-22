//
//  TSMeHomeButtonsView.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/19.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^BtnClickBlock)(int btnTag) ;

@interface TSMeHomeButtonsView : UIView

@property(nonatomic, copy) BtnClickBlock  btnClick ;
@property(nonatomic, strong) NSDictionary * namesAndCountsDic ;


@end
