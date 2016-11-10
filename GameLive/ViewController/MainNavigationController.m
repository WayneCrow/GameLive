//
//  MainNavigationController.m
//  GameLive
//
//  Created by tarena11 on 16/8/15.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "MainNavigationController.h"
#import "LiveRoomViewController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

/*******重写方法 来确定当前导航控制器可以支持屏幕切换方式*******/

// 是否允许自动切换横竖屏
- (BOOL)shouldAutorotate {
    return YES;
}

// 支持屏幕方向种类
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    // 当前导航容器中最上层 显示的控制器
    if ([self.topViewController isKindOfClass:[LiveRoomViewController class]]) {
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
