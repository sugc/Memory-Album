//
//  MAProfileSettingViewHelper.m
//  Memory album
//
//  Created by sugc on 16/2/27.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAProfileSettingViewHelper.h"
#import "MAProfileSettingViewCell.h"
@interface MAProfileSettingViewHelper ()

@end

@implementation MAProfileSettingViewHelper

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MAProfileSettingViewCell *cell = [[MAProfileSettingViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"profile"];
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            cell.textLabel.text = @"性别";
            cell.textView.text = @"男";
            break;
        case 2:
            cell.textLabel.text = @"QQ";
            cell.textView.text = @"2528397406";
            break;
        case 3:
            cell.textLabel.text = @"地址";
            cell.textView.text = @"吉林省长春市";
            break;
        
        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
@end