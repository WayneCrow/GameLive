//
//  ProgramRoomViewController.m
//  GameLive
//
//  Created by tarena11 on 16/8/2.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ProgramRoomViewController.h"
#import "ProgramRoomViewModel.h"
#import "ProgramRoomCell.h"

@import AVKit;
@import AVFoundation;

@interface ProgramRoomViewController ()

@property (nonatomic) ProgramRoomViewModel *programRoomVM;

@end

@implementation ProgramRoomViewController

#pragma mark - LifeCycle (生命周期)

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithSlug:(NSString *)slug {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    CGFloat itemWidth  = (kScreenW - 10 * 3) / 2;
    CGFloat itemHeight = itemWidth * 219 / 390 + 30;
    
    layout.minimumLineSpacing      = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset            = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize                = CGSizeMake(itemWidth, itemHeight);
    
    if (self = [super initWithCollectionViewLayout:layout]) {
        //push操作时, 隐藏tabbar
        self.hidesBottomBarWhenPushed = YES;
        
        _slug = slug;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[ProgramRoomCell class] forCellWithReuseIdentifier:@"Cell"];
    
    self.collectionView.backgroundColor = kRGBA(234, 234, 234, 1);
    
    [Factory addBackItemForVC:self];
    
    __weak typeof(self) weakSelf = self;
    
    [self.collectionView addHeaderRefresh:^{
        
        [weakSelf.programRoomVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    
    [self.collectionView beginHeaderRefresh];
    
    [self.collectionView addFooterRefresh:^{
        
        [weakSelf.programRoomVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endFooterRefresh];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.programRoomVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProgramRoomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.coverIV setImageWithURL:[self.programRoomVM coverURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
    cell.nickNameLB.text     = [self.programRoomVM nickNameForRow:indexPath.row];
    cell.onlineNumberLB.text = [self.programRoomVM onlineCountForRow:indexPath.row];
    cell.roomTitleLB.text    = [self.programRoomVM titleForRow:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:[self.programRoomVM uidForRow:indexPath.row].crow_VideoURL];
    [vc.player play];
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - LazyLoad (懒加载)

- (ProgramRoomViewModel *)programRoomVM {
	if(_programRoomVM == nil) {
		_programRoomVM = [[ProgramRoomViewModel alloc] initWithSlug:_slug];
	}
	return _programRoomVM;
}

@end
