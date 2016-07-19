//
//  MessageController.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/9.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSMessageController.h"
#import "TSMessageMeController.h"
#import "TSMessageLetterController.h"

@interface TSMessageController ()

@end

@implementation TSMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.TSNavLeftTitle = @"我";
    self.TSNavRightTitle = @"私信";
    [self setupChildControllerWithLeftControllerClass:[TSMessageMeController class] RightControllerClass:[TSMessageLetterController class]];
}


@end
