//
//  MAPhotoViewControllerHelper.m
//  Memory album
//
//  Created by 苏国材 on 16/5/17.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPhotoViewControllerHelper.h"
#import "MAPhotoTableViewCell.h"
#import "MAPhoto.h"
@interface MAPhotoViewControllerHelper ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MAPhotoViewControllerHelper

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
        MAPhoto *photo = [[MAPhoto alloc] initWithDictionary:dic];
        [_dataArray addObject:photo];
    }
    
}


- (void)addMore:(NSArray *)dataArray{
    for (int i = 0; i < dataArray.count; i++) {
        MAPhoto *photo = [[MAPhoto alloc] initWithDictionary:[dataArray objectAtIndex:i]];
        [_dataArray addObject:photo];
    }
}
#pragma mark -- tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MAPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.sugc.photoViewCell"];
    if (!cell) {
        cell = [[MAPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"com.sugc.photoViewCell"];
        
    }
    //    ALAsset *asset = [[_manager.photoArray objectAtIndex:indexPath.row] firstObject];
    //    CGImageRef thum = [asset thumbnail];
    //    UIImage *image = [UIImage imageWithCGImage:thum];
    //    cell.imageView.image = image;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = (integer_t)indexPath.row * 4; i < (indexPath.row + 1) *4 && i < _dataArray.count; i ++) {
        [array addObject:[_dataArray objectAtIndex:i]];
    }
    [cell refreshWithPhotoArray:array];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_dataArray.count % 4 == 0) {
        return _dataArray.count / 4;
    }else{
    return _dataArray.count / 4 +1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [MAPhotoTableViewCell cellHeight];
}


#pragma mark -- tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   }



@end