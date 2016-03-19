//
//  MACollectionViewCell.h
//  Memory album
//
//  Created by 苏国材 on 16/3/19.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import<UIKit/UIKit.h>
@class MAAlbum;
@interface MACollectionViewCell : UITableViewCell

- (void)refreshWithAlbum:(MAAlbum *) album;
+ (CGFloat)cellHeight;
@end
