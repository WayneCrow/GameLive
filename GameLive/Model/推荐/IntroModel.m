//
//  IntroModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "IntroModel.h"

@implementation IntroModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"moblieWebgame" : [IntroMobileModel class],
           @"moblieMinecraft" : [IntroMobileModel class],
              @"mobileTvgame" : [IntroMobileModel class],
               @"moblieSport" : [IntroMobileModel class],
                @"mobileStar" : [IntroMobileModel class],
      @"mobileRecommendation" : [IntroMobileModel class],
               @"mobileIndex" : [IntroMobileModel class],
                 @"mobileLol" : [IntroMobileModel class],
              @"mobileBeauty" : [IntroMobileModel class],
          @"mobileHeartstone" : [IntroMobileModel class],
            @"moblieBlizzard" : [IntroMobileModel class],
                      @"list" : [IntroListModel class],
               @"mobileDota2" : [IntroMobileModel class],
                 @"moblieDnf" : [IntroMobileModel class],
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"moblieWebgame" : @"moblie-webgame",
           @"moblieMinecraft" : @"moblie-minecraft",
              @"mobileTvgame" : @"mobile-tvgame",
               @"moblieSport" : @"moblie-sport",
                @"mobileStar" : @"mobile-star",
      @"mobileRecommendation" : @"mobile-recommendation",
               @"mobileIndex" : @"mobile-index",
                 @"mobileLol" : @"mobile-lol",
              @"mobileBeauty" : @"mobile-beauty",
          @"mobileHeartstone" : @"mobile-heartstone",
            @"moblieBlizzard" : @"moblie-blizzard",
               @"mobileDota2" : @"mobile-dota2",
                 @"moblieDnf" : @"moblie-dnf",
             };
}

@end


@implementation IntroListModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"categorySlug" : @"category_slug"};
}

@end


@implementation IntroMobileModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID" : @"id",
         @"slotId" : @"slot_id",
       @"createAt" : @"create_at",
     @"linkObject" : @"link_object"
             };
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"linkObject" : [IntroLinkObjectModel class]};
}

@end


@implementation IntroLinkObjectModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"defaultImage" : @"default_image",
             @"categoryName" : @"category_name",
             @"categorySlug" : @"category_slug",
             @"recommendImage" : @"recommend_image",
             @"appShufflingImage" : @"app_shuffling_image",
             @"startTime" : @"start_time",
             @"createAt" : @"create_at",
             @"videoQuality" : @"video_quality",
             @"categoryId" : @"category_id",
             };
}

@end
