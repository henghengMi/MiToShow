//
//  TSFourButton.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/20.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSFourButton : UIButton
@property(nonatomic, weak) UILabel  * label;
@property(nonatomic, copy) NSString * name;
@property(nonatomic, assign) int  type;

@end
