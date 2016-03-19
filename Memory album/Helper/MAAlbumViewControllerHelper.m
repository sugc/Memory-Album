//
//  MAAlbumViewControllerHelper.m
//  Memory album
//
//  Created by sugc on 16/3/1.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIView+MAUtils.h"
#import "MAAlbumViewControllerHelper.h"
#import "MAAlbumViewDataManager.h"


@interface MAAlbumViewControllerHelper ()

@property (nonatomic, strong) MAAlbumViewDataManager *manager;
@end

@implementation MAAlbumViewControllerHelper

- (instancetype)init{
    self = [super init];
    if (self) {
        self.manager = [[MAAlbumViewDataManager alloc] init];
    }
    return self;
}
#pragma mark -- tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.sugc.albumCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"com.sugc.albumcell"];
        cell.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
        cell.imageView.frame =CGRectMake(5, 5, 30, 30);
            
    }
    ALAsset *asset = [[_manager.photoArray objectAtIndex:indexPath.row] firstObject];
    CGImageRef thum = [asset thumbnail];
    UIImage *image = [UIImage imageWithCGImage:thum];
    cell.imageView.image = image;
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _manager.photoArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}


#pragma mark -- tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end