//
//  TSNavigationController.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PushBlock)();

@interface TSNavigationController : UINavigationController

@property(nonatomic, copy) PushBlock pushBlock ;


@end
