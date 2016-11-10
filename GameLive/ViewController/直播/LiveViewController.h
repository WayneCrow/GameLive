//
//  LiveViewController.h
//  GameLive
//
//  Created by tarena11 on 16/7/29.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveViewController : UICollectionViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout isSeachVC:(BOOL)isSearch searchInfo:(NSString *)searchInfo;

@end
