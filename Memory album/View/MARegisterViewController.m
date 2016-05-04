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
@interface MARegisterView ()

@property(nonatomic, strong) UITextView *nameTextView;
@property(nonatomic, strong) UITextView *pwdTextView;
@property(nonatomic, strong) UITextView *rpwdTextView;
@property(nonatomic, strong) UIButton *registerButton;
@property(nonatomic, strong) UIButton *cancelButton;

@end


@implementation MARegisterView

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.nameTextView];
    [self.view addSubview:self.pwdTextView];
    [self.view addSubview:self.rpwdTextView];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.cancelButton];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];

}
-(UITextView *)nameTextView{
    if (!_nameTextView) {
        _nameTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width - 20 * 2, 20)];
    }
    return _nameTextView;
}

-(UITextView *)pwdTextView{
    if (!_pwdTextView) {
        _pwdTextView = [[UITextView alloc] initWithFrame:CGRectMake(self.nameTextView.left, self.nameTextView.bottom + 15, self.nameTextView.width, self.nameTextView.height)];
        
    }
    return _pwdTextView;
}

-(UITextView *)rpwdTextView{
    if (!_rpwdTextView) {
        _rpwdTextView = [[UITextView alloc] initWithFrame:CGRectMake(self.pwdTextView.left, self.pwdTextView.bottom + 15, self.pwdTextView.width, self.pwdTextView.height)];
    }
    return _rpwdTextView;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc] init];
        [_registerButton addTarget:self action:@selector(clickRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (void)clickRegisterButton{
    NSLog(@"register");
}
- (void)clickCancelButton{

    [self dismissViewControllerAnimated:NO completion:^(void){
        
    }];
}

@end