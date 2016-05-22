//
//  MAAlbum.h
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAAlbum : NSObject

@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, strong) NSMutableArray *tagArray;
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, copy) NSString *firstUrl;
@property (nonatomic, copy) NSString *descriptions;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
- (NSDictionary *)dictionaryWithAlbum;
@end