//
//  MAProfileSettingView.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MAUserProfile.h"
#import "MAProfileSettingViewController.h"
#import "MAProfileSettingViewHelper.h"
#import "MAContext.h"
@interface MAProfileSettingViewController ()

@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, strong) MAProfileSettingViewHelper *helper;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *backGroudView;
@property (nonatomic, strong) UIButton *praiseButton;
@property (nonatomic, strong) UIButton *setBackGroudButton;
@property (nonatomic, strong) UIButton *returnButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, assign) BOOL isSelf;
@property (nonatomic, assign) MAUserProfile *userProfile;
@end

@implementation MAProfileSettingViewController

- (void)viewDidLoad{
    [super viewDidLoad];
   
    
    _ratio = [UIScreen mainScreen].bounds.size.width / 375.0;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}



- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.bounces = NO;
        _tableView.tableHeaderView = self.backGroudView;
        
        _tableView.delegate = self;
        _tableView.dataSource = self.helper;
    }
    return _tableView;
}

- (MAProfileSettingViewHelper *)helper{
    if (!_helper) {
        _helper = [[MAProfileSettingViewHelper alloc] init];
    }
    return  _helper;
}
- (UIImageView *)backGroudView{
    if (!_backGroudView) {
        _backGroudView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 235 * _ratio)];
        _backGroudView.image = [UIImage imageNamed:@"backGroud.jpg"];
        
       UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.backGroudView.bottom - 30, 60, 60)];
        avatarView.image = [UIImage imageNamed:@"avatar.png"];
        
        avatarView.layer.cornerRadius = 30;
        avatarView.layer.masksToBounds = YES;
        [_backGroudView addSubview:avatarView];
        [_backGroudView addSubview:self.returnButton];
        [_backGroudView addSubview:self.rightButton];
        _backGroudView.userInteractionEnabled = YES;
        
    }
    return _backGroudView;
}

- (UIButton *)returnButton{
    if (!_returnButton) {
        _returnButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 40, 40)];
        [_returnButton setTitle:@"返回" forState:UIControlStateNormal];
        [_returnButton addTarget:self action:@selector(clickReturnButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnButton;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(self.backGroudView.right - 45, self.returnButton.top, 40, 40)];
        [_rightButton setTitle:@"修改" forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(changeUserInfo) forControlEvents:UIControlEventTouchUpInside];

    }
    return _rightButton;
}

- (void)refreshWithUserProfile:(MAUserProfile *)userProfile{
    
    _userProfile = userProfile;
    if ([userProfile.userName isEqualToString:[[MAContext sharedContext] localUserProfile].userName]) {
        _isSelf = YES;
         [self.rightButton setTitle:@"编辑" forState:UIControlStateNormal];
    }else{
        _isSelf = NO;
        [self.rightButton setTitle:@"➕" forState:UIControlStateNormal];
    }
}
- (void)clickReturnButton{
    [self dismissViewControllerAnimated:NO completion:^(void){}];
}

- (void)clickRightButton{
    if (_isSelf) {
        
    }else{
    
    
    }
}






@end