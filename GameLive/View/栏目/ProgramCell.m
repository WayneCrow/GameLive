//
//  ProgramCell.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramCell.h"

@implementation ProgramCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
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

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.font = [UIFont systemFontOfSize:15];
        _titleLB.textColor = [UIColor darkGrayColor];
        
        [self.contentView addSubview:_titleLB];
        
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.right.equalTo(0);
            make.top.equalTo(self.coverIV.mas_bottom);
            make.height.equalTo(26);
        }];
        
        
        UIView *view = [UIView new];
        
        view.backgroundColor = kRGBA(190, 190, 190, 1);
        
        [self addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(2);
        }];
    }
    return _titleLB;
}

@end
