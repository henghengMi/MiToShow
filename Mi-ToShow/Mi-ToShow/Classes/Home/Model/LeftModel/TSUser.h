//
//  TSUser.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSUser : NSObject
@property(nonatomic, copy) NSString * uid;
@property(nonatomic, copy) NSString * nickname;
@property(nonatomic, copy) NSString * headpic;
@property(nonatomic, copy) NSString * profiledescription;
@property(nonatomic, copy) NSString * role_type;
@end
