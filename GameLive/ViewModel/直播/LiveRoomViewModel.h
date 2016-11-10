//
//  LiveRoomViewModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/15.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseViewModel.h"

@interface LiveRoomViewModel : BaseViewModel

@property (nonatomic) NSMutableArray<LiveRoomModel *> *dataList;

- (NSURL *)videoForUid:(NSInteger)uid;

@end
