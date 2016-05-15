//
//  MACollectionViewControllerHelper.m
//  Memory album
//
//  Created by 苏国材 on 16/3/19.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MACollectionViewControllerHelper.h"
#import "MACollectionViewCell.h"
#import "MAProfileSettingViewController.h"
#import "MAContext.h"
#import "MAAlbum.h"

@interface MACollectionViewControllerHelper ()

@property (nonatomic, strong) NSMutableArray *friendArray;

@end

@implementation MACollectionViewControllerHelper

- (instancetype)init{
    self = [super init];
    if (self) {
        _friendArray = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)setData:(NSArray *)dataArray{
    [_friendArray removeAllObjects];
    for (int i = 0; i < dataArray.count; i ++) {
        NSDictionary *dic = [dataArray objectAtIndex:i];
        MAUserProfile *userProfile = [[MAUserProfile alloc] initWithDictionary:dic];
        [_friendArray addObject:userProfile];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MACollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewCell"];
    if (!cell) {
        cell = [[MACollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"collectionViewCell"];
       
    }
     [cell refreshWithUserProfile:[_friendArray objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _friendArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MACollectionViewCell cellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MAProfileSettingViewController *profileSettingVC = [[MAProfileSettingViewController alloc] init];
    
    [[[MAContext sharedContext] tabBarController] presentViewController:profileSettingVC animated:NO completion:^(void){[profileSettingVC refreshWithUserProfile:[_friendArray objectAtIndex:indexPath.row]];
    }];

}
@end