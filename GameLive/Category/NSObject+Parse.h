//
//  NSObject+Parse.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)<YYModel, NSCopying>

+ (id)parse:(id)JSON;

@end
