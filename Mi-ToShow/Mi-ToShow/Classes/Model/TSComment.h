//
//  TSComment.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/26.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSUser.h"

@interface TSComment : NSObject

@property(nonatomic, strong) TSUser * user ;
@property(nonatomic, copy) NSString * content;
@property(nonatomic, copy) NSString * cid;
@property(nonatomic, copy) NSString * timeStamp;


@end
