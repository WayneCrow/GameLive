//
//  BaseViewModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"

typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};

@interface BaseViewModel : NSObject

@property (nonatomic) NSURLSessionDataTask *dataTask;

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;

- (void)postDataWithMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;

@end
