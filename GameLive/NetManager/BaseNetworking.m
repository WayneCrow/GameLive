//
//  BaseNetworking.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseNetworking.h"

@implementation BaseNetworking

+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kBasePath.crow_URL];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).firstObject;
    
    return [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        // 做缓存
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
        [[NSOperationQueue new] addOperationWithBlock:^{
            [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
        }];
        
        !completionHandler ?: completionHandler(responseObject, nil);
        NSLog(@"%@", task.currentRequest.URL.absoluteURL);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[NSOperationQueue new] addOperationWithBlock:^{
            
            NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
            id responseObj = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                if (responseObj) {
                    !completionHandler ?: completionHandler(responseObj, nil);
                }
                else {
                   !completionHandler ?: completionHandler(nil, error);
                }
            }];
        }];
        
        NSLog(@"%@", task.currentRequest.URL.absoluteURL);
        NSLog(@"%@", error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kBasePath.crow_URL];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    return [manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        !completionHandler ?: completionHandler(responseObject, nil);
        NSLog(@"%@", task.currentRequest.URL.absoluteURL);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !completionHandler ?: completionHandler(nil, error);
        NSLog(@"%@", task.currentRequest.URL.absoluteURL);
        NSLog(@"%@", error);
    }];
}

@end
