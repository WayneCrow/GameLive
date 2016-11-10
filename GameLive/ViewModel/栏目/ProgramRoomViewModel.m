//
//  ProgramRoomViewModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramRoomViewModel.h"

@implementation ProgramRoomViewModel

- (instancetype)initWithSlug:(NSString *)slug {
    if (self = [super init]) {
        _slug = slug;
    }
    return self;
}

- (instancetype)init{
    NSAssert1(NO, @"%s : 必须使用initWithSlug:方法初始化", __FUNCTION__);
    return nil;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 0;
    
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    
    self.dataTask = [NetManager getProgramType:_slug page:tmpPage completionHandler:^(ProgramRoomModel *model, NSError *error) {
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            
            [self.dataList addObjectsFromArray:model.data];
        }
        !completionHandler ?: completionHandler(error);
    }];
    _page = tmpPage;
}

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)coverURLForRow:(NSInteger)row {
    return self.dataList[row].thumb.crow_URL;
}

- (NSString *)nickNameForRow:(NSInteger)row {
    return self.dataList[row].nick;
}

- (NSString *)onlineCountForRow:(NSInteger)row {
    
    if ([self.dataList[row].view integerValue] >= 10000) {
        return [NSString stringWithFormat:@"%.1lf万", [self.dataList[row].view integerValue] / 10000.0];
    }
    else {
        return self.dataList[row].view;
    }
}

- (NSString *)titleForRow:(NSInteger)row {
    return self.dataList[row].title;
}

- (NSString *)uidForRow:(NSInteger)row {
    return self.dataList[row].uid;
}

#pragma mark - LazyLoad (懒加载)

- (NSMutableArray<ProgramRoomDataModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<ProgramRoomDataModel *> alloc] init];
    }
    return _dataList;
}

@end
