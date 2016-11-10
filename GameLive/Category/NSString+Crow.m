//
//  NSString+Crow.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "NSString+Crow.h"

@implementation NSString (Crow)

- (NSURL *)crow_URL {
    return [NSURL URLWithString:self];
}

- (NSURL *)crow_VideoURL {
    return [NSString stringWithFormat:@"http://hls.quanmin.tv/live/%@/playlist.m3u8", self].crow_URL;
}

@end
