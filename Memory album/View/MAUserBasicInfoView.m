//
//  MAUserBAsicInfoView.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MAUserBasicInfoView.h"
#import "MAUserProfile.h"
#import "MAContext.h"
#import "MAProfileSettingViewController.h"
#import "LoginViewController.h"
#import "UIImageView+WebCache.h"

#define userBasicInfoViewWidth 0.8 * [UIScreen mainScreen].bounds.size.width
#define ratio   [UIScreen mainScreen].bounds.size.width / 375.0
@interface MAUserBasicInfoView()

@property (nonatomic, strong) MAUserProfile *userProfile;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signatureLabel;
@property (nonatomic, strong) UIButton *QRCodeButton;
@property (nonatomic, strong) UIButton *gotoProfileSettingButton;
@property (nonatomic, strong) UIImageView *sexImageView;
@end



@implementation MAUserBasicInfoView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0 , userBasicInfoViewWidth , 130 + 30 * ratio);
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.avatarView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.signatureLabel];
        [self addSubview:self.gotoProfileSettingButton];
        [self addSubview:self.QRCodeButton];
    }
   
    return self;
}

- (MAUserProfile *)userProfile{
    if (!_userProfile) {

    }
    return _userProfile;
}
- (UIImageView *)avatarView{
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 45, 50, 50)];
            
        _avatarView.layer.cornerRadius = _avatarView.width / 2.0;
        _avatarView.layer.masksToBounds = YES;

    }
    return _avatarView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.avatarView.right + 10, self.avatarView.top + 5, self.QRCodeButton.left - self.avatarView.right - 20, 20)];
        
        _nameLabel.text = @"longbuma";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        
    }
    return _nameLabel;
}

- (UILabel *)signatureLabel{
    if (!_signatureLabel) {
        _signatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.avatarView.center.x + 15, self.avatarView.bottom + 15, self.width - self.avatarView.center.x, 15)];
        
        
        _signatureLabel.font = [UIFont systemFontOfSize:13];
        _signatureLabel.textColor = [UIColor grayColor];
    }
    return _signatureLabel;
}

- (UIButton *)QRCodeButton{
    if (!_QRCodeButton) {
        _QRCodeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.right - 15 - 25, self.avatarView.top + 5, 25, 25)];
        [_QRCodeButton setImage:[UIImage imageNamed:@"QRCode.png"] forState:UIControlStateNormal];
        
        [_QRCodeButton addTarget:self action:@selector(clickQRButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _QRCodeButton;
}

- (UIImageView *)sexImageView{
    if (!_sexImageView) {
        _sexImageView = [[UIImageView alloc] init];
    }
    return _sexImageView;

}

- (UIButton *)gotoProfileSettingButton{
    if (!_gotoProfileSettingButton) {
        _gotoProfileSettingButton = [[UIButton alloc] initWithFrame:CGRectMake(self.avatarView.left, self.avatarView.top, self.nameLabel.width, self.avatarView.height + self.signatureLabel.height + 10)];
        _gotoProfileSettingButton.backgroundColor = [UIColor clearColor];
        [_gotoProfileSettingButton addTarget:self action:@selector(clickGotoProfileSettingButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _gotoProfileSettingButton;
}
- (void)clickQRButton{

    
}


- (void)clickGotoProfileSettingButton{
    
    
    if ([[MAContext sharedContext] localUserProfile] == NULL || [[MAContext sharedContext] localUserProfile].userName == NULL || [[[MAContext sharedContext] localUserProfile].userName isEqualToString:@""]) {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [[[MAContext sharedContext] tabBarController] presentViewController:loginVC animated:NO completion:^(void){}];
    }else{
    
        MAProfileSettingViewController *profileSettingVC = [[MAProfileSettingViewController alloc] init];
        [[[MAContext sharedContext] tabBarController] presentViewController:profileSettingVC animated:NO completion:^(void){}];
    }
    
    

}

- (void)refreshWithUserProfile:(MAUserProfile *)userProfile{
    self.nameLabel.text = userProfile.userName;
    self.signatureLabel.text = userProfile.signature;
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:userProfile.avatarUrl] placeholderImage:NULL];
}
@end
