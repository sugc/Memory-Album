//
//  MAPhotoViewControllerHelper.h
//  Memory album
//
//  Created by 苏国材 on 16/5/17.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MAAlbumRequestApi.h"
@interface MAPhotoViewControllerHelper : NSObject <UITableViewDataSource, UITableViewDelegate,albumRequestProtocol>
- (void)setData:(NSArray *) dataArray;
- (void)addMore:(NSArray *)dataArray;
@end

