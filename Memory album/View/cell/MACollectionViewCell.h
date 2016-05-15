//
//  MACollectionViewCell.h
//  Memory album
//
//  Created by 苏国材 on 16/3/19.
//  Copyright © 2016年 sugc. All rights reserved.
//




#import "MAUserProfile.h"
#import <UIKit/UIKit.h>
@interface MACollectionViewCell : UITableViewCell

- (void)refreshWithUserProfile:(MAUserProfile *) userProfile;
+ (CGFloat)cellHeight;
@end