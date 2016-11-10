//
//  AppDelegate.m
//  GameLive
//
//  Created by tarena11 on 16/7/29.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "WelcomeViewController.h"

@interface AppDelegate ()<EMClientDelegate>

@end

@implementation AppDelegate

- (UIWindow *)window {
    if (!_window) {
        
        [UIApplication sharedApplication].statusBarHidden = NO;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.rootViewController = [[MyTabBarController alloc] init];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (UIWindow *)welcomeWindow {
    if (!_welcomeWindow) {
        
        [[UIApplication sharedApplication] isStatusBarHidden];
        
        // 显示欢迎页的窗口 (后声明的窗口显示在最上方)
        // 注意此写法对于 StoryBoard 不好用，因为生命周期的问题
        _welcomeWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        // window 初始化默认是隐藏的
        _welcomeWindow.hidden = NO;
        _welcomeWindow.frame = [UIScreen mainScreen].bounds;
        _welcomeWindow.rootViewController = [WelcomeViewController new];
        
        // 窗口层级关系，数值越大显示越上层，默认是 0
        _welcomeWindow.windowLevel = 1;
    }
    return _welcomeWindow;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configApplication:launchOptions];
    
    _window = nil;
    
    // 通常将简单不需要保密的数据存储在 NSUserDefault 中
    NSLog(@"%@", NSHomeDirectory());
    
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *version = infoDic[@"CFBundleShortVersionString"];
    
    NSString *readVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"ReadVersion"];
    
    // 个人 Appkey
//    EMOptions *options = [EMOptions optionsWithAppkey:@"crow#crow"];
//    options.apnsCertName = @"istore_dev";
//    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    // 老师 Appkey
    EMOptions *options = [EMOptions optionsWithAppkey:@"1660626091#1604"];
    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    
#warning 去掉 ! 恢复正常状态
    if (![readVersion isEqualToString:version]) {
        [self window];
    }
    else {
        [self window];
        [self welcomeWindow];
    }

    
    return YES;
}

- (void)didAutoLoginWithError:(EMError *)aError {
    NSLog(@"%@", aError ? aError : @"自动登陆成功");
}

/*!
 *  SDK连接服务器的状态变化时会接收到该回调
 *
 *  有以下几种情况，会引起该方法的调用：
 *  1. 登录成功后，手机无法上网时，会调用该回调
 *  2. 登录成功后，网络状态变化时，会调用该回调
 *
 *  @param aConnectionState 当前状态
 */
- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState {
    NSLog(@"%@", aConnectionState == EMConnectionConnected ? @"已连接" : @"未连接");
}

/*!
 *  当前登录账号在其它设备登录时会接收到该回调
 */
- (void)didLoginFromOtherDevice {
    NSLog(@"在其它设备登录");
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的账号在其他设备登陆，目前已登出" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [ac addAction:action1];
    [self.window.rootViewController presentViewController:ac animated:YES completion:nil];
}

/*!
 *  当前登录账号已经被从服务器端删除时会收到该回调
 */
- (void)didRemovedFromServer {
    NSLog(@"已经被从服务器端删除");
}

@end
