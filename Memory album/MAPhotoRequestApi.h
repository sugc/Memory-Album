//
//  PhotoRequestApi.h
//  Memory album
//
//  Created by 苏国材 on 16/5/5.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAPhotoRequestApi : NSObject
+ (void)postPhotoWithImage:(UIImage *) image andParm:(NSDictionary *) parm;
@end

@interface MAPhotoRequestParam :NSObject

@property (nonatomic, strong)NSString *photoName;
@property (nonatomic, strong)NSString *description;
@property (nonatomic, strong)NSString *pid;
@property (nonatomic, strong)NSString *aid;

- (void)transferToDic;
@end