//
//  ItroStarCell.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "IntroStarCell.h"

@interface IntroStarCell () <iCarouselDelegate, iCarouselDataSource>

@end

@implementation IntroStarCell

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    
    if ([_dataSource respondsToSelector:@selector(starNumberOfItems:)]) {
        return [_dataSource starNumberOfItems:self];
    }
    return 0;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 94, carousel.bounds.size.height)];
        
        UIImageView *starIV = [UIImageView new];
        starIV.layer.cornerRadius = 25;
        starIV.tag                = 100;
        [view addSubview:starIV];
        
        [starIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(-10);
            make.centerX.equalTo(0);
            make.width.height.equalTo(50);
        }];
        
        UILabel *starNameLB = [UILabel new];
        starNameLB.tag = 200;
        [view addSubview:starNameLB];
        
        [starNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(starIV.mas_bottom).equalTo(4);
        }];
    }
    
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    UILabel *lable         = (UILabel *)[view viewWithTag:200];
    lable.text             = nil;
    imageView.image        = [UIImage imageNamed:@"分类"];
    
    if ([_dataSource respondsToSelector:@selector(starIntroStarCell:starNameForIndex:)]) {
        lable.text = [_dataSource starIntroStarCell:self starNameForIndex:index];
    }
    if ([_dataSource respondsToSelector:@selector(starIntroStarCell:imageURLForIndex:)]) {
        [imageView setImageWithURL:[_dataSource starIntroStarCell:self imageURLForIndex:index] placeholder:[UIImage imageNamed:@"分类"]];
    }
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
    if ([_delegate respondsToSelector:@selector(introStarCell:didSelectedItemAtIndex:)]) {
        [_delegate introStarCell:self didSelectedItemAtIndex:index];
    }
}

#pragma mark - ic Delegate

- (void)reloadData {
    [self.ic reloadData];
}

#pragma mark - LazyLoad (懒加载)

- (iCarousel *)ic {
    if (!_ic) {
        _ic = [iCarousel new];
        
        [self.contentView addSubview:_ic];
        
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(-1);
        }];
        
        _ic.dataSource = self;
        _ic.delegate   = self;
        
        _ic.pagingEnabled = NO;
        _ic.autoscroll    = -0.4;
        
        UIView *lineView = [UIView new];
        
        lineView.backgroundColor = [UIColor grayColor];
        
        [self.contentView addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return _ic;
}

@end
