//
//  UIView+MBProgressHUD.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MBProgressHUD)

- (void)showHUD;

- (void)hideHUD;

- (void)showWarning:(NSString *)message;

@end
