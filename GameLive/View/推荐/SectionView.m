//
//  SectionView.m
//  GameLive
//
//  Created by tarena11 on 16/8/3.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView

- (UILabel *)sectionLB {
    if (!_sectionLB) {
        _sectionLB = [UILabel new];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"栏目标题"]];
        
        [self addSubview:iv];
        
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(4, 22));
        }];
        
        [self addSubview:_sectionLB];
        
        [_sectionLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(0);
            make.left.equalTo(iv.mas_right).equalTo(4);
        }];
    }
    return _sectionLB;
}

- (void)setCellType:(RecommenType)cellType {
    
    if (_cellType == cellType) {
        return;
    }
    _cellType = cellType;
    [_rightControl removeFromSuperview];
    _rightControl = nil;
    
    _rightControl = [UIControl new];
    [_rightControl bk_addEventHandler:^(id sender) {
        !_buttonClicked ?: _buttonClicked(_section);
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_rightControl];
    
    [_rightControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(-10);
        make.centerY.equalTo(0);
    }];
    
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:14];
    label.text = (_cellType == RecommenTypeMore) ? @"更多" : @"换一换";
    
    [_rightControl addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(0);
        make.right.equalTo(0);
    }];
    
    UIImageView *iv = [UIImageView new];
    iv.image = [UIImage imageNamed:(_cellType == RecommenTypeMore ? @"更多" : @"换一换")];
    
    [_rightControl addSubview:iv];
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(label.mas_left).equalTo(-4);
        make.centerY.equalTo(label);
        make.left.equalTo(0);
    }];
}

- (void)setButtonClicked:(void (^)(NSInteger))buttonClicked {
    _buttonClicked = buttonClicked;
}

@end
