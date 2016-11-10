//
//  UIScrollView+Refresh.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)())block;
- (void)addFooterRefresh:(void(^)())block;

- (void)beginHeaderRefresh;
- (void)endHeaderRefresh;

- (void)endFooterRefresh;

@end
