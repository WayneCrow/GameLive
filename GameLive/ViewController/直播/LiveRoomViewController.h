//
//  LiveRoomViewController.h
//  GameLive
//
//  Created by tarena11 on 16/8/15.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveRoomViewController : UIViewController

- (instancetype)initWithUid:(NSString *)uid;
@property (nonatomic, readonly) NSString *uid;

@end
