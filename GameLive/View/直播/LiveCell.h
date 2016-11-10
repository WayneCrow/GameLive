//
//  LiveCell.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveCell : UICollectionViewCell

@property (nonatomic) UIImageView *coverIV;
@property (nonatomic) UIView      *maskView;
@property (nonatomic) UIImageView *micIconIV;
@property (nonatomic) UILabel     *nickNameLB;
@property (nonatomic) UIImageView *onlineCountIV;
@property (nonatomic) UILabel     *onlineNumberLB;
@property (nonatomic) UILabel     *roomTitleLB;

@end
