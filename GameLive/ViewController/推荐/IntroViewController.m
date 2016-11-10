//
//  IntroViewController.m
//  GameLive
//  推荐页面
//  Created by tarena11 on 16/7/29.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "IntroViewController.h"
#import "IntroViewModel.h"
#import "IntroAdCell.h"
#import "IntroStarCell.h"
#import "SectionView.h"
#import "IntroRoomCell.h"
#import "ProgramRoomViewController.h"
#import "LiveViewController.h"

@import AVKit;
@import AVFoundation;

@interface IntroViewController ()<UICollectionViewDelegateFlowLayout, IntroHeaderAdDelegate, IntroHeaderAdDataSource, IntroStarDelegate, introStarDataSource, UISearchBarDelegate, UISearchBarDelegate>

@property (nonatomic) IntroViewModel *introListVM;

@end

@implementation IntroViewController

#pragma mark - LifeCycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = kRGBA(234, 234, 234, 1);
    
#warning 搜索逻辑
    [Factory addSearchItemForVC:self clickedHandler:^{
        UIView *searchBox = [UIView new];
        
        searchBox.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.7, 30);
        searchBox.layer.cornerRadius  = 15;
        searchBox.layer.masksToBounds = YES;
        
        UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:searchBox.frame];
        searchBar.placeholder = @"搜索直播间或主播名";
        searchBar.delegate    = self;
        
        [searchBox addSubview:searchBar];
        
        self.navigationItem.titleView = searchBox;
    }];
    
    [self.collectionView registerClass:[IntroAdCell class] forCellWithReuseIdentifier:@"AdCell"];
    [self.collectionView registerClass:[IntroStarCell class] forCellWithReuseIdentifier:@"StarCell"];
    [self.collectionView registerClass:[SectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionCell"];
    [self.collectionView registerClass:[IntroRoomCell class] forCellWithReuseIdentifier:@"RoomCell"];
    
    __weak typeof(self) weakSelf = self;
    
    [self.collectionView addHeaderRefresh:^{
        
        [weakSelf.introListVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SearchDelegate

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    CGFloat itemWidth  = (kScreenW - 10 * 3) / 2;
    CGFloat itemHeight = itemWidth * 219 / 390 + 30;
    
    layout.minimumLineSpacing      = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset            = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize                = CGSizeMake(itemWidth, itemHeight);
    
    LiveViewController *vc = [[LiveViewController alloc] initWithCollectionViewLayout:layout isSeachVC:YES searchInfo:searchBar.text];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - IntroHeader DataSource

- (NSInteger)headerNumberOfItems:(IntroAdCell *)introAdCell {
    return self.introListVM.headRowNumber;
}

- (NSURL *)headerIntroHeaderAdCell:(IntroAdCell *)introAdCell imagerURLForIndex:(NSInteger)index {
    return [self.introListVM headCoverImageURLForRow:index];
}

- (NSString *)headerIntroHeaderAdCell:(IntroAdCell *)introAdCell titleForIndex:(NSInteger)index {
    return [self.introListVM headTitleForRow:index];
}

- (void)introHeaderAdCell:(IntroAdCell *)introAdCell didSelectedItemAtIndex:(NSInteger)index {
        
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:[self.introListVM headLiveRoomURLForRow:index]];
    [vc.player play];
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - IntroStar DataSource

- (NSInteger)starNumberOfItems:(IntroStarCell *)introStarCell {
    return self.introListVM.starRowNumber;
}

- (NSURL *)starIntroStarCell:(IntroStarCell *)introStarCell imageURLForIndex:(NSInteger)index {
    return [self.introListVM starHeadImageForRow:index];
}

- (NSString *)starIntroStarCell:(IntroStarCell *)introStarCell starNameForIndex:(NSInteger)index {
    return [self.introListVM starNickNameForRow:index];
}

- (void)introStarCell:(IntroStarCell *)introStarCell didSelectedItemAtIndex:(NSInteger)index {
    
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:[self.introListVM starLiveRoomForRow:index]];
    [vc.player play];
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UICollectionView DataSource

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        SectionView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionCell" forIndexPath:indexPath];
        
        if (indexPath.section == 1) {
            view.sectionLB.text = @"推荐";
            view.cellType = RecommenTypeChanged;
            view.buttonClicked = ^(NSInteger section) {
                
                [self.introListVM changeRecommendRandomList];
                [collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
            };
        }
        if (indexPath.section > 1) {
            view.sectionLB.text = [self.introListVM sectionOfTitleNameAtSection:indexPath.section - 2];
            view.section = indexPath.section;
            view.buttonClicked = ^(NSInteger section) {
                
                ProgramRoomViewController *vc = [[ProgramRoomViewController alloc] initWithSlug:[self.introListVM slugAtSection:section - 2]];
                [self.navigationController pushViewController:vc animated:YES];
            };
            view.cellType = RecommenTypeMore;
        }
        return view;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section > 0) {
        // 宽度永远和collectionView相同
        return CGSizeMake(0, 50);
    }
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {
        return UIEdgeInsetsZero;
    }
    if (section == self.introListVM.introOtherList.count + 1) {
        return UIEdgeInsetsMake(0, 10, 10, 10);
    }
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            CGFloat width  = kScreenW;
            CGFloat height = kScreenW * 800 / 1440;
            
            return CGSizeMake(width, height);
        }
        else {
            return CGSizeMake(kScreenW, 100);
        }
    }
    
    CGFloat width  = (kScreenW - 10 * 3) / 2;
    CGFloat height = width * 219 / 390 + 30;
    
    return CGSizeMake(width, height);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2 + self.introListVM.introOtherList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        return self.introListVM.recommenRowNumber;
    }
    return [self.introListVM rowNumberAtSection:section - 2];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            IntroAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AdCell" forIndexPath:indexPath];
            
            cell.dataSource = self;
            cell.delegate   = self;
            
            [cell reloadData];
            
            return cell;
        }
        else {
            IntroStarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StarCell" forIndexPath:indexPath];
            
            cell.dataSource = self;
            cell.delegate   = self;
            
            [cell reloadData];
            
            return cell;
        }
    }
    else if (indexPath.section == 1) { // 推荐
        IntroRoomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RoomCell" forIndexPath:indexPath];
        
        [cell.coverIV setImageWithURL:[self.introListVM recommenCoverImageForRow:indexPath.row] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
        cell.nickNameLB.text     = [self.introListVM recommenNickNameForRow:indexPath.row];
        cell.onlineNumberLB.text = [self.introListVM recommenOnlineCountForRow:indexPath.row];
        cell.roomTitleLB.text    = [self.introListVM recommenTitleForRow:indexPath.row];
        
        return cell;
    }
    
    // 其他
    NSIndexPath *indexP = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
    
    IntroRoomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RoomCell" forIndexPath:indexP];
    
    [cell.coverIV setImageWithURL:[self.introListVM coverImageAtIndexPath:indexP] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
    cell.nickNameLB.text     = [self.introListVM nickNameAtIndexPath:indexP];
    cell.roomTitleLB.text    = [self.introListVM titleAtIndexPath:indexP];
    cell.onlineNumberLB.text = [self.introListVM viewAtIndexPath:indexP];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSURL *videoURL = nil;
    
    switch (indexPath.section) {
        case 0:
            return;
            break;
        case 1:
            videoURL = [self.introListVM recommenUidForRow:indexPath.row].crow_VideoURL;
            break;
            
        default:
        {
            NSIndexPath *indexP = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
            videoURL = [self.introListVM liveRoomURLAtIndexPath:indexP];
        }
            break;
    }
    
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:videoURL];
    DDLogInfo(@"%@", videoURL.absoluteString);
    [vc.player play];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
}

#pragma mark - LazyLoad (懒加载)

- (IntroViewModel *)introListVM {
	if(_introListVM == nil) {
		_introListVM = [[IntroViewModel alloc] init];
	}
	return _introListVM;
}

@end
