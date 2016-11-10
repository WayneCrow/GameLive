//
//  WelcomeViewController.m
//  GameLive
//
//  Created by tarena11 on 16/8/3.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MyTabBarController.h"
#import "AppDelegate.h"

@import AVFoundation;

@interface WelcomeViewController ()<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic) iCarousel *ic;
@property (nonatomic) NSArray<UIImage *> *imageList;

@property (nonatomic) AVPlayerLayer *playerLayer;

@end

@implementation WelcomeViewController

#pragma mark - LifeCycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default1472"]];
    [self.view addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"welcome_movie" withExtension:@"mp4"];
    
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:videoURL];
    AVPlayer *player   = [AVPlayer playerWithPlayerItem:item];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    _playerLayer.frame = self.view.bounds;
    
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_playerLayer];
    
    [player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:item];
}

- (void)playToEnd {
    [_playerLayer removeFromSuperlayer];
    [self.ic reloadData];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - iCarousel delegate

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.imageList.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        
        view.contentMode   = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    ((UIImageView *)view).image = self.imageList[index];
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
    if (index == 2) {
        [UIView animateWithDuration:1 animations:^{
            
            self.view.window.alpha     = 0;
            self.view.window.transform = CGAffineTransformMakeScale(1.5, 1.5);
            
            [UIApplication sharedApplication].statusBarHidden = NO;
            
        } completion:^(BOOL finished) {
            
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.welcomeWindow.rootViewController = nil;
            
            NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
            NSString *version = infoDic[@"CFBundleShortVersionString"];
            
            [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"ReadVersion"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    }
}

#pragma mark - LazyLoad (懒加载)

- (NSArray<UIImage *> *)imageList {
    if(_imageList == nil) {
        NSArray *imageName960 = @[@"0welcome960", @"1welcome960", @"2welcome960"];
        NSArray *imageName1136 = @[@"0welcome1136", @"1welcome1136", @"2welcome1136"];
        NSArray *imageName1334 = @[@"0welcome1334", @"1welcome1334", @"2welcome1334"];
        NSArray *imageName2208 = @[@"0welcome2208", @"1welcome2208", @"2welcome2208"];
        
        CGFloat height = [UIScreen mainScreen].nativeBounds.size.height;
        
        NSArray *imageName = nil;
        if (height == 960) {
            imageName = imageName960;
        }
        if (height == 1136) {
            imageName = imageName1136;
        }
        if (height == 1334) {
            imageName = imageName1334;
        }
        if (height == 2208) {
            imageName = imageName2208;
        }
        
        NSMutableArray *tmpArray = [NSMutableArray new];
        [imageName enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tmpArray addObject:[UIImage imageNamed:obj]];
        }];
        
        _imageList = tmpArray.copy;
    }
    return _imageList;
}

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] initWithFrame:self.view.bounds];
        
        _ic.dataSource  = self;
        _ic.delegate    = self;
        _ic.scrollSpeed = 0.2;
        _ic.bounces     = NO;
        
        [self.view addSubview:_ic];
    }
    return _ic;
}

@end
