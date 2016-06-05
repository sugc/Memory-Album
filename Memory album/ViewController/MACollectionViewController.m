//
//  MACollectionViewController.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MACollectionViewController.h"
#import "MACollectionViewControllerHelper.h"
#import "MAUserProfile.h"
#import "MAProfileView.h"
#import "MJRefresh.h"
#import "MAUserRequestApi.h"
#import "MAContext.h"

@interface MACollectionViewController ()<UIScrollViewDelegate,userApiProtocol>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *albumTableView;

@property (nonatomic, strong) MACollectionViewControllerHelper *helper;
@property (nonatomic, strong) UIImageView *titleView;

@end

@implementation MACollectionViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.titleView];
    [self.scrollView addSubview:self.albumTableView];
    [self.scrollView addSubview:self.profileView];
    self.tabBarItem.title = @"好友";
    self.tabBarItem.image = [UIImage imageNamed:@"friendIcon@3x.png"];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (UIImageView *)titleView{
    if (!_titleView) {
        _titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0.8 * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 70)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _titleView.width, _titleView.height - 30)];
        titleLabel.text = @"好友";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleView.backgroundColor = [UIColor blueColor];
        UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 14 - 20, 35, 30, 30)];
        [addButton setTitle:@"➕" forState:UIControlStateNormal];
        [_titleView addSubview:titleLabel];
        [_titleView addSubview:addButton];
        
        [addButton addTarget:self action:@selector(addAlbum) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleView;
}


- (UITableView *)albumTableView{
    if (!_albumTableView) {
        _albumTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.8 * [UIScreen mainScreen].bounds.size.width, self.titleView.bottom, self.scrollView.frame.size.width, self.scrollView.frame.size.height - self.titleView.height)];
            _albumTableView.delegate = self.helper;
            _albumTableView.dataSource = self.helper;

        _albumTableView.backgroundColor = [UIColor grayColor];
        _albumTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^(void){
            if ([[MAContext sharedContext] localUserProfile].userName!= NULL) {
                MAUserRequestApi *userApi = [[MAUserRequestApi alloc] init];
                userApi.delegate = self;
                [userApi getFriendsWithUserName:[[MAContext sharedContext] localUserProfile].userName ];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请先登录" message:NULL delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: @"确定",nil];
                [alert show];
                
            }

          
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
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}

- (MAProfileView *)profileView{
    if (!_profileView) {
        _profileView = [[MAProfileView alloc] initWithFrame:CGRectMake(0, 0, 0.8 * [UIScreen mainScreen].bounds.size.width, self.scrollView.height)];
    }
    return _profileView;
}

- (MACollectionViewControllerHelper *)helper{
    if (!_helper) {
        _helper = [[MACollectionViewControllerHelper alloc] init];
    }
    return _helper;
}

//*********************************delegate

- (void)okSelector:(id)responseObject{
    NSDictionary *dic = responseObject;
    NSArray *array = [[dic objectForKey:@"returnObject"] objectForKey:@"friendsList"];
    [self.helper setData:array];
    [self.albumTableView reloadData];
    [self.albumTableView.header endRefreshing ];
}

- (void)erroSelector:(id)responseObject{
     [self.albumTableView.header endRefreshing ];
}
- (void)failSelector:(NSError *)erro{
     [self.albumTableView.header endRefreshing ];
}
@end