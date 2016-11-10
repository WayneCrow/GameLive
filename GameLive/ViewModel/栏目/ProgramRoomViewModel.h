//
//  ProgramRoomViewModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseViewModel.h"

@interface ProgramRoomViewModel : BaseViewModel

- (instancetype)initWithSlug:(NSString *)slug;
@property (nonatomic) NSString *slug;

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSMutableArray<ProgramRoomDataModel *> *dataList;
@property (nonatomic) NSInteger page;

- (NSURL *)coverURLForRow:(NSInteger)row;
- (NSString *)nickNameForRow:(NSInteger)row;
- (NSString *)onlineCountForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)uidForRow:(NSInteger)row;

@end
