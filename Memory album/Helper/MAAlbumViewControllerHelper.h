//
//  MAAlbumViewControllerHelper.h
//  Memory album
//
//  Created by sugc on 16/3/1.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MAAlbumRequestApi.h"
@interface MAAlbumViewControllerHelper : NSObject <UITableViewDataSource, UITableViewDelegate,albumRequestProtocol>
- (void)setData:(NSArray *) dataArray;

@end
