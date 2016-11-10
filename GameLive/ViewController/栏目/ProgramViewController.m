//
//  ProgramViewController.m
//  GameLive
//  栏目页面
//  Created by tarena11 on 16/7/29.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramViewController.h"
#import "ProgramViewModel.h"
#import "ProgramCell.h"
#import "ProgramRoomViewController.h"
#import "LiveViewController.h"

@interface ProgramViewController ()<UISearchBarDelegate>

@property (nonatomic) ProgramViewModel *programVM;

@end

@implementation ProgramViewController

#pragma mark - LifeCycle (生命周期)

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[ProgramCell class] forCellWithReuseIdentifier:@"Cell"];
    
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
        
        [weakSelf.programVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.programVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProgramCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    [cell.coverIV setImageWithURL:[self.programVM coverURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"分类"]];
    cell.titleLB.text = [self.programVM titleForRow:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProgramRoomViewController *vc = [[ProgramRoomViewController alloc] initWithSlug:[self.programVM slugForRow:indexPath.row]];
    vc.title = [self.programVM titleForRow:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - LazyLoad (懒加载)

- (ProgramViewModel *)programVM {
	if(_programVM == nil) {
		_programVM = [[ProgramViewModel alloc] init];
	}
	return _programVM;
}

@end
