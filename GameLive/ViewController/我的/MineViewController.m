//
//  MineViewController.m
//  GameLive
//  我的页面
//  Created by tarena11 on 16/7/29.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"

@interface MineViewController ()

@property (nonatomic) NSArray<NSArray<NSString *> *> *settingLB;
@property (nonatomic) NSArray<NSArray<NSString *> *> *settingImageName;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.navigationItem.titleView = [UIView new];
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets           = NO;
    self.tableView.showsVerticalScrollIndicator         = NO;
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    
    [Factory addMineMessageForNavigationItem:self clickedHandeler:^{
        NSLog(@"2333");
    }];
    
    [Factory addMineEditForNavigationItem:self clickedHandeler:^{
        NSLog(@"2333");
    }];
    
    self.tableView.tableHeaderView = [self headView]; //[[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 324)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma headView

- (UIView *)headView {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 324)];
    headView.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *backgroundIV = [[UIImageView alloc] init];
    
    backgroundIV.image = [UIImage imageNamed:@"LoginBG"];
    backgroundIV.contentMode            = UIViewContentModeScaleAspectFill;
    backgroundIV.clipsToBounds          = YES;
    backgroundIV.userInteractionEnabled = YES;
    
    [headView addSubview:backgroundIV];
    
    [backgroundIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(-240);
        make.left.right.equalTo(0);
        make.bottom.equalTo(-90);
    }];
    
    
    UIImageView *userHeadIV = [[UIImageView alloc] init];
    
    [userHeadIV setImage:[UIImage imageNamed:@"个人中心默认头像"]];
    userHeadIV.contentMode            = UIViewContentModeScaleAspectFill;
    userHeadIV.layer.cornerRadius     = 40;
    userHeadIV.layer.masksToBounds    = YES;
    userHeadIV.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        EMError *error = [[EMClient sharedClient] logout:YES];
        NSLog(@"%@", error.errorDescription ? @"登出失败" : @"登出成功");
    }];
    [userHeadIV addGestureRecognizer:tap];
    
    [headView addSubview:userHeadIV];
    
    [userHeadIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.top.equalTo(30);
        make.size.equalTo(CGSizeMake(80, 80));
    }];
    
    
    UIButton *userNameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [userNameButton setTitle:@"登陆/注册" forState:UIControlStateNormal];
    userNameButton.titleLabel.tintColor    = [UIColor whiteColor];
    [userNameButton setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    userNameButton.titleLabel.shadowOffset = CGSizeMake(1, 1);
    userNameButton.userInteractionEnabled = YES;
    
    [userNameButton bk_addEventHandler:^(id sender) {
        UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UINavigationController *vc = [mainSB instantiateViewControllerWithIdentifier:@"LoginNavi"];
        
        [self presentViewController:vc animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [backgroundIV addSubview:userNameButton];
    
    [userNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.top.equalTo(userHeadIV.mas_bottom).equalTo(16);
    }];
    
    
    UIView *maskView = [[UIView alloc] init];
    
    maskView.backgroundColor        = [UIColor whiteColor];
    maskView.layer.shadowColor      = [UIColor darkGrayColor].CGColor;
    maskView.layer.shadowOffset     = CGSizeMake(1, 1);
    maskView.userInteractionEnabled = YES;
    
    [backgroundIV addSubview:maskView];
    
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.size.equalTo(CGSizeMake(2, 20));
        make.top.equalTo(userNameButton.mas_bottom).equalTo(10);
    }];
    
    
    UILabel *fishBallNumbaerLB = [[UILabel alloc] init];
    
    fishBallNumbaerLB.text          = @"鱼丸 0";
    fishBallNumbaerLB.textAlignment = NSTextAlignmentRight;
    fishBallNumbaerLB.font          = [UIFont systemFontOfSize:14];
    fishBallNumbaerLB.textColor     = [UIColor whiteColor];
    fishBallNumbaerLB.shadowColor   = [UIColor darkGrayColor];
    fishBallNumbaerLB.shadowOffset  = CGSizeMake(1, 1);
    
    [backgroundIV addSubview:fishBallNumbaerLB];
    
    [fishBallNumbaerLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(maskView);
        make.right.equalTo(maskView.mas_left).equalTo(-12);
    }];
    
    
    UILabel *finNumberLB = [[UILabel alloc] init];
    
    finNumberLB.text          = @"鱼翅 0";
    finNumberLB.textAlignment = NSTextAlignmentLeft;
    finNumberLB.font          = [UIFont systemFontOfSize:14];
    finNumberLB.textColor     = [UIColor whiteColor];
    finNumberLB.shadowColor   = [UIColor darkGrayColor];
    finNumberLB.shadowOffset  = CGSizeMake(1, 1);
    
    [backgroundIV addSubview:finNumberLB];
    
    [finNumberLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(maskView);
        make.left.equalTo(maskView.mas_right).equalTo(12);
    }];
    
    
    UIButton *starShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    starShowButton.backgroundColor      = kRGBA(0, 118, 255, 1);
    starShowButton.layer.cornerRadius   = 20;
    starShowButton.layer.masksToBounds  = YES;
    [starShowButton setTitle:@"开启直播" forState:UIControlStateNormal];
    starShowButton.titleLabel.textColor = [UIColor whiteColor];
    starShowButton.titleLabel.font      = [UIFont systemFontOfSize:18];
    
    [headView addSubview:starShowButton];
    
    [starShowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.centerY.equalTo(backgroundIV.mas_bottom);
        make.size.equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width * 4 / 7, 40));
    }];
    
    
    UIButton *historyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [headView addSubview:historyButton];
    
    [historyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(backgroundIV.mas_bottom);
        make.bottom.equalTo(0);
        make.left.equalTo(0);
    }];
    
    UIImageView *assistHistoryIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心观看历史"]];;
    
    [historyButton addSubview:assistHistoryIV];
    
    [assistHistoryIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
    }];
    
    UILabel *assistHistoryLB = [UILabel new];
    assistHistoryLB.text          = @"观看历史";
    assistHistoryLB.textAlignment = NSTextAlignmentCenter;
    assistHistoryLB.textColor     = [UIColor grayColor];
    assistHistoryLB.font          = [UIFont systemFontOfSize:15];
    
    [historyButton addSubview:assistHistoryLB];
    
    [assistHistoryLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.top.equalTo(assistHistoryIV.mas_bottom).equalTo(8);
        make.bottom.equalTo(-10);
    }];
    
    
    UIButton *followButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [headView addSubview:followButton];
    
    [followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(historyButton);
        make.height.equalTo(historyButton);
        make.left.equalTo(historyButton.mas_right);
        make.width.equalTo(historyButton);
    }];
    
    
    UIImageView *assistFollowIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心我的关注"]];;
    
    [followButton addSubview:assistFollowIV];
    
    [assistFollowIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
    }];
    
    UILabel *assistFollowLB = [UILabel new];
    assistFollowLB.text          = @"关注管理";
    assistFollowLB.textAlignment = NSTextAlignmentCenter;
    assistFollowLB.textColor     = [UIColor grayColor];
    assistFollowLB.font          = [UIFont systemFontOfSize:15];
    
    [followButton addSubview:assistFollowLB];
    
    [assistFollowLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.top.equalTo(assistFollowIV.mas_bottom).equalTo(8);
        make.bottom.equalTo(-10);
    }];
    
    
    UIButton *missionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [headView addSubview:missionButton];
    
    [missionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(historyButton);
        make.height.equalTo(historyButton);
        make.left.equalTo(followButton.mas_right);
        make.width.equalTo(historyButton);
    }];
    
    UIImageView *assistMissionIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心鱼丸任务"]];;
    
    [missionButton addSubview:assistMissionIV];
    
    [assistMissionIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
    }];
    
    UILabel *assistMissionLB = [UILabel new];
    assistMissionLB.text          = @"鱼丸任务";
    assistMissionLB.textAlignment = NSTextAlignmentCenter;
    assistMissionLB.textColor     = [UIColor grayColor];
    assistMissionLB.font          = [UIFont systemFontOfSize:15];
    
    [missionButton addSubview:assistMissionLB];
    
    [assistMissionLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.top.equalTo(assistMissionIV.mas_bottom).equalTo(8);
        make.bottom.equalTo(-10);
    }];
    
    
    UIButton *rechargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [headView addSubview:rechargeButton];
    
    [rechargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(historyButton);
        make.height.equalTo(historyButton);
        make.left.equalTo(missionButton.mas_right);
        make.width.equalTo(historyButton);
        make.right.equalTo(0);
    }];
    
    UIImageView *assistRechargeIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心鱼翅充值"]];;
    
    [rechargeButton addSubview:assistRechargeIV];
    
    [assistRechargeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
    }];
    
    UILabel *assistRecechargeLB = [UILabel new];
    assistRecechargeLB.text          = @"鱼翅充值";
    assistRecechargeLB.textAlignment = NSTextAlignmentCenter;
    assistRecechargeLB.textColor     = [UIColor grayColor];
    assistRecechargeLB.font          = [UIFont systemFontOfSize:15];
    
    [rechargeButton addSubview:assistRecechargeLB];
    
    [assistRecechargeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.top.equalTo(assistRechargeIV.mas_bottom).equalTo(8);
        make.bottom.equalTo(-10);
    }];
    
    return headView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.settingLB.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.settingLB[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text  = self.settingLB[indexPath.section][indexPath.row];
    cell.textLabel.font  = [UIFont systemFontOfSize:16];
    cell.imageView.image = [UIImage imageNamed:self.settingImageName[indexPath.section][indexPath.row]];
    
    if (indexPath.section == 1) {
        cell.detailTextLabel.text = @"玩游戏领鱼丸";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 || indexPath.row == 3) {
        UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        id vc = [mainSB instantiateViewControllerWithIdentifier:@"ChatList"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

#pragma mark - LazyLoad (懒加载)

- (NSArray<NSArray<NSString *> *> *)settingLB {
	if(_settingLB == nil) {
		_settingLB = [[NSArray<NSArray<NSString *> *> alloc] init];
        
        _settingLB = @[
                       @[@"开播提醒", @"票务查询", @"聊天室", @"设置选项"],
                       @[@"手游中心"]
                       ];
	}
	return _settingLB;
}

- (NSArray<NSArray<NSString *> *> *)settingImageName {
	if(_settingImageName == nil) {
		_settingImageName = [[NSArray<NSArray<NSString *> *> alloc] init];
        
        _settingImageName = @[
                           @[@"个人中心开播提醒", @"个人中心票务", @"热词_按下", @"个人中心系统设置"],
                           @[@"个人中心手游中心"]
                           ];
	}
	return _settingImageName;
}

@end
