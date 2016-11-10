//
//  SearchViewModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseViewModel.h"

@interface SearchViewModel : BaseViewModel

- (instancetype)initWithSearchInfo:(NSString *)info;

@property (nonatomic, readonly) NSInteger rowNumber;
@property (nonatomic) NSMutableArray<SearchDataItemsModel *> *dataList;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSString *searchInfo;

- (NSURL *)coverURLForRow:(NSInteger)row;
- (NSString *)nickNameForRow:(NSInteger)row;
- (NSString *)onlineCountForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)uidForRow:(NSInteger)row;

@end
