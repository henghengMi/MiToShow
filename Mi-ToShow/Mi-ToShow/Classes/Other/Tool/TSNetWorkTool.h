//
//  TSNetWorkTool.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSNetWorkTool : NSObject


//- (void)TSPostWithURL:(NSString *)URLString
//           parameters:(NSDictionary *)parameters
//              success:(JLResponseSuccess)Success
//              failure:(JLResponseFail)Failure;
//
//
//- (void)TSGetWithURL:(NSString *)URLString
//             success:(JLResponseSuccess)Success
//             failure:(JLResponseFail)Failure

+ (void)postWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
              success:(void (^)( id json))success
              failure:(void (^)(NSError *error))failure;


+ (void)getWithURL:(NSString *)URLString
             success:(void (^)( id json))success
             failure:(void (^)(NSError *error))failure;



@end
