//
//  MAPhoto.h
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAPhoto : NSObject

@property (nonatomic, copy) NSString *photoName;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) BOOL isUpdate;

@end