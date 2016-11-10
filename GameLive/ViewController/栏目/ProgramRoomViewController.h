//
//  ProgramRoomViewController.h
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramRoomViewController : UICollectionViewController

- (instancetype)initWithSlug:(NSString *)slug;
@property (nonatomic, readonly) NSString *slug;

@end
