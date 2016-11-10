//
//  LiveViewModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "LiveViewModel.h"

@implementation LiveViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 0;
    
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    
    self.dataTask = [NetManager getLiveListWithPage:tmpPage completionHandler:^(LiveModel *model, NSError *error) {
        
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
    
    NSString *onlineCount = self.dataList[row].view;
    
    if ([onlineCount integerValue] >= 10000) {
        return [NSString stringWithFormat:@"%.1lf万", [onlineCount integerValue] / 10000.0];
    }
    else {
        return onlineCount;
    }
}

- (NSString *)titleForRow:(NSInteger)row {
    return self.dataList[row].title;
}

- (NSString *)uidForRow:(NSInteger)row {
    return self.dataList[row].uid;
}

#pragma mark - LazyLoad

- (NSMutableArray<LiveLinkObjectModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<LiveLinkObjectModel *> alloc] init];
    }
    return _dataList;
}

- (NSInteger)page {
    if(!_page) {
        _page = 0;
    }
    return _page;
}

@end