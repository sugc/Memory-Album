//
//  MARegisterView.m
//  Memory album
//
//  Created by 苏国材 on 16/3/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MARegisterViewController.h"
#import "UIView+MAUtils.h"
#import "MAUserRequestApi.h"
@interface MARegisterViewController ()<userApiProtocol>

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UITextField *nameTextField;
@property(nonatomic, strong) UITextField *pwdTextField;
@property(nonatomic, strong) UITextField *rpwdTextField;
@property(nonatomic, strong) UIImageView *backGroudView;
@property(nonatomic, strong) UIButton *registerButton;
@property(nonatomic, strong) UIButton *cancelButton;
@property(nonatomic, strong) MAUserRequestApi *userApi;


@end


@implementation MARegisterViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.backGroudView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.pwdTextField];
    [self.view addSubview:self.rpwdTextField];
    [self.view addSubview:self.registerButton];
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
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameTextField.left, self.nameTextField.top - 30 - 30, self.nameTextField.width, 30)];
        _titleLabel.text = @"注册";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;

}
-(UIImageView *)backGroudView{
    if (!_backGroudView) {
        _backGroudView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroudView.image = [UIImage imageNamed:@"regsiterBackGround.jpg"];
    }
    return  _backGroudView;
}
-(UITextField *)nameTextField{
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 200, [UIScreen mainScreen].bounds.size.width - 60 * 2, 30)];
        _nameTextField.placeholder = @"账号";
        _nameTextField.backgroundColor = [UIColor whiteColor];
    }
    return _nameTextField;
}

-(UITextField *)pwdTextField{
    if (!_pwdTextField) {
        _pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.nameTextField.left, self.nameTextField.bottom + 15, self.nameTextField.width, self.nameTextField.height)];
        _pwdTextField.placeholder = @"密码";
        _pwdTextField.backgroundColor = [UIColor whiteColor];
        _pwdTextField.secureTextEntry = YES;
    }
    return _pwdTextField;
}

-(UITextField *)rpwdTextField{
    if (!_rpwdTextField) {
        _rpwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.pwdTextField.left, self.pwdTextField.bottom + 15, self.pwdTextField.width, self.pwdTextField.height)];
        _rpwdTextField.placeholder = @"重复密码";
        _rpwdTextField.secureTextEntry = YES;
        _rpwdTextField.backgroundColor = [UIColor whiteColor];
    }
    return _rpwdTextField;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc] init];
        [_registerButton addTarget:self action:@selector(clickRegisterButton) forControlEvents:UIControlEventTouchUpInside];
        _registerButton.frame = CGRectMake(self.rpwdTextField.left + 15, self.rpwdTextField.bottom + 25, self.rpwdTextField.width - 30, 30);
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        _registerButton.backgroundColor = [UIColor blueColor];
           }
    return _registerButton;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton.frame = CGRectMake(5, 10, 40, 30);
        [_cancelButton setTitle:@"返回" forState:UIControlStateNormal];

    }
    return _cancelButton;
}

- (void)clickRegisterButton{
    
    if ([self.nameTextField.text isEqualToString:@""] || [self.pwdTextField.text isEqualToString:@""]
        ||[self.rpwdTextField.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"输入不能为空请重新输入" message:NULL delegate:NULL cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];

        
    }else{
        if (![self.pwdTextField.text isEqualToString:self.rpwdTextField.text]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"两次输入密码不一致请重新输入" message:NULL delegate:NULL cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];

        }else{
            [self.userApi registerWithUserName:self.nameTextField.text andPwd:self.pwdTextField.text];
            
        }
    }
   }
- (void)clickCancelButton{

    [self dismissViewControllerAnimated:NO completion:^(void){
        
    }];
}


- (void)isUserNameCanBeUsed:(BOOL)flag{
    if (flag) {
        
    }else{
            }
}

@end