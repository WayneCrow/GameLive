//
//  MineHeaderView.m
//  GameLive
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "MineHeaderView.h"

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self backgroundIV];
        [self userHeadIV];
        [self userNameButton];
        [self fishBallNumbaerLB];
        [self finNumberLB];
        [self historyButton];
        [self followButton];
        [self missionButton];
        [self rechargeButton];
        [self starShowButton];
    }
    return self;
}


#pragma mark - DataSource



#pragma mark - LazyLoad (懒加载)

- (UIImageView *)backgroundIV {
    if(_backgroundIV == nil) {
        _backgroundIV = [[UIImageView alloc] init];
        
        _backgroundIV.image = [UIImage imageNamed:@"个人中心背景"];
        _backgroundIV.contentMode   = UIViewContentModeScaleAspectFill;
        _backgroundIV.clipsToBounds = YES;
        
        [self addSubview:_backgroundIV];
        
        [_backgroundIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(0);
            make.bottom.equalTo(-90);
        }];
    }
    return _backgroundIV;
}

- (UIImageView *)userHeadIV {
    if(_userHeadIV == nil) {
        _userHeadIV = [[UIImageView alloc] init];
        
        [_userHeadIV setImage:[UIImage imageNamed:@"个人中心默认头像"]];
        _userHeadIV.contentMode            = UIViewContentModeScaleAspectFill;
        _userHeadIV.layer.cornerRadius     = 40;
        _userHeadIV.layer.masksToBounds    = YES;
        _userHeadIV.userInteractionEnabled = YES;
        
        [self addSubview:_userHeadIV];
        
        [_userHeadIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(30);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
    }
    return _userHeadIV;
}

- (UIButton *)userNameButton {
    if(_userNameButton == nil) {
        _userNameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_userNameButton setTitle:@"登陆/注册" forState:UIControlStateNormal];
        _userNameButton.titleLabel.tintColor    = [UIColor whiteColor];
        [_userNameButton setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _userNameButton.titleLabel.shadowOffset = CGSizeMake(1, 1);
        
        [self.backgroundIV addSubview:_userNameButton];
        
        [_userNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(self.userHeadIV.mas_bottom).equalTo(16);
        }];
    }
    return _userNameButton;
}

- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        
        _maskView.backgroundColor    = [UIColor whiteColor];
        _maskView.layer.shadowColor  = [UIColor darkGrayColor].CGColor;
        _maskView.layer.shadowOffset = CGSizeMake(1, 1);
        
        [self.backgroundIV addSubview:_maskView];
        
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.size.equalTo(CGSizeMake(2, 20));
            make.top.equalTo(self.userNameButton.mas_bottom).equalTo(10);
        }];
    }
    return _maskView;
}

- (UILabel *)fishBallNumbaerLB {
    if(_fishBallNumbaerLB == nil) {
        _fishBallNumbaerLB = [[UILabel alloc] init];
        
        _fishBallNumbaerLB.text          = @"鱼丸 0";
        _fishBallNumbaerLB.textAlignment = NSTextAlignmentRight;
        _fishBallNumbaerLB.font          = [UIFont systemFontOfSize:14];
        _fishBallNumbaerLB.textColor     = [UIColor whiteColor];
        _fishBallNumbaerLB.shadowColor   = [UIColor darkGrayColor];
        _fishBallNumbaerLB.shadowOffset  = CGSizeMake(1, 1);
        
        [self.backgroundIV addSubview:_fishBallNumbaerLB];
        
        [_fishBallNumbaerLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.maskView);
            make.right.equalTo(self.maskView.mas_left).equalTo(-12);
        }];
    }
    return _fishBallNumbaerLB;
}

- (UILabel *)finNumberLB {
    if(_finNumberLB == nil) {
        _finNumberLB = [[UILabel alloc] init];
        
        _finNumberLB.text          = @"鱼翅 0";
        _finNumberLB.textAlignment = NSTextAlignmentLeft;
        _finNumberLB.font          = [UIFont systemFontOfSize:14];
        _finNumberLB.textColor     = [UIColor whiteColor];
        _finNumberLB.shadowColor   = [UIColor darkGrayColor];
        _finNumberLB.shadowOffset  = CGSizeMake(1, 1);
        
        [self.backgroundIV addSubview:_finNumberLB];
        
        [_finNumberLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.maskView);
            make.left.equalTo(self.maskView.mas_right).equalTo(12);
        }];
    }
    return _finNumberLB;
}

