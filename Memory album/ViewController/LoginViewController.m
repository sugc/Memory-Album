//
//  LoginViewController.m
//  Memory album
//
//  Created by sugc on 16/2/29.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "UIView+MAUtils.h"
#import "MAUserRequestApi.h"
#import "MARegisterViewController.h"

@interface LoginViewController ()<userApiProtocol,UITextViewDelegate>

@property (nonatomic, strong) UIImageView *backGroudView;
@property (nonatomic, strong) UITextView *nameTextView;
@property (nonatomic, strong) UITextView *pwdTextView;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) MAUserRequestApi *userApi;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *pwdLabel;

@end


@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.backGroudView];
    [self.view addSubview:self.nameTextView];
    [self.view addSubview:self.pwdTextView];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.cancelButton];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (MAUserRequestApi *)userApi{
    if (!_userApi) {
        _userApi = [[MAUserRequestApi alloc] init];
        _userApi.delegate = self;
    }
    return _userApi;
}
- (UIImageView *)backGroudView{
    if (!_backGroudView) {
        _backGroudView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroudView.image = [UIImage imageNamed:@"loginBackGround.jpeg"];
    }
    return _backGroudView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameTextView.left, self.nameTextView.top - 30 - 40, self.nameTextView.width, 40)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = @"时光相册";
        _titleLabel.textColor = [UIColor whiteColor];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

- (UITextView *)nameTextView{
    if (!_nameTextView) {
        _nameTextView = [[UITextView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2.0, 200, 200, 30)];
        _nameTextView.delegate = self;
        _nameTextView.tag = 1;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _nameTextView.width, _nameTextView.height)];
        _nameLabel.text = @" 账号";
        _nameLabel.textColor = [UIColor grayColor];
        [_nameTextView addSubview:_nameLabel];
        
    }
    return _nameTextView;
}

- (UITextView *)pwdTextView{
    if (!_pwdTextView) {
        _pwdTextView = [[UITextView alloc] initWithFrame:CGRectMake(_nameTextView.left, _nameTextView.bottom + 15, _nameTextView.width, _nameTextView.height)];
        _pwdTextView.secureTextEntry = YES;
        _pwdTextView.delegate = self;
        _pwdTextView.tag = 2;
        [_pwdTextView setSecureTextEntry:YES];
        
        _pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _pwdTextView.width, _pwdTextView.height)];
        _pwdLabel.text = @" 密码";
        _pwdLabel.textColor = [UIColor grayColor];
        [_pwdTextView addSubview:_pwdLabel];
    }
    return _pwdTextView;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
       
        _loginButton= [[UIButton alloc] initWithFrame:CGRectMake(_pwdTextView.right - 60, _pwdTextView.bottom + 20, 40, 30)];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    }
    return  _loginButton;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
         _registerButton = [[UIButton alloc] initWithFrame:CGRectMake(_pwdTextView.left + 20, _pwdTextView.bottom + 20, 40, 30)];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(goToRegister) forControlEvents:UIControlEventTouchDown];
        
    }
    return _registerButton;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 25, 40, 30)];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        
        [_cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (void)login{
    if ([self.nameTextView.text isEqualToString:@""] ||[self.nameTextView.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"输入不能为空" message:NULL delegate:NULL cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }else{
    
        [self.userApi loginWithUserName:self.nameTextView.text andPwd:self.pwdTextView.text];
    }
    
}

- (void)goToRegister{
    MARegisterViewController *registerVC = [[MARegisterViewController alloc] init];
    [self presentViewController:registerVC animated:NO completion:^(void){
    
    }];
}

- (void)cancel{
    [self dismissViewControllerAnimated:NO completion:^(void){}];
}

//***********************************************************************

- (void)textViewDidChange:(UITextView *)textView{
    
    if ([textView.text isEqualToString:@""]) {
        
        if (textView.tag == 1) {
            [_nameLabel setHidden:NO];
        }else{
            [_pwdLabel setHidden:NO];
        }
        
    }else{
        if (textView.tag == 1) {
            [_nameLabel setHidden:YES];
        }else{
            [_pwdLabel setHidden:YES];
        }
    }

}

- (void)loginSuccess{
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

- (void)loginFaild{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"" delegate:NULL cancelButtonTitle:@"确定" otherButtonTitles: nil];
    alertView.frame =CGRectMake(([UIScreen mainScreen].bounds.size.width - 150) /2.0, ([UIScreen mainScreen].bounds.size.height - 80)/2.0, 150, 80);
    [alertView show];
}

- (void)isUserNameCanBeUsed:(BOOL)flag{
    if (flag) {
        
    }else{
        
        
    }

}

@end