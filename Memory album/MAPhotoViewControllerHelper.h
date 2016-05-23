//
//  MAPhotoViewControllerHelper.h
//  Memory album
//
//  Created by 苏国材 on 16/5/17.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MAPhotoTableViewCell.h"
#import "MAAlbumRequestApi.h"
#import "MAPhotoTableViewCell.h"
@interface MAPhotoViewControllerHelper : NSObject <UITableViewDataSource, UITableViewDelegate,albumRequestProtocol>

@property (nonatomic, assign)id<MAPhotoReferViewProtocol>delegate;
- (void)setData:(NSArray *) dataArray;
- (void)addMore:(NSArray *)dataArray;
- (NSArray *)getData;

@end

