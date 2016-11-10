//
//  IntroHeaderView.h
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

@class IntroAdCell;

@protocol IntroHeaderAdDataSource <NSObject>

@required

- (NSInteger)headerNumberOfItems:(IntroAdCell *)introAdCell;
- (NSString *)headerIntroHeaderAdCell:(IntroAdCell *)introAdCell titleForIndex:(NSInteger)index;
- (NSURL *)headerIntroHeaderAdCell:(IntroAdCell *)introAdCell imagerURLForIndex:(NSInteger)index;

@end

@protocol IntroHeaderAdDelegate <NSObject>

@optional

- (void)introHeaderAdCell:(IntroAdCell *)introAdCell didSelectedItemAtIndex:(NSInteger)index;

@end


@interface IntroAdCell : UICollectionViewCell<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, weak) id<IntroHeaderAdDataSource> dataSource;
@property (nonatomic, weak) id<IntroHeaderAdDelegate  > delegate;

@property (nonatomic) iCarousel     *ic;
@property (nonatomic) UIView        *maskView;
@property (nonatomic) UILabel       *titleLB;
@property (nonatomic) UIPageControl *pageControl;

- (void)reloadData;

@property (nonatomic) NSTimer        *timer;
@property (nonatomic) BOOL           autoScroll;
@property (nonatomic) NSTimeInterval duration;

@end
