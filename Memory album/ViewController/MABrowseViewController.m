//
//  MABrowseViewController.m
//  Memory album
//
//  Created by sugc on 16/2/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MABrowseViewController.h"
#import "MABrowseViewHelper.h"
#import "MAProfileView.h"


@interface MABrowseViewController ()

@property (nonatomic, strong) MABrowseViewHelper *helper;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *albumTableView;

@property (nonatomic, strong) UIImageView *titleView;
@end

@implementation MABrowseViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.titleView];
    [self.scrollView addSubview:self.albumTableView];
    [self.scrollView addSubview:self.profileView];
    self.tabBarItem.title = @"发现";
    self.tabBarItem.image = [UIImage imageNamed:@"findIcon@3x.png"];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated{
    self.scrollView.contentOffset = CGPointMake(0.8 *[UIScreen mainScreen].bounds.size.width, 0);
}

- (void)reSet{
    self.scrollView.contentOffset = CGPointZero;
}
- (UIImageView *)titleView{
    if (!_titleView) {
        _titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0.8 * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 70)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _titleView.width, _titleView.height - 30)];
        titleLabel.text = @"发现";
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
//        _albumTableView.delegate = self.helper;
//        _albumTableView.dataSource = self.helper;
        
        _albumTableView.backgroundColor = [UIColor blueColor];
    }
    return _albumTableView;
}

- (MABrowseViewHelper *)helper{
    if (!_helper) {
        _helper = [[MABrowseViewHelper alloc] init];
    }
    return _helper;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height  - 49)];
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width *1.8, 0);
        _scrollView.pagingEnabled = YES;

        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor grayColor];
     
    }
    return _scrollView;
}

- (MAProfileView *)profileView{
    if (!_profileView) {
        _profileView = [[MAProfileView alloc] initWithFrame:CGRectMake(0, 0, 0.8 * [UIScreen mainScreen].bounds.size.width, self.scrollView.height)];
    }
    return _profileView;
}
@end