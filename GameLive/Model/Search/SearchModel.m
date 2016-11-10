//
//  SearchModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [SearchDataModel class]};
}

@end


@implementation SearchDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"items" : [SearchDataItemsModel class]};
}

@end


@implementation SearchDataItemsModel

@end


