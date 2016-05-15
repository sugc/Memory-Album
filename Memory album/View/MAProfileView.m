//
//  MAProfileView.m
//  Memory album
//
//  Created by sugc on 16/2/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAProfileView.h"
#import "MAUserBasicInfoView.h"
#import "MAUserProfile.h"
#import "MAContext.h"
#import "UIView+MAUtils.h"
@interface MAProfileView ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UIImageView *backGroundView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MAUserBasicInfoView *basicInfoView;

@end

@implementation MAProfileView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backGroundView];
        [self addSubview:self.basicInfoView];
        [self addSubview:self.tableView];
        [self refreshWithUserProfile:[[MAContext sharedContext] localUserProfile]];

    }
    return self;
}

- (void)configureLayout{
    
 
}

- (MAUserBasicInfoView *)basicInfoView{
    if (!_basicInfoView) {
        _basicInfoView = [[MAUserBasicInfoView alloc] init];
        _basicInfoView.backgroundColor = [UIColor whiteColor];
    }
    return _basicInfoView;
}

- (UIImageView *)backGroundView{
    if (!_backGroundView) {
        _backGroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backGroundView.image = [UIImage imageNamed:@"ProfileViewBackGround.jpg"];
    }
    return _backGroundView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.basicInfoView.bottom, self.width, self.height - self.basicInfoView.bottom) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
//- (UILabel *)addressLabel{
//    if (!_addressLabel) {
//        _addressLabel = [[UILabel alloc] initWithFrame:self.bounds];
//        
//    }
//    return _addressLabel;
//
//}
//
//- (UILabel *)sexLabel{
//    if (!_sexLabel) {
//        _sexLabel = [[UILabel alloc] init];
//
//    return _sexLabel;
//
//
//}
//- (UILabel *)constellationLabel{
//    if (!_constellationLabel) {
//        _constellationLabel = [[UILabel alloc] init];
//    }
//    return _constellationLabel;
//
//}

- (void)refreshWithUserProfile:(MAUserProfile *)userProfile{
    
    [self.basicInfoView refreshWithUserProfile:userProfile];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"profilecell"];
    cell.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds];
    [cell setSelectedBackgroundView:view];
    [cell.detailTextLabel setTextAlignment:NSTextAlignmentCenter];
    cell.imageView.alpha = 0.8;
    cell.imageView.layer.cornerRadius = 10;
    cell.imageView.layer.masksToBounds = YES;

    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"edit.jpg"];
            cell.textLabel.text = @"修改密码";
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"logout.jpg"];
            cell.textLabel.text = @"退出";
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"more.png"];
            cell.textLabel.text = @"更多";
            break;
//        case 3:
//            cell.imageView.image = [UIImage imageNamed:@"avatar.png"];
//            cell.textLabel.text = @"das";
//            break;
        default:
            break;
    }
   return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
@end