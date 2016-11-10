//
//  AppDelegate+Crow.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Crow)

- (void)configApplication:(NSDictionary *)options;
@property (nonatomic, readonly, getter=isOnline) BOOL online;

@end
