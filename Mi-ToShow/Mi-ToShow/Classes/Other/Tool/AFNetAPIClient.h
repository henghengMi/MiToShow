//
//  AFNetAPIClient.h
//  LJShop
//
//  Created by 蒋林 on 16/5/18.
//  Copyright © 2016年 Jalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum {
    GET = 0,
    POST
}HTTPMethod;

/**
 *  请求成功所走方法
 *
 *  @param response 请求返还的数据
 */
typedef void (^JLResponseSuccess)(NSURLSessionDataTask * task,id responseObject);

/**
 *  请求错误所走方法
 *
 *  @param error 请求错误返还的信息
 */
typedef void (^JLResponseFail)(NSURLSessionDataTask * task, NSError * error);

/**
 *  进度条
 *
 *  @param progress
 */
typedef void (^JLProgress)(NSProgress *progress);


@interface AFNetAPIClient : AFHTTPSessionManager

+ (AFNetAPIClient *)sharedJsonClient;


/**
 * AF数据请求
 */
- (void)requestAFNetworkingURL:(NSString *)URLString
          httpMethod:(HTTPMethod)method
          mathodName:(NSString *)mathodName
          parameters:(id)parameters
             success:(JLResponseSuccess)Success
            progress:(JLProgress)Progress
             failure:(JLResponseFail)Failure;


/**
 * AF数据请求2 (恒恒修改)
 */
//- (void)LJRequestAFNetworkingURL:(NSString *)URLString
//                    httpMethod:(HTTPMethod)method
//                    parameters:(id)parameters
//                       success:(JLResponseSuccess)Success
//                      progress:(JLProgress)Progress
//                       failure:(JLResponseFail)Failure;


/**
 *  取消所有网络请求
 */
- (void)cancelAllRequest;


@end
