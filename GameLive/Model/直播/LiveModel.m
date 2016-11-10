//
//  LiveModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"recommend" : [LiveRecommendModel class],
             @"data" : [LiveLinkObjectModel class]};
}

@end


@implementation LiveRecommendModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [LiveDataModel class]};
}

@end


@implementation LiveDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"link_object" : [LiveLinkObjectModel class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

@end


@implementation LiveLinkObjectModel

@end


//@implementation LiveDataModel
//
//@end


