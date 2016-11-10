//
//  RequestPath.h
//  GameLive
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#ifndef RequestPath_h
#define RequestPath_h

#define kBasePath @"http://www.quanmin.tv"
//推荐页
#define kIntroPath @"/json/page/app-index/info.json"
//栏目列表
#define kProgramPath @"/json/categories/list.json"
//某栏目下的直播房间列表
#define kProgramRoomPath @"/json/categories/%@/list%@.json"
//直播房间列表
#define kLiveRoomListPath @"/json/play/list%@.json"
//搜索功能
#define kSearchPath @"/api/v1"


#endif /* RequestPath_h */
