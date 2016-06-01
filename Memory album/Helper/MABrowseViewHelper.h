//
//  MABrowseViewHelper.h
//  Memory album
//
//  Created by sugc on 16/2/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAAlbumRequestApi.h"
@interface MABrowseViewHelper: NSObject <UITableViewDataSource, UITableViewDelegate,albumRequestProtocol> 
- (void)setData:(NSArray *) dataArray;
@end