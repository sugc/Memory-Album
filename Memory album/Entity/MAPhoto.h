//
//  MAPhoto.h
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAPhoto : NSObject

@property (nonatomic, copy) NSString *masterId;
@property (nonatomic, copy) NSString *photoName;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) BOOL isUpdate;
@property (nonatomic, assign) int numberOfPraise;
@property (nonatomic, strong) NSArray *commentArray;

@end