//
//  ProgramRoomCell.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramRoomCell.h"

@implementation ProgramRoomCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImageView *)coverIV {
    if(_coverIV == nil) {
        _coverIV = [[UIImageView alloc] init];
        
        _coverIV.contentMode   = UIViewContentModeScaleAspectFill;
        _coverIV.clipsToBounds = YES;
        
        [self.contentView addSubview:_coverIV];
        
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(0);
        }];
    }
    return _coverIV;
}

- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha           = 0.65;
        
        [self.coverIV addSubview:_maskView];
        
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(24);
        }];
    }
    return _maskView;
}

- (UIImageView *)micIconIV {
    if(_micIconIV == nil) {
        _micIconIV = [[UIImageView alloc] init];
        
        [_micIconIV setImage:[UIImage imageNamed:@"主播名"]];
        
        [self.contentView addSubview:_micIconIV];
        
        [_micIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(4);
            make.centerY.equalTo(self.maskView);
        }];
    }
    return _micIconIV;
}

- (UILabel *)nickNameLB {
    if(_nickNameLB == nil) {
        _nickNameLB = [[UILabel alloc] init];
        
        _nickNameLB.textAlignment = NSTextAlignmentLeft;
        _nickNameLB.font          = [UIFont systemFontOfSize:14];
        _nickNameLB.textColor     = [UIColor whiteColor];
        
        [self.contentView addSubview:_nickNameLB];
        
        [_nickNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.micIconIV.mas_right).equalTo(2);
            make.centerY.equalTo(self.maskView);
        }];
    }
    return _nickNameLB;
}

- (UIImageView *)onlineCountIV {
    if(_onlineCountIV == nil) {
        _onlineCountIV = [[UIImageView alloc] init];
        
        _onlineCountIV.image = [UIImage imageNamed:@"观看人数"];
        
        [self.contentView addSubview:_onlineCountIV];
        
        [_onlineCountIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.greaterThanOrEqualTo(self.nickNameLB.mas_right).offset(8);
            make.centerY.equalTo(self.maskView);
        }];
    }
    return _onlineCountIV;
}

- (UILabel *)onlineNumberLB {
    if(_onlineNumberLB == nil) {
        _onlineNumberLB = [[UILabel alloc] init];
        
        _onlineNumberLB.textAlignment = NSTextAlignmentRight;
        _onlineNumberLB.font          = [UIFont systemFontOfSize:14];
        _onlineNumberLB.textColor     = [UIColor whiteColor];
        
        [self.contentView addSubview:_onlineNumberLB];
        
        [_onlineNumberLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.onlineCountIV.mas_right).equalTo(2);
            make.centerY.equalTo(self.maskView);
            make.right.equalTo(-4);
        }];
    }
    return _onlineNumberLB;
}

- (UILabel *)roomTitleLB {
    if(_roomTitleLB == nil) {
        _roomTitleLB = [[UILabel alloc] init];
        
        _roomTitleLB.textAlignment = NSTextAlignmentLeft;
        _roomTitleLB.font          = [UIFont systemFontOfSize:14];
        _roomTitleLB.textColor     = [UIColor darkGrayColor];
        
        [self.contentView addSubview:_roomTitleLB];
        
        [_roomTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.equalTo(0);
            make.top.equalTo(self.coverIV.mas_bottom);
            make.bottom.equalTo(0);
            make.height.equalTo(28);
        }];
        
        
        UIView *view = [UIView new];
        
        view.backgroundColor = kRGBA(190, 190, 190, 1);
        
        [self addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(2);
        }];
    }
    return _roomTitleLB;
}

@end
