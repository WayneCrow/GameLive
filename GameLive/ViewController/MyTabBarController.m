//
//  MyTabBarController.m
//  GameLive
//
//  Created by tarena11 on 16/7/29.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "MyTabBarController.h"
#import "IntroViewController.h"
#import "ProgramViewController.h"
#import "LiveViewController.h"
#import "MineViewController.h"
#import "MainNavigationController.h"

@interface MyTabBarController ()

@property (nonatomic) IntroViewController   *introVC;
@property (nonatomic) ProgramViewController *programVC;
@property (nonatomic) LiveViewController    *liveVC;
@property (nonatomic) MineViewController    *mineVC;

@end

@implementation MyTabBarController

#pragma mark - LifeCycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 修改控件的某个属性的默认值
    [UITabBar appearance].translucent         = NO;
    [UINavigationBar appearance].translucent  = NO;
    // 设置导航栏颜色
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:252 / 255.0 green:50 / 255.0 blue:42 / 255.0 alpha:1];
    // 导航栏元素颜色为白色
    [UINavigationBar appearance].barStyle = UIBarStyleBlackOpaque;
    // tintColor设置所有子视图的颜色
    [UITabBar appearance].tintColor = [UIColor colorWithRed:252 / 255.0 green:50 / 255.0 blue:42 / 255.0 alpha:1];
    
    MainNavigationController *naviIntro   = [[MainNavigationController alloc] initWithRootViewController:self.introVC];
    MainNavigationController *naviProgram = [[MainNavigationController alloc] initWithRootViewController:self.programVC];
    MainNavigationController *naviLive    = [[MainNavigationController alloc] initWithRootViewController:self.liveVC];
    MainNavigationController *naviMine    = [[MainNavigationController alloc] initWithRootViewController:self.mineVC];
    
    self.viewControllers = @[naviIntro, naviProgram, naviLive, naviMine];
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

#pragma mark - LazyLoad (懒加载)

- (IntroViewController *)introVC {
	if(_introVC == nil) {
		_introVC = [[IntroViewController alloc] initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
        
        _introVC.title = @"推荐";
        
        _introVC.tabBarItem.image         = [UIImage imageNamed:@"推荐_默认"];
        _introVC.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐_焦点"];
	}
	return _introVC;
}

- (ProgramViewController *)programVC {
	if(_programVC == nil) {
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        CGFloat itemWidth = (long)(kScreenW - 10 * 4) / 3;
        CGFloat itemHeight = itemWidth * 450 / 345 + 30;
        
        layout.minimumLineSpacing      = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset            = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemSize                = CGSizeMake(itemWidth, itemHeight);
        
		_programVC = [[ProgramViewController alloc] initWithCollectionViewLayout:layout];
        
        _programVC.title = @"栏目";
        
        _programVC.tabBarItem.image         = [UIImage imageNamed:@"栏目_默认"];
        _programVC.tabBarItem.selectedImage = [UIImage imageNamed:@"栏目_焦点"];
	}
	return _programVC;
}

- (LiveViewController *)liveVC {
	if(_liveVC == nil) {
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        CGFloat itemWidth  = (kScreenW - 10 * 3) / 2;
        CGFloat itemHeight = itemWidth * 219 / 390 + 30;
        
        layout.minimumLineSpacing      = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset            = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemSize                = CGSizeMake(itemWidth, itemHeight);
        
        _liveVC = [[LiveViewController alloc] initWithCollectionViewLayout:layout];
        
        _liveVC.title = @"直播";
        
        _liveVC.tabBarItem.image         = [UIImage imageNamed:@"发现_默认"];
        _liveVC.tabBarItem.selectedImage = [UIImage imageNamed:@"发现_焦点"];
	}
	return _liveVC;
}

- (MineViewController *)mineVC {
	if(_mineVC == nil) {
		_mineVC = [[MineViewController alloc] initWithStyle:UITableViewStyleGrouped];
        
        _mineVC.title = @"我的";
        
        _mineVC.tabBarItem.image         = [UIImage imageNamed:@"我的_默认"];
        _mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"我的_焦点"];
	}
	return _mineVC;
}

@end
