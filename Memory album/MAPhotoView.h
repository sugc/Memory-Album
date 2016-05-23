//
//  MAPhotoView.h
//  Memory album
//
//  Created by 苏国材 on 16/5/18.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAPhotoTableViewCell.h"
@class MAPhoto;

@interface MAPhotoView : UIView

@property (nonatomic, assign)id<MAPhotoReferViewProtocol> delegate;
- (void)refreshWithPhoto:(MAPhoto *)photo;
+ (void)setSelectState:(BOOL)flag;

@end
