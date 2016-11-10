//
//  NSObject+Parse.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

+ (id)parse:(id)JSON {
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    if ([JSON isKindOfClass:[NSDictionary class]] || [JSON isKindOfClass:[NSString class]] || [JSON isKindOfClass:[NSData class]]) {
        return [self modelWithJSON:JSON];
    }
    return JSON;
}

- (id)copyWithZone:(NSZone *)zone {
    return nil;
}

@end
