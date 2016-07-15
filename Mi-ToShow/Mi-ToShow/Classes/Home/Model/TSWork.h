//
//  Work.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSTopic.h"

@interface TSWork : NSObject

@property(nonatomic, assign) BOOL hide;
@property(nonatomic, copy) NSString * pngurl;
@property(nonatomic, copy) NSString * workid;
@property(nonatomic, strong) TSTopic * topic;


@end