- (UIButton *)starShowButton {
    if(_starShowButton == nil) {
        _starShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _starShowButton.backgroundColor      = kRGBA(0, 118, 255, 1);
        _starShowButton.layer.cornerRadius   = 20;
        _starShowButton.layer.masksToBounds  = YES;
        [_starShowButton setTitle:@"开启直播" forState:UIControlStateNormal];
        _starShowButton.titleLabel.textColor = [UIColor whiteColor];
        _starShowButton.titleLabel.font      = [UIFont systemFontOfSize:18];
        
        [self addSubview:_starShowButton];
        
        [_starShowButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.centerY.equalTo(self.backgroundIV.mas_bottom);
            make.size.equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width * 4 / 7, 40));
        }];
    }
    return _starShowButton;
}

- (UIButton *)historyButton {
    if(_historyButton == nil) {
        _historyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_historyButton];
        
        [_historyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.backgroundIV.mas_bottom);
            make.bottom.equalTo(0);
            make.left.equalTo(0);
        }];
        
        UIImageView *assistIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心观看历史"]];;
        
        [self.historyButton addSubview:assistIV];
        
        [assistIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
        }];
        
        UILabel *assistLB = [UILabel new];
        assistLB.text          = @"观看历史";
        assistLB.textAlignment = NSTextAlignmentCenter;
        assistLB.textColor     = [UIColor grayColor];
        assistLB.font          = [UIFont systemFontOfSize:15];
        
        [self.historyButton addSubview:assistLB];
        
        [assistLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(assistIV.mas_bottom).equalTo(8);
            make.bottom.equalTo(-10);
        }];
    }
    return _historyButton;
}

- (UIButton *)followButton {
    if(_followButton == nil) {
        _followButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_followButton];
        
        [_followButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.historyButton);
            make.height.equalTo(self.historyButton);
            make.left.equalTo(self.historyButton.mas_right);
            make.width.equalTo(self.historyButton);
        }];
        
        
        UIImageView *assistIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心我的关注"]];;
        
        [self.followButton addSubview:assistIV];
        
        [assistIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
        }];
        
        UILabel *assistLB = [UILabel new];
        assistLB.text          = @"关注管理";
        assistLB.textAlignment = NSTextAlignmentCenter;
        assistLB.textColor     = [UIColor grayColor];
        assistLB.font          = [UIFont systemFontOfSize:15];
        
        [self.followButton addSubview:assistLB];
        
        [assistLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(assistIV.mas_bottom).equalTo(8);
            make.bottom.equalTo(-10);
        }];
    }
    return _followButton;
}

- (UIButton *)missionButton {
    if(_missionButton == nil) {
        _missionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_missionButton];
        
        [_missionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.historyButton);
            make.height.equalTo(self.historyButton);
            make.left.equalTo(self.followButton.mas_right);
            make.width.equalTo(self.historyButton);
        }];
        
        UIImageView *assistIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心鱼丸任务"]];;
        
        [self.missionButton addSubview:assistIV];
        
        [assistIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
        }];
        
        UILabel *assistLB = [UILabel new];
        assistLB.text          = @"鱼丸任务";
        assistLB.textAlignment = NSTextAlignmentCenter;
        assistLB.textColor     = [UIColor grayColor];
        assistLB.font          = [UIFont systemFontOfSize:15];
        
        [self.missionButton addSubview:assistLB];
        
        [assistLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(assistIV.mas_bottom).equalTo(8);
            make.bottom.equalTo(-10);
        }];
    }
    return _missionButton;
}

- (UIButton *)rechargeButton {
    if(_rechargeButton == nil) {
        _rechargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_rechargeButton];
        
        [_rechargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.historyButton);
            make.height.equalTo(self.historyButton);
            make.left.equalTo(self.missionButton.mas_right);
            make.width.equalTo(self.historyButton);
            make.right.equalTo(0);
        }];
        
        UIImageView *assistIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人中心鱼翅充值"]];;
        
        [self.rechargeButton addSubview:assistIV];
        
        [assistIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
        }];
        
        UILabel *assistLB = [UILabel new];
        assistLB.text          = @"鱼翅充值";
        assistLB.textAlignment = NSTextAlignmentCenter;
        assistLB.textColor     = [UIColor grayColor];
        assistLB.font          = [UIFont systemFontOfSize:15];
        
        [self.rechargeButton addSubview:assistLB];
        
        [assistLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(assistIV.mas_bottom).equalTo(8);
            make.bottom.equalTo(-10);
        }];
    }
    return _rechargeButton;
}

@end
