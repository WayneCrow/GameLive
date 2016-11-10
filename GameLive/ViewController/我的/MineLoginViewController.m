//
//  LoginViewController.m
//  GameLive
//
//  Created by tarena11 on 16/8/9.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "MineLoginViewController.h"

@interface MineLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTF;

@end

@implementation MineLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor   = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets           = NO;
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
}

- (IBAction)cancelBarItem:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginButtonClick:(id)sender {
    
    if (_userNameTF.text.length == 0 || _userPasswordTF.text.length == 0) {
        
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"错误" message:@"账户或密码为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [ac addAction:action1];
        [self presentViewController:ac animated:YES completion:nil];
        
        return;
    }
    
    [[NSOperationQueue new] addOperationWithBlock:^{
        
        // 注意：为了用户安全要对密码进行 MD5 加密，YYKit 项目
        /*
         EMError *error = [[EMClient sharedClient] registerWithUsername:_phoneNumberTF.text password:_passwordTF.text.md5String];
         NSLog(@"%@", error ? error : @"注册成功");
         */
        BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
        
        if (!isAutoLogin) {
            EMError *error = [[EMClient sharedClient] loginWithUsername:_userNameTF.text.md5String password:_userPasswordTF.text.md5String];
            if (!error) {
                NSLog(@"登录成功");
                
                [self dismissViewControllerAnimated:YES completion:nil];
                
                // 自动登陆
                [[EMClient sharedClient].options setIsAutoLogin:YES];
            }
            else {
                NSLog(@"Error:%@", error.errorDescription);
                
                UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"错误" message:[NSString stringWithFormat:@"%@", error.errorDescription] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [ac addAction:action1];
                [self presentViewController:ac animated:YES completion:nil];
            }
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
