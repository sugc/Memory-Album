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

@interface LoginViewController ()

@property (nonatomic, strong) UIImageView *backGroudView;
@property (nonatomic, strong) UITextView *nameTextView;
@property (nonatomic, strong) UITextView *pwdTextView;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;

@end


@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (UIImageView *)backGroudView{
    if (!_backGroudView) {
        _backGroudView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _backGroudView;
}

- (UITextView *)nameTextView{
    if (!_nameTextView) {
        _nameTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    }
    return _nameTextView;
}

- (UITextView *)pwdTextView{
    if (!_pwdTextView) {
        _pwdTextView = [[UITextView alloc] initWithFrame:CGRectMake(_nameTextView.left, _nameTextView.bottom + 15, _nameTextView.width, _nameTextView.height)];
        _pwdTextView.secureTextEntry = YES;
    }
    return _pwdTextView;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(_pwdTextView.left, _pwdTextView.bottom + 20, 40, 30)];
        [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    }
    return  _loginButton;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc] initWithFrame:CGRectMake(_pwdTextView.right - 40, _pwdTextView.bottom + 20, 40, 30)];
        
        [_registerButton addTarget:self action:@selector(goToRegister) forControlEvents:UIControlEventTouchDown];
        
    }
    return _registerButton;
}


- (void)login{
    NSLog(@"login");
    
}

- (void)goToRegister{
    NSLog(@"register");
}

@end