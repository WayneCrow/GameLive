//
//  SectionView.h
//  GameLive
//
//  Created by tarena11 on 16/8/3.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RecommenType) {
    RecommenTypeUnknown,
    RecommenTypeMore,
    RecommenTypeChanged,
};

@interface SectionView : UICollectionReusableView

@property (nonatomic) UILabel *sectionLB;
@property (nonatomic) UIControl *rightControl;

@property (nonatomic) RecommenType cellType;
@property (nonatomic, copy) void(^buttonClicked)(NSInteger section);
@property (nonatomic) NSInteger section;

@end
