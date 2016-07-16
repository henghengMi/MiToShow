//
//  TSSomeOneView.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/15.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^SomeOneClick)(int clickIndex);


@interface TSSomeOneView : UIView





@property(nonatomic, copy) SomeOneClick  someOneClick;

@property(nonatomic, strong) NSArray * images ;


- (void)someOneViewDiscoverBtnAddTager:(id)targer action:(SEL)action forControlEvents:(UIControlEvents )controlEvents;

@end
