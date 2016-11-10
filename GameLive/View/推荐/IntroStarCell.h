//
//  ItroStarCell.h
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

@class IntroStarCell;

@protocol introStarDataSource <NSObject>

@required

- (NSInteger)starNumberOfItems:(IntroStarCell *)introStarCell;
- (NSURL *)starIntroStarCell:(IntroStarCell *)introStarCell imageURLForIndex:(NSInteger)index;
- (NSString *)starIntroStarCell:(IntroStarCell *)introStarCell starNameForIndex:(NSInteger)index;

@end

@protocol IntroStarDelegate <NSObject>

@optional

- (void)introStarCell:(IntroStarCell *)introStarCell didSelectedItemAtIndex:(NSInteger)index;

@end

@interface IntroStarCell : UICollectionViewCell

@property (nonatomic, weak) id<introStarDataSource> dataSource;
@property (nonatomic, weak) id<IntroStarDelegate  > delegate;

@property (nonatomic) iCarousel *ic;

- (void)reloadData;

@end
