//
//  ChatListViewController.m
//  GameLive
//
//  Created by Wayne_Law on 16/8/10.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ChatListViewController.h"

// EaseUI 提供的 单聊 群聊 UI 界面
#import "ChatViewController.h"
// 群组聊天
#import "GroupListViewController.h"
// 通讯录
#import "ContactListViewController.h"
// 聊天记录
#import "ConversationListController.h"
// 添加好友
#import "AddFriendViewController.h"

@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark ButtonMethod


- (IBAction)chatButtonClick:(id)sender {
    
    ChatViewController *vc = [[ChatViewController alloc] initWithConversationChatter:@"Crow" conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)groupChatButtonClick:(id)sender {
    
    GroupListViewController *vc = [GroupListViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)addressBookButtonClick:(id)sender {
    
    ContactListViewController *vc = [ContactListViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)historyButtonClick:(id)sender {
    
    ConversationListController *vc = [ConversationListController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)addButtonClick:(id)sender {
    
    AddFriendViewController *vc = [AddFriendViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)backMainView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
