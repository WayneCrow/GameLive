//
//  ProgramViewModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseViewModel.h"

@interface ProgramViewModel : BaseViewModel

@property (nonatomic, readonly) NSInteger rowNumber;
@property (nonatomic) NSArray<ProgramModel *> *dataList;

- (NSURL *)coverURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)slugForRow:(NSInteger)row;

@end
