//
//  RegisterViewController.m
//  GameLive
//
//  Created by tarena11 on 16/8/9.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "RegisterViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface RegisterViewController ()

@property (weak, nonatomic  ) IBOutlet UITextField *phoneNumberTF;
@property (weak, nonatomic  ) IBOutlet UITextField *authCodeTF;
@property (weak, nonatomic  ) IBOutlet UIButton    *getAuthCodeButton;
@property (nonatomic, assign) NSInteger   countTime;
@property (weak, nonatomic) IBOutlet UITextField *userNickNameTF;
@property (weak, nonatomic) IBOutlet UITextField *userPassworkTF;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor   = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets           = NO;
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelClick)];
}

- (void)cancelClick {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)getAuthCodeButton:(id)sender {
    
    if (self.phoneNumberTF.text.length == 11) {
        
#warning 需取消注释打开验证
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumberTF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
            if (error) {
                
                NSString *err     = [NSString stringWithFormat:@"%@", error];
                NSString *warning = [err componentsSeparatedByString:@"="].lastObject;
                warning           = [warning componentsSeparatedByString:@"}"].firstObject;
                
                UIAlertController *ac  = [UIAlertController alertControllerWithTitle:@"发送失败" message:(error) ? [NSString stringWithFormat:@"错误：%@", warning] : @"" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [ac addAction:action1];
                
                [self presentViewController:ac animated:YES completion:nil];
            }
            else {
                self.getAuthCodeButton.userInteractionEnabled = NO;
                
                [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
                    
                    [self.getAuthCodeButton setTitle:[NSString stringWithFormat:@"%ld秒", self.countTime--] forState:UIControlStateNormal];
                    
                    if ([self.getAuthCodeButton.titleLabel.text isEqualToString:@"1秒"]) {
                        [timer invalidate];
                        self.getAuthCodeButton.userInteractionEnabled = YES;
                        [self.getAuthCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                    }
                } repeats:YES];
            }
        }];
    }
    else {
        UIAlertController *ac  = [UIAlertController alertControllerWithTitle:@"失败" message:@"请输入正确手机号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [ac addAction:action1];
        
        [self presentViewController:ac animated:YES completion:nil];
    }
}

- (IBAction)registerButton:(id)sender {
    
    if (_userNickNameTF.text.length == 0 || _userPassworkTF.text.length == 0) {
        
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"错误" message:@"账户或密码为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [ac addAction:action1];
        [self presentViewController:ac animated:YES completion:nil];
        
        return;
    }
    
    // 通过返回值，判断是否注册成功。可以推断是同步方法
    // 一般通过block回调获取返回值的，基本是异步
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 注意：为了用户安全要对密码进行 MD5 加密，YYKit 项目
        /*
         EMError *error = [[EMClient sharedClient] registerWithUsername:_phoneNumberTF.text password:_passwordTF.text.md5String];
         NSLog(@"%@", error ? error : @"注册成功");
         */
        
        EMError *error = [[EMClient sharedClient] registerWithUsername:_userNickNameTF.text.md5String password:_userPassworkTF.text.md5String];
        NSLog(@"%@", error ? error.errorDescription : @"注册成功");
        
        if (error) {
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"错误" message:[NSString stringWithFormat:@"%@", error.errorDescription] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [ac addAction:action1];
            
            [self presentViewController:ac animated:YES completion:nil];
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"请在登陆界面输入账户密码登陆" preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:ac animated:YES completion:nil];
                sleep(3);
            });
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)countTime {
	if(!_countTime) {
		_countTime = 60;
	}
	return _countTime;
}

@end
