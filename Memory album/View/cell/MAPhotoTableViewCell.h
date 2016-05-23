//
//  MAPhotoTableViewCell.h
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MAPhotoReferViewProtocol <NSObject>

- (void)clickImage:(NSString *)pid;

@end


@interface MAPhotoTableViewCell : UITableViewCell

- (void)refreshWithPhotoArray:(NSArray *)photoArray;
+ (CGFloat)cellHeight;
- (void)setDelegate:(id<MAPhotoReferViewProtocol>)delegate;
@end

