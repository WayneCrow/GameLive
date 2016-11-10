//
//  IntroViewModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseViewModel.h"

@interface IntroViewModel : BaseViewModel

/****************** 头部滚动栏 ******************/
@property (nonatomic) NSArray<IntroMobileModel *> *introIndexList;

@property (nonatomic, readonly) NSInteger headRowNumber;
- (NSURL *)headCoverImageURLForRow:(NSInteger)row;
- (NSString *)headTitleForRow:(NSInteger)row;
- (NSURL *)headLiveRoomURLForRow:(NSInteger)row;

/****************** 主播滚动栏 ******************/

@property (nonatomic) NSArray<IntroMobileModel *> *introStarList;

@property (nonatomic, readonly) NSInteger starRowNumber;
- (NSURL *)starHeadImageForRow:(NSInteger)row;
- (NSString *)starNickNameForRow:(NSInteger)row;
- (NSURL *)starLiveRoomForRow:(NSInteger)row;

/****************** 精彩推荐栏 ******************/

@property (nonatomic) NSArray<IntroMobileModel *> *introRecommenList;

@property (nonatomic, readonly) NSInteger recommenRowNumber;
- (NSURL *)recommenCoverImageForRow:(NSInteger)row;
- (NSString *)recommenNickNameForRow:(NSInteger)row;
- (NSString *)recommenOnlineCountForRow:(NSInteger)row;
- (NSString *)recommenTitleForRow:(NSInteger)row;
- (NSString *)recommenUidForRow:(NSInteger)row;

@property (nonatomic) NSArray<IntroMobileModel *> *recommendRandomList;
- (void)changeRecommendRandomList;

/****************** 其他展示栏 ******************/

@property (nonatomic) NSArray<NSArray<IntroMobileModel *> *> *introOtherList;

- (NSInteger)rowNumberAtSection:(NSInteger)section;
- (NSURL *)coverImageAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)nickNameAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)titleAtIndexPath:(NSIndexPath *)indexPath;
- (NSURL *)liveRoomURLAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)viewAtIndexPath:(NSIndexPath *)indexPath;

// 分组题目
- (NSString *)sectionOfTitleNameAtSection:(NSInteger)section;
- (NSString *)slugAtSection:(NSInteger)section;

@end
