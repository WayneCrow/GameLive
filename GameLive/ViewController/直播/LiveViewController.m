//
//  LiveViewController.m
//  GameLive
//  直播页面
//  Created by tarena11 on 16/7/29.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveViewModel.h"
#import "LiveCell.h"
#import "SearchViewModel.h"
#import "LiveRoomViewController.h"

@import AVKit;
@import AVFoundation;

@interface LiveViewController ()<UISearchBarDelegate>

@property (nonatomic) LiveViewModel   *liveListVM;
@property (nonatomic) SearchViewModel *searchVM;
@property (nonatomic) BOOL            isSearchVC;
@property (nonatomic) NSString        *searchInfo;

@end

@implementation LiveViewController

#pragma mark - LifeCycle (生命周期)

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout isSeachVC:(BOOL)isSearch searchInfo:(NSString *)searchInfo
{
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.isSearchVC = isSearch;
        self.searchInfo = searchInfo;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:@"Cell"];
    
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
    
    __weak typeof(self) weakSelf = self;
    
    [self.collectionView addHeaderRefresh:^{
        
        if (weakSelf.isSearchVC) {
            [weakSelf.searchVM postDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }
        else {
            [weakSelf.liveListVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }
    }];
    
    [self.collectionView beginHeaderRefresh];
    
    [self.collectionView addFooterRefresh:^{
        
        if (weakSelf.isSearchVC) {
            [weakSelf.searchVM postDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
                
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView endFooterRefresh];
            }];
        }
        else {
            [weakSelf.liveListVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
                
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView endFooterRefresh];
            }];
        }
    }];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (self.isSearchVC) {
        return self.searchVM.rowNumber;
    }
    else {
        return self.liveListVM.rowNumber;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (self.isSearchVC) {
        [cell.coverIV setImageWithURL:[self.searchVM coverURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
        cell.nickNameLB.text     = [self.searchVM nickNameForRow:indexPath.row];
        cell.onlineNumberLB.text = [self.searchVM onlineCountForRow:indexPath.row];
        cell.roomTitleLB.text    = [self.searchVM titleForRow:indexPath.row];
        
        return cell;
    }
    else {
        [cell.coverIV setImageWithURL:[self.liveListVM coverURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
        cell.nickNameLB.text     = [self.liveListVM nickNameForRow:indexPath.row];
        cell.onlineNumberLB.text = [self.liveListVM onlineCountForRow:indexPath.row];
        cell.roomTitleLB.text    = [self.liveListVM titleForRow:indexPath.row];
        
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    AVPlayerViewController *vc = [AVPlayerViewController new];
//    if (self.isSearchVC) {
//        vc.player = [AVPlayer playerWithURL:[self.searchVM uidForRow:indexPath.row].crow_VideoURL];
//    }
//    else {
//        vc.player = [AVPlayer playerWithURL:[self.liveListVM uidForRow:indexPath.row].crow_VideoURL];
//    }
//    [vc.player play];
//    
//    [self presentViewController:vc animated:YES completion:nil];
    
    if (self.isSearchVC) {
        LiveRoomViewController *vc = [[LiveRoomViewController alloc] initWithUid:[self.searchVM uidForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        LiveRoomViewController *vc = [[LiveRoomViewController alloc] initWithUid:[self.liveListVM uidForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - LazyLoad (懒加载)

- (LiveViewModel *)liveListVM {
	if(_liveListVM == nil) {
		_liveListVM = [[LiveViewModel alloc] init];
	}
	return _liveListVM;
}

- (SearchViewModel *)searchVM {
	if(_searchVM == nil) {
		_searchVM = [[SearchViewModel alloc] initWithSearchInfo:self.searchInfo];
	}
	return _searchVM;
}

- (BOOL)isSearchVC {
	if(!_isSearchVC) {
		_isSearchVC = NO;
	}
	return _isSearchVC;
}

- (NSString *)searchInfo {
	if(_searchInfo == nil) {
		_searchInfo = [[NSString alloc] init];
	}
	return _searchInfo;
}

@end
