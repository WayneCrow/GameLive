//
//  Constans.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#ifndef Constans_h
#define Constans_h

#import "AppDelegate.h"
/********** 快捷获取当前进程的代理对象指针 ************/
#define kAppDelegate  ((AppDelegate *)[UIApplication sharedApplication].delegate)

/*******    屏幕的宽高   *********/
#define kScreenW ([UIScreen mainScreen].bounds.size.width)
#define kScreenH ([UIScreen mainScreen].bounds.size.height)

/********   快速三原色定制颜色   *********/
#define kRGBA(r, g, b, a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
#define kQuanMingRed ([UIColor colorWithRed:252 / 255.0 green:50 / 255.0 blue:42 / 255.0 alpha:1])

/********* 去掉Cell分割线的左边距   *************/
#define kRemoveLeftSeparator(cell) \
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero;\
cell.preservesSuperviewLayoutMargins = NO;\

#endif /* Constans_h */
