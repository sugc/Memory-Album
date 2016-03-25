//
//  MARegisterView.m
//  Memory album
//
//  Created by 苏国材 on 16/3/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MARegisterView.h"

@interface MARegisterView ()

@property(nonatomic, strong) UITextView *nameTextView;
@property(nonatomic, strong) UITextView *pwdTextView;
@property(nonatomic, strong) UITextView *rpwdTextView;
@property(nonatomic, strong) UIButton *registerButton;
@property(nonatomic, strong) UIButton *cancelButton;

@end


@implementation MARegisterView

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(UITextView *)nameTextView{
    if (!_nameTextView) {
        _nameTextView = [[UITextView alloc] init];
    }
    return _nameTextView;
}

-(UITextView *)pwdTextView{
    if (!_pwdTextView) {
        _pwdTextView = [[UITextView alloc] init];
    }
    return _pwdTextView;
}

-(UITextView *)rpwdTextView{
    if (!_rpwdTextView) {
        _rpwdTextView = [[UITextView alloc] init];
    }
    return _rpwdTextView;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc] init];
    }
    return _registerButton;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
    }
    return _cancelButton;
}



@end