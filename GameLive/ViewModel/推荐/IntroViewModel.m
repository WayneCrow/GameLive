//
//  IntroViewModel.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "IntroViewModel.h"

@implementation IntroViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    self.dataTask = [NetManager getIntroListCompletionHandler:^(IntroModel *model, NSError *error) {
       
        if (!error) {
            
            _introIndexList    = model.mobileIndex;
            _introStarList     = model.mobileStar;
            _introRecommenList = model.mobileRecommendation;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            [model.list enumerateObjectsUsingBlock:^(IntroListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSString *slug = [self transformSlug:obj.slug];
                if (idx > 2) {
                    id ar = [model valueForKey:slug];
                    
                    if (ar) {
                        [tmpArray addObject:ar];
                    }
                }
            }];
            _introOtherList = tmpArray.copy;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSString *)transformSlug:(NSString *)slug {
    // 把 mobile-dnf 通过 - 分割为数组@[@"mobile", @"dnf"]
    NSArray *tmpArray = [slug componentsSeparatedByString:@"-"];
    // 数组中最后一个元素的头字母大写 dnf -> Dnf
    NSString *upLastStr = ((NSString *)tmpArray.lastObject).capitalizedString;
    // 重新拼接 mobilDnf
    slug = [tmpArray.firstObject stringByAppendingString:upLastStr];
    // 返回拼接出来的字符串
    return slug;
}

/****************** 头部滚动栏 ******************/

- (NSInteger)headRowNumber {
    return self.introIndexList.count;
}

- (NSURL *)headCoverImageURLForRow:(NSInteger)row {
    return self.introIndexList[row].linkObject.thumb.crow_URL;
}

- (NSString *)headTitleForRow:(NSInteger)row {
    return self.introIndexList[row].linkObject.title;
}

- (NSURL *)headLiveRoomURLForRow:(NSInteger)row {
    return self.introIndexList[row].linkObject.uid.crow_VideoURL;
}

/****************** 主播滚动栏 ******************/

- (NSInteger)starRowNumber {
    return self.introStarList.count;
}

- (NSURL *)starHeadImageForRow:(NSInteger)row {
    return self.introStarList[row].thumb.crow_URL;
}

- (NSString *)starNickNameForRow:(NSInteger)row {
    return self.introStarList[row].title;
}

- (NSURL *)starLiveRoomForRow:(NSInteger)row {
    return self.introStarList[row].linkObject.uid.crow_VideoURL;
}

/****************** 精彩推荐栏 ******************/

- (NSInteger)recommenRowNumber {
    return self.recommendRandomList.count;
//    return _introRecommenList.count > 2 ? 2 : _introRecommenList.count;
}

- (NSURL *)recommenCoverImageForRow:(NSInteger)row {
    return self.introRecommenList[row].linkObject.thumb.crow_URL;
}

- (NSString *)recommenNickNameForRow:(NSInteger)row {
    return self.introRecommenList[row].linkObject.nick;
}

- (NSString *)recommenOnlineCountForRow:(NSInteger)row {
    
    NSString *number = self.introRecommenList[row].linkObject.view;
    
    if ([self.introRecommenList[row].linkObject.view integerValue] >= 10000) {
        return [NSString stringWithFormat:@"%.1f万", [number integerValue] / 10000.0];
    }
    else {
        return number;
    }
}

- (NSString *)recommenTitleForRow:(NSInteger)row {
    return self.introRecommenList[row].linkObject.title;
}

- (NSString *)recommenUidForRow:(NSInteger)row {
    return self.introRecommenList[row].linkObject.uid;
}

- (void)changeRecommendRandomList {
    _recommendRandomList = nil;
}

- (NSArray<IntroMobileModel *> *)recommendRandomList {
    
    if (!_recommendRandomList) {
        
        if (_introRecommenList.count < 3) {
            _recommendRandomList = _introRecommenList;
        }
        else {
            NSInteger index0 = arc4random() % _introRecommenList.count;
            NSInteger index1 = 0;
            
            do {
                index1 = arc4random() % _introRecommenList.count;
            } while (index0 == index1);
            
            _recommendRandomList = @[_introRecommenList[index0], _introRecommenList[index1]];
        }
    }
    return _recommendRandomList;
}

/****************** 其他展示栏 ******************/

- (NSInteger)rowNumberAtSection:(NSInteger)section {
    return _introOtherList[section].count;
}

- (NSURL *)coverImageAtIndexPath:(NSIndexPath *)indexPath {
    return _introOtherList[indexPath.section][indexPath.row].linkObject.thumb.crow_URL;
}

- (NSString *)nickNameAtIndexPath:(NSIndexPath *)indexPath {
    return _introOtherList[indexPath.section][indexPath.row].linkObject.nick;
}

- (NSString *)titleAtIndexPath:(NSIndexPath *)indexPath {
    return _introOtherList[indexPath.section][indexPath.row].linkObject.title;
}

- (NSURL *)liveRoomURLAtIndexPath:(NSIndexPath *)indexPath {
    return _introOtherList[indexPath.section][indexPath.row].linkObject.uid.crow_VideoURL;
}

- (NSString *)viewAtIndexPath:(NSIndexPath *)indexPath {
    NSString *number = _introOtherList[indexPath.section][indexPath.row].linkObject.view;
    
    if ([number integerValue] >= 10000) {
        return [NSString stringWithFormat:@"%.1f万", [number integerValue] / 10000.0];
    }
    else {
        return number;
    }
}

- (NSString *)sectionOfTitleNameAtSection:(NSInteger)section {
    return _introOtherList[section].firstObject.linkObject.categoryName;
}

- (NSString *)slugAtSection:(NSInteger)section {
    return _introOtherList[section].firstObject.linkObject.categorySlug;
}

@end
