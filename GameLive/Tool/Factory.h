//
//  Factory.h
//  GameLive
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject

// 自动为传入参数的拼装返回按钮
+ (void)addBackItemForVC:(UIViewController *)vc;

// 自动为控制器添加右上角的UI
+ (void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void(^)())handler;

+ (void)addSearchBoxForNavigationItem:(UIViewController *)vc setDelegate:(void(^)())setDelegate;

+ (void)addMineMessageForNavigationItem:(UIViewController *)vc clickedHandeler:(void(^)())handler;

+ (void)addMineEditForNavigationItem:(UIViewController *)vc clickedHandeler:(void(^)())handler;

@end
