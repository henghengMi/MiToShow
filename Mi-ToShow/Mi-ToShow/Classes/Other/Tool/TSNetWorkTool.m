
//
//  TSNetWorkTool.m
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/14.
//  Copyright © 2016年 Mi. All rights reserved.
//

#import "TSNetWorkTool.h"
#import "AFNetAPIClient.h"

@implementation TSNetWorkTool

/**
 * AF网络请求
 */
+ (void)TSGetWithURL:(NSString *)URLString
                       success:(void (^)( id json))success
                       failure:(void (^)(NSError *error))failure
{
    [[AFNetAPIClient sharedJsonClient] GET:URLString parameters:nil progress:^(NSProgress *  downloadProgress) {
       
    } success:^(NSURLSessionDataTask *  task, id   responseObject) {
         NSLog(@"json:%@",responseObject);
        success(responseObject);
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
        NSLog(@"TSerror:%@",error);
        failure(error);
    }];
}


+ (void)TSPostWithURL:(NSString *)URLString
           parameters:(NSDictionary *)parameters
             success:(void (^)( id json))success
             failure:(void (^)(NSError *error))failure;
{
     NSLog(@"POST请求的字典：%@",parameters);
    [[AFNetAPIClient sharedJsonClient] POST:URLString parameters:parameters progress:^(NSProgress *  downloadProgress){
    } success:^(NSURLSessionDataTask *  task, id   responseObject) {
        NSLog(@"TSjson:%@",responseObject);
        success(responseObject);
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
         NSLog(@"TSerror:%@",error);
        failure(error);
    }];
}

@end
