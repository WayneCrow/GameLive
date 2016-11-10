//
//  MineHeaderView.h
//  GameLive
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MineHeaderView;

@protocol MineHeaderDataSource <NSObject>

@required

- (NSURL *)userImageForHeader;
- (NSString *)userNickNameForHeader;
- (NSString *)userFishBallForHeader;
- (NSString *)userFinForHeader;

@end

@protocol MineHeaderDelegate <NSObject>

@optional

- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedUserImage:(UIImageView *)userImage;
- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedUserNickName:(NSString *)userNickName;
- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedUserFishBallCount:(NSString *)fishBallCount;
- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedUserFinCount:(NSString *)finCount;
- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedHistory:(UIButton *)history;
- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedFollow:(UIButton *)follow;
- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedMission:(UIButton *)mission;
- (void)mineHeader:(MineHeaderView *)mineHeader didSelectedRecharge:(UIButton *)recharge;

@end

@interface MineHeaderView : UIView

@property (nonatomic, weak) id<MineHeaderDelegate  > delegate;
@property (nonatomic, weak) id<MineHeaderDataSource> dataSource;

- (void)reloadData;

@property (nonatomic) UIImageView *backgroundIV;
@property (nonatomic) UIImageView *userHeadIV;
@property (nonatomic) UIButton    *userNameButton;
@property (nonatomic) UIView      *maskView;
@property (nonatomic) UILabel     *fishBallNumbaerLB;
@property (nonatomic) UILabel     *finNumberLB;
@property (nonatomic) UIButton    *starShowButton;
@property (nonatomic) UIButton    *historyButton;
@property (nonatomic) UIButton    *followButton;
@property (nonatomic) UIButton    *missionButton;
@property (nonatomic) UIButton    *rechargeButton;

@end
