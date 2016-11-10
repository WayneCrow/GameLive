//
//  IntroModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IntroListModel, IntroMobileModel, IntroLinkObjectModel;

@interface IntroModel : NSObject

@property (nonatomic, strong) NSArray<IntroMobileModel *> *moblieWebgame;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *moblieMinecraft;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileTvgame;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *moblieSport;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileStar;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileRecommendation;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileIndex;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileLol;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileBeauty;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileHeartstone;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *moblieBlizzard;
@property (nonatomic, strong) NSArray<IntroListModel   *> *list;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *mobileDota2;
@property (nonatomic, strong) NSArray<IntroMobileModel *> *moblieDnf;

@end

@interface IntroListModel : NSObject

@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *name;
// category_slug -> categorySlug
@property (nonatomic, copy) NSString *categorySlug;

@end


@interface IntroMobileModel : NSObject

// id -> ID
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy  ) NSString  *thumb;
@property (nonatomic, copy  ) NSString  *content;
@property (nonatomic, copy  ) NSString  *subtitle;
// slot_id -> slotId
@property (nonatomic, assign) NSInteger slotId;
@property (nonatomic, copy  ) NSString  *link;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy  ) NSString  *title;
// create_at -> createAt
@property (nonatomic, copy  ) NSString  *createAt;
// link_object -> linkObject
@property (nonatomic, strong) IntroLinkObjectModel *linkObject;
@property (nonatomic, copy  ) NSString  *ext;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy  ) NSString  *fk;

@end


@interface IntroLinkObjectModel : NSObject

// default_image -> defaultImage
@property (nonatomic, copy  ) NSString *defaultImage;
@property (nonatomic, copy  ) NSString *slug;
@property (nonatomic, copy  ) NSString *weight;
@property (nonatomic, copy  ) NSString *status;
@property (nonatomic, copy  ) NSString *title;
// category_name -> categoryName
@property (nonatomic, copy  ) NSString *categoryName;
@property (nonatomic, assign) BOOL     hidden;
@property (nonatomic, copy  ) NSString *intro;
// category_slug -> categorySlug
@property (nonatomic, copy  ) NSString *categorySlug;
// recommend_image -> recommendImage
@property (nonatomic, copy  ) NSString *recommendImage;
// play_at -> playAt
@property (nonatomic, copy  ) NSString *playAt;
// app_shuffling_image -> appShufflingImage
@property (nonatomic, copy  ) NSString *appShufflingImage;
@property (nonatomic, copy  ) NSString *level;
@property (nonatomic, copy  ) NSString *grade;
@property (nonatomic, copy  ) NSString *thumb;
@property (nonatomic, copy  ) NSString *nick;
@property (nonatomic, copy  ) NSString *uid;
@property (nonatomic, copy  ) NSString *announcement;
@property (nonatomic, copy  ) NSString *avatar;
// start_time -> startTime
@property (nonatomic, copy  ) NSString *startTime;
@property (nonatomic, copy  ) NSString *view;
// create_at -> createAt
@property (nonatomic, copy  ) NSString *createAt;
// video_quality -> videoQuality
@property (nonatomic, copy  ) NSString *videoQuality;
// category_id -> categoryId
@property (nonatomic, copy  ) NSString *categoryId;
@property (nonatomic, copy  ) NSString *follow;

@end

