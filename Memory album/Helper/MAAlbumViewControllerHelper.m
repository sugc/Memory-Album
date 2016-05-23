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
#import "MAAlbumEntranceTableViewCell.h"
#import "MAAlbum.h"
#import "MAPhotoViewController.h"
#import "MAContext.h"

@interface MAAlbumViewControllerHelper ()

//@property (nonatomic, strong) MAAlbumViewDataManager *manager;
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation MAAlbumViewControllerHelper

- (instancetype)init{
    self = [super init];
    if (self) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setData:(NSArray *) dataArray{
    [_dataArray removeAllObjects];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dic = [dataArray objectAtIndex:i];
        MAAlbum *album = [[MAAlbum alloc] initWithDictionary:dic];
        [_dataArray addObject:album];
    }
    
}
#pragma mark -- tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MAAlbumEntranceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.sugc.albumCell"];
    if (!cell) {
        cell = [[MAAlbumEntranceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"com.sugc.albumcell"];
        
    }
//    ALAsset *asset = [[_manager.photoArray objectAtIndex:indexPath.row] firstObject];
//    CGImageRef thum = [asset thumbnail];
//    UIImage *image = [UIImage imageWithCGImage:thum];
//    cell.imageView.image = image;
    if (indexPath.row <= _dataArray.count) {
        
        [cell refreshWithAlbum:[_dataArray objectAtIndex:indexPath.row]];
    }

    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [MAAlbumEntranceTableViewCell cellHeight];
}


#pragma mark -- tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    MAPhotoViewController *photoVC = [[MAPhotoViewController alloc] init];
    [[[MAContext sharedContext] tabBarController] presentViewController:photoVC animated:NO completion:^(void){
        [photoVC refreshWithAlbum:[_dataArray objectAtIndex:indexPath.row]];
    
    }];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteAlbumAtIndex:indexPath.row];
    }
    
    
}

- (void)deleteAlbumAtIndex:(NSInteger)index{

}
- (nullable NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
    
    }];
    
    
    
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        
    }];

    return @[deleteAction,editAction];

}

- (void)okSelector:(id)responseObject{
    
    
}

- (void)erroSelector:(id)responseObject{
    
    
}

- (void)failSelector:(NSError *)erro{
    
    
}

@end