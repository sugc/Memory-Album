//
//  MAAlbum.h
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAAlbum : NSObject

@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, strong) NSMutableArray *photoArray;
@property (nonatomic, strong) NSMutableArray *tagArray;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, assign) BOOL isAllPhotoUpDate;


@end