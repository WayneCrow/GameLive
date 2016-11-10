//
//  ProgramRoomModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramRoomModel.h"

@implementation ProgramRoomModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [ProgramRoomDataModel class]};
}

@end


@implementation ProgramRoomDataModel

@end


