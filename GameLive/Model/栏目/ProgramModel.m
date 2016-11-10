//
//  ProgramModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramModel.h"

@implementation ProgramModel

//+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
//    return @{@"esArray" : [ProgramEsarrayModel class]};
//}
//
//@end
//
//
//@implementation ProgramEsarrayModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

@end


