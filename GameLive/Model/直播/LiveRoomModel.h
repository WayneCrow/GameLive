//
//  LiveRoomModel.h
//  GameLive
//
//  Created by tarena11 on 16/8/15.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveRoomLiveModel, LiveRoomLiveWsModel, LiveRoomLiveWsHlsModel, LiveRoomLiveWsHlsDetailModel, LiveRoomRankTotalModel, LiveRoomRankCurrModel, LiveRoomRankWeekModel;

@interface LiveRoomModel : NSObject

@property (nonatomic, copy  ) NSString          *slug;
@property (nonatomic, assign) NSInteger         weight;
// last_play_at -> lastPlayAt
@property (nonatomic, copy  ) NSString          *lastPlayAt;
@property (nonatomic, copy  ) NSString          *title;
// play_status -> playStatus
@property (nonatomic, assign) BOOL              playStatus;
// category_name -> categoryName
@property (nonatomic, copy  ) NSString          *categoryName;
@property (nonatomic, strong) LiveRoomLiveModel *live;
@property (nonatomic, assign) BOOL              hidden;
// forbid_status -> forbidStatus
@property (nonatomic, assign) BOOL              forbidStatus;
// rank_curr -> rankCurr
@property (nonatomic, strong) NSArray<LiveRoomRankCurrModel *> *rankCurr;
@property (nonatomic, strong) NSArray           *admins;
// hot_word -> hotWord
@property (nonatomic, strong) NSArray<NSString *> *hotWord;
@property (nonatomic, copy  ) NSString          *intro;
// room_lines -> roomLines
@property (nonatomic, strong) NSArray<LiveRoomLiveWsModel *> *roomLines;
// rank_week -> rankWeek
@property (nonatomic, strong) NSArray<LiveRoomRankWeekModel *> *rankWeek;
// is_star -> isStar
@property (nonatomic, assign) BOOL              isStar;
@property (nonatomic, assign) NSInteger         uid;
@property (nonatomic, copy  ) NSString          *announcement;
@property (nonatomic, copy  ) NSString          *nick;
@property (nonatomic, copy  ) NSString          *thumb;
@property (nonatomic, strong) NSArray           *notice;
// rank_total -> rankTotal
@property (nonatomic, strong) NSArray<LiveRoomRankTotalModel *> *rankTotal;
@property (nonatomic, copy  ) NSString          *avatar;
@property (nonatomic, assign) NSInteger         view;
// video_quality -> videoQuality
@property (nonatomic, copy  ) NSString          *videoQuality;
@property (nonatomic, assign) BOOL              warn;
// category_id -> categoryId
@property (nonatomic, assign) NSInteger         categoryId;
@property (nonatomic, assign) NSInteger         follow;

@end


@interface LiveRoomLiveModel : NSObject

@property (nonatomic, strong) LiveRoomLiveWsModel *ws;

@end


@interface LiveRoomLiveWsModel : NSObject

// def_pc -> defPc
@property (nonatomic, copy  ) NSString               *defPc;
@property (nonatomic, strong) LiveRoomLiveWsHlsModel *flv;
@property (nonatomic, strong) LiveRoomLiveWsHlsModel *hls;
@property (nonatomic, assign) NSInteger              v;
@property (nonatomic, strong) LiveRoomLiveWsHlsModel *rtmp;
@property (nonatomic, copy  ) NSString               *name;
// def_mobile -> defMobile
@property (nonatomic, copy  ) NSString               *defMobile;

@end


@interface LiveRoomLiveWsHlsModel : NSObject

// 3 -> three
@property (nonatomic, strong) LiveRoomLiveWsHlsDetailModel *three;
// 4 -> four
@property (nonatomic, strong) LiveRoomLiveWsHlsDetailModel *four;
// 5 -> five
@property (nonatomic, strong) LiveRoomLiveWsHlsDetailModel *five;
// main_pc -> mainPc
@property (nonatomic, assign) NSInteger                    mainPc;
// main_mobile -> mainMobile;
@property (nonatomic, assign) NSInteger                    mainMobile;

@end


@interface LiveRoomLiveWsHlsDetailModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *src;

@end


@interface LiveRoomRankTotalModel : NSObject

// icon_url -> iconURL
@property (nonatomic, copy  ) NSString  *iconURL;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, copy  ) NSString  *icon;
@property (nonatomic, copy  ) NSString  *rank;
// send_uid -> sendUid
@property (nonatomic, assign) NSInteger sendUid;
// send_nick -> sendNick
@property (nonatomic, copy  ) NSString  *sendNick;

@end


@interface LiveRoomRankCurrModel : NSObject

@property (nonatomic, assign) NSInteger score;
@property (nonatomic, copy  ) NSString  *icon;
@property (nonatomic, copy  ) NSString  *rank;
// send_uid -> sendUid
@property (nonatomic, assign) NSInteger sendUid;
// send_nick -> sendNick
@property (nonatomic, copy  ) NSString  *sendNick;

@end


@interface LiveRoomRankWeekModel : NSObject

@property (nonatomic, copy  ) NSString  *change;
@property (nonatomic, assign) NSInteger score;
// send_nick -> sendNick
@property (nonatomic, copy  ) NSString  *sendNick;
// send_uid -> sendUid
@property (nonatomic, assign) NSInteger sendUid;
@property (nonatomic, copy  ) NSString  *rank;
// icon_url -> iconUrl
@property (nonatomic, copy  ) NSString  *iconUrl;
@property (nonatomic, copy  ) NSString  *icon;

@end
