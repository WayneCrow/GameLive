//
//  LiveRoomModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/15.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "LiveRoomModel.h"

@implementation LiveRoomModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"live" : [LiveRoomLiveModel class],
         @"rankCurr" : [LiveRoomRankCurrModel class],
        @"roomLines" : [LiveRoomLiveWsModel class],
         @"rankWeek" : [LiveRoomRankWeekModel class],
        @"rankTotal" : [LiveRoomRankTotalModel class],
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"lastPlayAt" : @"last_play_at",
             @"playStatus" : @"play_status",
           @"categoryName" : @"category_name",
           @"forbidStatus" : @"forbid_status",
               @"rankCurr" : @"rank_curr",
                @"hotWord" : @"hot_word",
              @"roomLines" : @"room_lines",
               @"rankWeek" : @"rank_week",
                 @"isStar" : @"is_star",
              @"rankTotal" : @"rank_total",
           @"videoQuality" : @"video_quality",
             @"categoryId" : @"category_id",
             };
}

@end


@implementation LiveRoomLiveModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"ws" : [LiveRoomLiveWsModel class]};
}

@end


@implementation LiveRoomLiveWsModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"flv" : [LiveRoomLiveWsHlsModel class],
             @"hls" : [LiveRoomLiveWsHlsModel class],
            @"rtmp" : [LiveRoomLiveWsHlsModel class]
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"defPc" : @"def_pc",
         @"defMobile" : @"def_mobile"
             };
}

@end


@implementation LiveRoomLiveWsHlsModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"three" : [LiveRoomLiveWsHlsDetailModel class],
             @"four" : [LiveRoomLiveWsHlsDetailModel class],
             @"five" : [LiveRoomLiveWsHlsDetailModel class],
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"three" : @"3",
              @"four" : @"4",
              @"five" : @"5",
            @"mainPc" : @"main_pc",
        @"mainMobile" : @"main_mobile",
             };
}

@end


@implementation LiveRoomLiveWsHlsDetailModel

@end


@implementation LiveRoomRankTotalModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"iconURL" : @"icon_url",
             @"sendUid" : @"send_uid",
            @"sendNick" : @"send_nick"
             };
}

@end


@implementation LiveRoomRankCurrModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"sendUid" : @"send_uid",
             @"sendNick" : @"send_nick"
             };
}

@end


@implementation LiveRoomRankWeekModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"sendUid" : @"send_uid",
            @"sendNick" : @"send_nick",
             @"iconURL" : @"icon_url"
             };
}

@end
