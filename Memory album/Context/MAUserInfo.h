//
//  MAUserInfoContext.h
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import<Foundation/Foundation.h>

@interface MAUserInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL isMale;
@property (nonatomic, strong) NSArray *tagArray;

- (void)initFormFile;
- (void)writeToFile;
@end








































