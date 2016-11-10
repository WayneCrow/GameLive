//
//  Factory.m
//  GameLive
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+ (void)addBackItemForVC:(UIViewController *)vc {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"返回_默认"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"返回_按下"] forState:UIControlStateHighlighted];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    
    [backButton bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem  = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    
    vc.navigationItem.leftBarButtonItems = @[spaceItem, backItem];
}

+ (void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void (^)())handler {
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"搜索_默认"] forState:UIControlStateNormal];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"搜索_按下"] forState:UIControlStateHighlighted];
    searchButton.frame = CGRectMake(0, 0, 44, 44);
    
    [searchButton bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    UIBarButtonItem *spaceItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    
    vc.navigationItem.rightBarButtonItems = @[spaceItem, searchItem];
}

+ (void)addSearchBoxForNavigationItem:(UIViewController *)vc setDelegate:(void (^)())setDelegate {
    
    UIView *searchBox = [UIView new];
    
    searchBox.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.7, 30);
    searchBox.layer.cornerRadius  = 15;
    searchBox.layer.masksToBounds = YES;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:searchBox.frame];
    searchBar.placeholder = @"搜索直播间或主播名";
    
    [searchBox addSubview:searchBar];
    
    vc.navigationItem.titleView = searchBox;
}

+ (void)addMineMessageForNavigationItem:(UIViewController *)vc clickedHandeler:(void (^)())handler {
    
    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageButton setImage:[UIImage imageNamed:@"个人中心消息（新消息）"] forState:UIControlStateNormal];
    messageButton.frame = CGRectMake(0, 0, 44, 44);
    
    [messageButton bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithCustomView:messageButton];
    UIBarButtonItem *spaceItem   = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    
    vc.navigationItem.leftBarButtonItems = @[spaceItem, messageItem];
}

+ (void)addMineEditForNavigationItem:(UIViewController *)vc clickedHandeler:(void (^)())handler {
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setImage:[UIImage imageNamed:@"个人中心编辑图标"] forState:UIControlStateNormal];
    editButton.frame = CGRectMake(0, 0, 44, 44);
    
    [editButton bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithCustomView:editButton];
    UIBarButtonItem *spaceItem   = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    
    vc.navigationItem.rightBarButtonItems = @[spaceItem, editItem];
}

@end
