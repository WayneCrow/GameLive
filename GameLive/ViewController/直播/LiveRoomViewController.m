//
//  LiveRoomViewController.m
//  GameLive
//
//  Created by tarena11 on 16/8/15.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "LiveRoomViewController.h"

@interface LiveRoomViewController ()

@property (nonatomic) IJKFFMoviePlayerController *player;

@end

@implementation LiveRoomViewController

- (instancetype)initWithUid:(NSString *)uid
{
    self = [super init];
    if (self) {
        _uid = uid;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *videoPath = @"http://hls.quanmin.tv/live/1912022_L3/playlist.m3u8";
    
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURLString:videoPath withOptions:[IJKFFOptions optionsByDefault]];
    
    // 取消打印 可惜不好用
    [IJKFFMoviePlayerController setLogReport:NO];
    [IJKFFMoviePlayerController setLogLevel:k_IJK_LOG_SILENT];
    
    // 准备开始播放 不能直接调用 play 方法
    [self.player prepareToPlay];
    [self.view addSubview:self.player.view];
    
    //    self.player.view.frame = self.view.bounds;
    self.player.scalingMode = IJKMPMovieScalingModeAspectFit;
    
    
    // 切换横竖屏
    UIButton *changeScreenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.player.view addSubview:changeScreenButton];
    changeScreenButton.frame = CGRectMake(20, 20, 200, 60);
    [changeScreenButton setTitle:@"Change" forState:UIControlStateNormal];
    changeScreenButton.backgroundColor = [UIColor purpleColor];
    [changeScreenButton bk_addEventHandler:^(id sender) {
        
        // 官方不允许强制代码切换横竖屏 使用黑科技进行切换
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
            SEL selector = NSSelectorFromString(@"setOrientation:");
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
            [invocation setSelector:selector];
            [invocation setTarget:[UIDevice currentDevice]];
            
            int val = UIInterfaceOrientationPortrait;
            if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
                val = UIInterfaceOrientationLandscapeRight;
            }
            [invocation setArgument:&val atIndex:2];
            [invocation invoke];
        }
    } forControlEvents:UIControlEventTouchUpInside];
}

// 横竖屏发生切换时触发
- (void)viewDidLayoutSubviews {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat heigth = [UIScreen mainScreen].bounds.size.height;
    
    // Device 设备
    // UIDeviceOrientationPortrait Home 按钮在下方竖屏
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
        self.player.view.frame = CGRectMake(0, 20, width, width * 210 / 375);
    }
    else {
        self.player.view.frame = CGRectMake(0, 0, width, heigth);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
