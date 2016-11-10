//
//  SearchViewModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "SearchViewModel.h"

@implementation SearchViewModel

- (instancetype)initWithSearchInfo:(NSString *)info {
    if (self = [super init]) {
        self.searchInfo = info;
    }
    return self;
}

- (void)postDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 0;
    
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    
    NSDictionary *paramenters = @{
                                  @"m" : @"site.search",
                                 @"os" : @"2",
                      @"p[categoryId]" : @"0",
                             @"p[key]" : self.searchInfo,
                            @"p[page]" : [NSString stringWithFormat:@"%ld", tmpPage],
                            @"p[size]" : @"10",
                                  @"v" : @"1.3.2",
                                  };
    
    self.dataTask = [NetManager postSearchListWithParameters:paramenters completionHandler:^(SearchModel *model, NSError *error) {
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            
            [self.dataList addObjectsFromArray:model.data.items];
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
        return [NSString stringWithFormat:@"%.1lf万", [self.dataList[row].view integerValue] / 10000.0];
    }
    else {
        return onlineCount;
    }
}

- (NSString *)titleForRow:(NSInteger)row {
    return self.dataList[row].title;
}

- (NSString *)uidForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%ld", self.dataList[row].uid];
}

#pragma mark - LazyLoad (懒加载)

- (NSMutableArray<SearchDataItemsModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<SearchDataItemsModel *> alloc] init];
    }
    return _dataList;
}

- (NSInteger)page {
    if(!_page) {
        _page = 0;
    }
    return _page;
}

- (NSString *)searchInfo {
    if(_searchInfo == nil) {
        _searchInfo = [[NSString alloc] init];
    }
    return _searchInfo;
}

@end
