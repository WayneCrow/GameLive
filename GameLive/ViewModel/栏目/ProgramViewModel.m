//
//  ProgramViewModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramViewModel.h"

@implementation ProgramViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    self.dataTask = [NetManager getProgramListCompletionHandler:^(NSArray<ProgramModel *> *model, NSError *error) {
        
        _dataList = model;
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)coverURLForRow:(NSInteger)row {
    return self.dataList[row].image.crow_URL;
}

- (NSString *)titleForRow:(NSInteger)row {
    return self.dataList[row].name;
}

- (NSString *)slugForRow:(NSInteger)row {
    return self.dataList[row].slug;
}

#pragma mark - LazyLoad (懒加载)

- (NSArray<ProgramModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSArray<ProgramModel *> alloc] init];
    }
    return _dataList;
}

@end
