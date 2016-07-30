//
//  TSCareCell.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/27.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSBasicCell.h"

@interface TSCareCell : TSBasicCell

+ (instancetype)careCell;


@property(nonatomic, strong) NSArray * comments;

@end
