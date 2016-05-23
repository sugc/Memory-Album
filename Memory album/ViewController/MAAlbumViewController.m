//
//  MAAlbumViewController.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MAAlbumViewController.h"
#import "MAProfileView.h"
#import "MAAlbumViewControllerHelper.h"
#import "MAAlbumRequestApi.h"
#import "MJRefresh.h"
#import "MAContext.h"
#import "MAUserProfile.h"

@interface MAAlbumViewController ()<UIAlertViewDelegate,albumRequestProtocol>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *albumTableView;
@property (nonatomic, strong) MAAlbumRequestApi *api;
@property (nonatomic, strong) MAAlbumViewControllerHelper *helper;
@property (nonatomic, strong) UIImageView *titleView;
@end

@implementation MAAlbumViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.titleView];
    [self.scrollView addSubview:self.albumTableView];
    [self.scrollView addSubview:self.profileView];
    self.tabBarItem.title = @"相册";
    self.tabBarItem.image = [UIImage imageNamed:@"albumIcon@3x.png"];

}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentOffset = CGPointMake(0.8 *[UIScreen mainScreen].bounds.size.width, 0);
}
- (UITableView *)albumTableView{
    if (!_albumTableView) {
        _albumTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.8 * [UIScreen mainScreen].bounds.size.width, self.titleView.bottom, self.scrollView.frame.size.width, self.scrollView.frame.size.height - self.titleView.height)];
        _albumTableView.delegate =  self.helper;
        _albumTableView.dataSource = self.helper;
        
        _albumTableView.backgroundColor = [UIColor whiteColor];
        _albumTableView.header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^(void){
            MAAlbumRequestApi *refreshApi = [[MAAlbumRequestApi alloc] init];
            refreshApi.delegate = self;
            [refreshApi getAlbumsWithUserName:[[MAContext sharedContext] localUserProfile].userName];
        }];
    }
    return _albumTableView;
}


- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height  - 49)];
        
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width *1.8, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.contentOffset = CGPointMake(0.8 *[UIScreen mainScreen].bounds.size.width, 0);
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor redColor];
    }
    return _scrollView;
}



- (MAProfileView *)profileView{
    if (!_profileView) {
        _profileView = [[MAProfileView alloc] initWithFrame:CGRectMake(0, -0, 0.8 * [UIScreen mainScreen].bounds.size.width, self.scrollView.height)];
    }
    return _profileView;
}

- (id<UITableViewDelegate,UITableViewDataSource>)helper{
    if (!_helper) {
        _helper = [[MAAlbumViewControllerHelper alloc] init];
    }
    return _helper;
}

- (UIImageView *)titleView{
    if (!_titleView) {
        _titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0.8 * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 70)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _titleView.width, _titleView.height - 30)];
        titleLabel.text = @"相册";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 14 - 20, 35, 30, 30)];
        [addButton setTitle:@"➕" forState:UIControlStateNormal];
        [_titleView addSubview:titleLabel];
        [_titleView addSubview:addButton];
        _titleView.userInteractionEnabled = YES;
    
        _titleView.backgroundColor = [UIColor blueColor];
        [addButton addTarget:self action:@selector(addAlbum) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleView;
}

- (MAAlbumRequestApi *)api{
    if (!_api) {
        _api = [[MAAlbumRequestApi alloc] init];
        _api.delegate = self;
    }
    return _api;
}

- (void)addAlbum{
    UIAlertView *alert = [[UIAlertView alloc ] initWithTitle:@"创建相册" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    UITextField *nameFiled = [alert textFieldAtIndex:0];
    nameFiled.placeholder = @"输入相册名";
    UITextField *desFiled = [alert textFieldAtIndex:1];
    desFiled.secureTextEntry = NO;
    desFiled.placeholder = @"添加描述";
    [alert show];
}
- (void)dealloc{
    self.albumTableView.delegate = nil;
    self.albumTableView.dataSource = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self.api createAlbumWithAlbumName:[alertView textFieldAtIndex:0].text];
    }

}

- (void)okSelector:(id)responseObject{
   NSDictionary *dic = [responseObject objectForKey:@"returnObject"];
    NSArray *array = [dic objectForKey:@"albumList"];
    [self.helper setData:array];
    [self.albumTableView reloadData];
    [self.albumTableView.header endRefreshing];

}
- (void)erroSelector:(id)responseObject{
    
     [self.albumTableView.header endRefreshing];
}
- (void)failSelector:(NSError *)erro{

 [self.albumTableView.header endRefreshing];
}
@end

