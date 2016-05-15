//
//  MAPhotoRequestApi.m
//  Memory album
//
//  Created by 苏国材 on 16/5/5.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MAPhotoRequestApi.h"
#import "MABaseRequestApi.h"

@implementation MAPhotoRequestParam

- (void)transferToDic{


}

@end
@interface MAPhotoRequestApi ()

@end

@implementation MAPhotoRequestApi

+ (void)postPhotoWithImage:(UIImage *) image andParm:(NSDictionary *) parm{
    
    MARequestParam *parma = [[MARequestParam alloc] init];
    parma.url = @"http://10.151.195.138:8080/album/rest/photo/post";
    NSMutableDictionary *dic = [parm mutableCopy];
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
//    [dic setObject:data forKey:@"image"];
     parma.paramDic = dic;
    [[MABaseRequestApi sharedApi] postRequestWithParam:parma target:self okSelector:NULL failSelector:NULL erroSelector:NULL];

}




@end