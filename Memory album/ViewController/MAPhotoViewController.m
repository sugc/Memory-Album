//
//  MAPhotoViewController.m
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPhotoViewController.h"
#import "UIView+MAUtils.h"
#import "MAAlbum.h"
#import "MAPhotoRequestApi.h"
#import "MAPhotoViewControllerHelper.h"
#import "MJRefresh.h"

@interface MAPhotoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UIButton *addPhotoButton;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *albumNameLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *editButton;
@property (nonatomic, strong) MAPhotoViewControllerHelper *helper;
@property (nonatomic, strong) MAAlbum *album;
@property (nonatomic, strong) MAPhotoRequestApi *api;

@end

@implementation MAPhotoViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.headImageView];
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (UIButton *)addPhotoButton{
    if (!_addPhotoButton) {
        _addPhotoButton = [[UIButton alloc] initWithFrame:CGRectMake(self.headImageView.right  - 35, self.backButton.top, 30, self.backButton.height)];
        [_addPhotoButton setTitle:@"➕" forState:UIControlStateNormal];
        [_addPhotoButton addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _addPhotoButton;
}

- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 25, 30, self.headImageView.height - 25)];
        [_backButton setTitle:@"⬅️" forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        _headImageView.backgroundColor = [UIColor blueColor];
        _headImageView.userInteractionEnabled = YES;
        [_headImageView addSubview:self.backButton];
        [_headImageView addSubview:self.albumNameLabel];
        [_headImageView addSubview:self.editButton];
        [_headImageView addSubview:self.addPhotoButton];
        
    }
    return _headImageView;
}


- (UILabel *)albumNameLabel{
    if (!_albumNameLabel) {
        _albumNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.backButton.right +5, self.backButton.top, 30, self.backButton.height)];
        _albumNameLabel.font = [UIFont systemFontOfSize:20];
    }
    return _albumNameLabel;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.headImageView.bottom, self.headImageView.width, [UIScreen mainScreen].bounds.size.height - self.headImageView.bottom)];
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.delegate = self.helper;
        _tableView.dataSource = self.helper;
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^(void){
            [self.api getImageWithAid:self.album.aid];
            
        }];
        
    }
    return _tableView;
}

- (MAPhotoViewControllerHelper *)helper{
    if (!_helper) {
        _helper = [[MAPhotoViewControllerHelper alloc] init];
    }
    return _helper;
}

- (UIButton *)editButton{
    if (!_editButton) {
        _editButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.backButton.top, 30, self.backButton.height)];
    }
    return _editButton;
}

- (MAPhotoRequestApi *)api{
    if (!_api) {
        _api = [[MAPhotoRequestApi alloc] init];
        _api.target = self;
    }
    return _api;
}
- (void)goBack{
    [self dismissViewControllerAnimated:NO completion:^(void){}];
}

- (void)refreshWithAlbum:(MAAlbum *)album{
    _album = album;
    CGSize size = [_album.albumName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    self.albumNameLabel.frame = CGRectMake(self.albumNameLabel.left,  self.backButton.top + (self.backButton.height - size.height) / 2.0, size.width, size.height);
    self.albumNameLabel.text = _album.albumName;
    self.editButton.frame = CGRectMake(self.albumNameLabel.right + 5,self.backButton.top - size.height , self.editButton.width, self.editButton.height);
}

- (void)addPhoto{
  
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *pikerVC = [[UIImagePickerController alloc] init];
        [pikerVC setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        pikerVC.allowsEditing = YES;

        [self presentViewController:pikerVC animated:NO completion:^(void){}];
        [pikerVC setDelegate:self];
        
        
    }
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *image = NULL;
    if ([picker allowsEditing]) {
        image = [info objectForKey:UIImagePickerControllerEditedImage];
    }else{
    
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
           }

    [self.api postPhotoWithImage:image andAid:self.album.aid];
    [picker dismissViewControllerAnimated:NO completion:^(void){}];
}



- (void)okSelector:(id)responseObject{
    NSDictionary *dic = [responseObject objectForKey:@"returnObject"];
    NSString *type = [dic objectForKey:@"type"];
    if ([type isEqualToString:@"photoList"]) {
        NSArray *array = [dic objectForKey:@"photoList"];
        [self.helper setData:array];
    }else
        if ([type isEqualToString:@"pid"]) {
            NSString *pid = [dic objectForKey:@"pid"];
            NSDictionary *dic = @{@"pid":pid,@"aid":self.album.aid};
            NSArray *array = @[dic];
            [self.helper addMore:array];
        }
    
    [self.tableView reloadData];
    [self.tableView.header endRefreshing];
}
- (void)erroSelector:(id)responseObject{
     [self.tableView.header endRefreshing];
}
- (void)failSelector:(NSError *)erro{
    
     [self.tableView.header endRefreshing];
}

@end