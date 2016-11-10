//
//  LiveViewModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseViewModel.h"

@interface LiveViewModel : BaseViewModel

@property (nonatomic, readonly) NSInteger rowNumber;
@property (nonatomic) NSMutableArray<LiveLinkObjectModel *> *dataList;
@property (nonatomic) NSInteger page;

- (NSURL *)coverURLForRow:(NSInteger)row;
- (NSString *)nickNameForRow:(NSInteger)row;
- (NSString *)onlineCountForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)uidForRow:(NSInteger)row;

@end
