//
//  IntroHeaderView.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "IntroAdCell.h"

@implementation IntroAdCell

#pragma mark - LifeCycle (生命周期)

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self ic];
        [self maskView];
        [self titleLB];
        [self pageControl];
        
        _duration       = 2.0;
        self.autoScroll = YES;
    }
    return self;
}

- (void)setDuration:(NSTimeInterval)duration {
    _duration = duration;
    
    self.autoScroll = _autoScroll;
}

- (void)setAutoScroll:(BOOL)autoScroll {
    
    _autoScroll = autoScroll;
    
    if (autoScroll) {
        [_timer invalidate];
        
        _timer = nil;
        
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
            
        } repeats:YES];
    }
}

#pragma mark - Method(方法)

- (void)reloadData {
    [self.ic reloadData];
    
    if ([_dataSource respondsToSelector:@selector(headerIntroHeaderAdCell:titleForIndex:)]) {
        self.titleLB.text = [_dataSource headerIntroHeaderAdCell:self titleForIndex:_ic.currentItemIndex];
    }
    if ([_dataSource respondsToSelector:@selector(headerNumberOfItems:)]) {
        self.pageControl.numberOfPages = [_dataSource headerNumberOfItems:self];
    }
    self.pageControl.currentPage = _ic.currentItemIndex;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(headerNumberOfItems:)]) {
        return [_dataSource headerNumberOfItems:self];
    }
    return 0;
}

#pragma mark - ic Delegate

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        
        view.contentMode   = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(headerIntroHeaderAdCell:imagerURLForIndex:)]) {
        
        NSURL *imageURL = [_dataSource headerIntroHeaderAdCell:self imagerURLForIndex:index];
        
        [((UIImageView *)view) setImageWithURL:imageURL placeholder:[UIImage imageNamed:@"主播正在赶来"]];
    }
    else {
        [((UIImageView *)view) setImage:[UIImage imageNamed:@"主播正在赶来"]];
    }
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    
    self.pageControl.currentPage = carousel.currentItemIndex;
    
    if ([_dataSource respondsToSelector:@selector(headerIntroHeaderAdCell:titleForIndex:)]) {
        
        self.titleLB.text = [_dataSource headerIntroHeaderAdCell:self titleForIndex:_ic.currentItemIndex];
    }
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
    if ([_delegate respondsToSelector:@selector(introHeaderAdCell:didSelectedItemAtIndex:)]) {
        
        [_delegate introHeaderAdCell:self didSelectedItemAtIndex:index];
    }
}

#pragma mark - LazyLoad (懒加载)

- (iCarousel *)ic {
    if (!_ic) {
        _ic = [[iCarousel alloc] init];
        
        _ic.delegate    = self;
        _ic.dataSource  = self;
        _ic.scrollSpeed = 0.2;
        
        [self addSubview:_ic];
        
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(0);
        }];
    }
    return _ic;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [UIView new];
        
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha           = 0.6;
        
        [self addSubview:_maskView];
        
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(28);
        }];
    }
    return _maskView;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [UILabel new];
        
        _titleLB.contentMode = UIViewContentModeLeft;
        _titleLB.font        = [UIFont systemFontOfSize:16];
        _titleLB.alpha       = 0.8;
        _titleLB.textColor   = [UIColor lightGrayColor];
        
        [self addSubview:_titleLB];
        
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(12);
            make.centerY.equalTo(self.maskView);
        }];
    }
    return _titleLB;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        
        _pageControl.pageIndicatorTintColor = kRGBA(255, 255, 255, 0.8);
        _pageControl.currentPageIndicatorTintColor = kRGBA(252, 50, 42, 1);
        
        [self addSubview:_pageControl];
        
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.maskView);
            make.right.equalTo(-4);
            make.left.greaterThanOrEqualTo(self.titleLB.mas_right).offset(8);
        }];
    }
    return _pageControl;
}

@end
