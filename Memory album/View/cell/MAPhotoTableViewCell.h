//
//  MAPhotoTableViewCell.h
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAPhotoTableViewCell : UITableViewCell

- (void)refreshWithPhotoArray:(NSArray *)photoArray;
+ (CGFloat)cellHeight;
@end

