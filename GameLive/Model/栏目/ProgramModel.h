//
//  ProgramModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProgramEsarrayModel;

@interface ProgramModel : NSObject

//@property (nonatomic, strong) NSArray<ProgramEsarrayModel *> *esArray;
//
//@end
//
//
//@interface ProgramEsarrayModel : NSObject

@property (nonatomic, copy  ) NSString  *slug;
@property (nonatomic, copy  ) NSString  *first_letter;
@property (nonatomic, assign) NSInteger status;
// id -> ID
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger prompt;
@property (nonatomic, copy  ) NSString  *image;
@property (nonatomic, copy  ) NSString  *thumb;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy  ) NSString  *name;

@end

