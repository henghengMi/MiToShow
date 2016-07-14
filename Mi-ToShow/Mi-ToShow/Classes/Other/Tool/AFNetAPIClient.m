//
//  AFNetAPIClient.m
//  LJShop
//
//  Created by 蒋林 on 16/5/18.
//  Copyright © 2016年 Jalen. All rights reserved.
//

#import "AFNetAPIClient.h"

@implementation AFNetAPIClient

+ (AFNetAPIClient *)sharedJsonClient {
    static dispatch_once_t  onceToken;
    static AFNetAPIClient * setSharedInstance;
    
    dispatch_once(&onceToken, ^{
        setSharedInstance = [[AFNetAPIClient alloc] init];
        
    });
    return setSharedInstance;
}

- (void)netWorkReachability {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                NSLog(@"未知信号");
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                NSLog(@"手机信号");
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                NSLog(@"wiFi信号");
            }
                break;
                
            case AFNetworkReachabilityStatusNotReachable: {
                NSLog(@"没有信号");
            }
                break;
                
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 返回类型默认JSON
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        // 超时时间
        self.requestSerializer.timeoutInterval = 30;
        // 返回格式
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"image/jpeg", @"image/png", nil];
        // 请求格式
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        self.securityPolicy = [self customSecurityPolicy];

    }
    return self;
}

/**
 * AF网络请求
 */
- (void)requestAFNetworkingURL:(NSString *)URLString
          httpMethod:(HTTPMethod)method
          mathodName:(NSString *)mathodName
          parameters:(id)parameters
             success:(JLResponseSuccess)Success
            progress:(JLProgress)Progress
             failure:(JLResponseFail)Failure
{
    AFNetAPIClient * manager = [[self class] sharedJsonClient];
    
    switch (method) {
        case GET: {
            [manager GET:URLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                Progress(downloadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                Success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                Failure(task,error);
            }];
        }
            break;
            
        case POST:  {
            [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                Progress(downloadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                Success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                Failure(task,error);
            }];
        }
            break;
            
        default:
            break;
    }
}


/**
 * AF2网络请求
 */
//- (void)LJRequestAFNetworkingURL:(NSString *)URLString
//                    httpMethod:(HTTPMethod)method
//                    parameters:(id)parameters
//                       success:(JLResponseSuccess)Success
//                      progress:(JLProgress)Progress
//                       failure:(JLResponseFail)Failure
//{
//    AFNetAPIClient * manager = [[self class] sharedJsonClient];
//    
//    switch (method) {
//        case GET: {
//            [manager GET:URLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//                Progress(downloadProgress);
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                Success(task,responseObject);
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                Failure(task,error);
//            }];
//        }
//            break;
//            
//        case POST:  {
//            [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
//                Progress(downloadProgress);
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                Success(task,responseObject);
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                Failure(task,error);
//            }];
//        }
//            break;
//            
//        default:
//            break;
//    }
//}



- (void)cancelAllRequest {
    [self.operationQueue cancelAllOperations];
}

#pragma mark - https认证
- (AFSecurityPolicy*)customSecurityPolicy {
    // 先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"https" ofType:@"cer"]; //证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = YES;
    NSSet * set = [NSSet setWithObject:certData];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}


@end
