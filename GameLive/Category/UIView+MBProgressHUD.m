//
//  UIView+MBProgressHUD.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "UIView+MBProgressHUD.h"

static NSArray *animateimages = nil;

@implementation UIView (MBProgressHUD)

- (void)showHUD {
    [self hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    UIImageView *iv =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    
    // 图片数组只初始化一次，因为png解码为bmp图片非常耗CPU，最好不要反复进行
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        animateimages = [self animateImages];
    });
    
    iv.animationImages   = animateimages;
    iv.animationDuration = 0.6;
    iv.frame             = CGRectMake(0, 0, 37, 37);
    hud.customView       = iv;
    [iv startAnimating];
    
    [hud  hide:YES afterDelay:30];
}

- (NSArray *)animateImages {
    
    NSArray *imageName = @[@"00", @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11"];
    
    NSMutableArray *images = [NSMutableArray array];
    [imageName enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:[UIImage imageNamed:obj]];
    }];
    return images.copy;
}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showWarning:(NSString *)message {
    [self hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode       = MBProgressHUDModeText;
    hud.labelText = message;
    [hud hide:YES afterDelay:2];
}

@end
