//
//  NetManager.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "BaseNetworking.h"

#import "IntroModel.h"
#import "ProgramModel.h"
#import "ProgramRoomModel.h"
#import "LiveModel.h"
#import "SearchModel.h"
#import "LiveRoomModel.h"

@interface NetManager : BaseNetworking

// 推荐
+ (id)getIntroListCompletionHandler:(void(^)(IntroModel *model, NSError *error))completionHandler;

// 栏目
+ (id)getProgramListCompletionHandler:(void(^)(NSArray<ProgramModel *> *model, NSError *error))completionHandler;
// 栏目房间
+ (id)getProgramType:(NSString *)slug page:(NSInteger)page completionHandler:(void(^)(ProgramRoomModel *model, NSError *error))conpletionHandler;

// 直播
+ (id)getLiveListWithPage:(NSInteger)page completionHandler:(void(^)(LiveModel *model, NSError *error))completionHandler;

// 搜索
+ (id)postSearchListWithParameters:(NSDictionary *)parameters completionHandler:(void(^)(SearchModel *model, NSError *error))completionHandler;

// 直播间详情
+ (id)getLiveRoomDetailWithUid:(NSInteger)uid completionHandler:(void(^)(LiveRoomModel *model, NSError *error))completionHandler;

@end
