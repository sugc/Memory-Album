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
#import "MAAlbum.h"

@implementation MACollectionViewControllerHelper

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPat
{
    MACollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewCell"];
    if (!cell) {
        cell = [[MACollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"collectionViewCell"];
        [cell refreshWithAlbum:nil];
    }
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MACollectionViewCell cellHeight];
}
@end