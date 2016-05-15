//
//  MACollectionViewControllerHelper.h
//  Memory album
//
//  Created by 苏国材 on 16/3/19.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import<UIKit/UIKit.h>
#import<Foundation/Foundation.h>

@interface MACollectionViewControllerHelper : NSObject <UITableViewDelegate,UITableViewDataSource>

- (void)setData:(NSArray *)dataArray;

@end