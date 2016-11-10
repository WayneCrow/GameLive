//
//  NetManager.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

+ (id)getIntroListCompletionHandler:(void (^)(IntroModel *, NSError *))completionHandler {
    
    return [self GET:kIntroPath parameters:nil completionHandler:^(id responsObj, NSError *error) {
        !completionHandler ?: completionHandler([IntroModel parse:responsObj], error);
    }];
}

+ (id)getProgramListCompletionHandler:(void (^)(NSArray<ProgramModel *> *, NSError *))completionHandler {
    
    return [self GET:kProgramPath parameters:nil completionHandler:^(id responsObj, NSError *error) {
        !completionHandler ?: completionHandler([ProgramModel parse:responsObj], error);
    }];
}

+ (id)getProgramType:(NSString *)slug page:(NSInteger)page completionHandler:(void (^)(ProgramRoomModel *, NSError *))conpletionHandler {
    
    NSString *path = [NSString stringWithFormat:kProgramRoomPath, slug, page == 0 ? @"" : [NSString stringWithFormat:@"_%ld", page]];
    
    return [self GET:path parameters:nil completionHandler:^(id responsObj, NSError *error) {
        !conpletionHandler ?: conpletionHandler([ProgramRoomModel parse:responsObj], error);
    }];
}

+ (id)getLiveListWithPage:(NSInteger)page completionHandler:(void (^)(LiveModel *, NSError *))completionHandler {
    
    NSString *path = [NSString stringWithFormat:kLiveRoomListPath, page == 0 ? @"" : [NSString stringWithFormat:@"_%ld", page]];
    
    return [self GET:path parameters:nil completionHandler:^(id responsObj, NSError *error) {
        !completionHandler ?: completionHandler([LiveModel parse:responsObj], error);
    }];
}

+ (id)postSearchListWithParameters:(NSDictionary *)parameters completionHandler:(void (^)(SearchModel *, NSError *))completionHandler {
    
    NSString *path = [NSString stringWithFormat:@"http://www.quanmin.tv/api/v1"];
    
    return [self POST:path parameters:parameters completionHandler:^(id responsObj, NSError *error) {
        !completionHandler ?: completionHandler([SearchModel parse:responsObj], error);
    }];
}

+ (id)getLiveRoomDetailWithUid:(NSInteger)uid completionHandler:(void (^)(LiveRoomModel *, NSError *))completionHandler {
    
    NSString *path = [NSString stringWithFormat:@"http://www.quanmin.tv/json/rooms/%ld/info.json", uid];
    
    return [self GET:path parameters:nil completionHandler:^(id responsObj, NSError *error) {
        !completionHandler ?: completionHandler([LiveRoomModel parse:responsObj], error);
    }];
}

@end
