//
//  main.m
//  Memory album
//
//  Created by sugc on 16/2/22.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MAContext.h"
#import "MABaseRequestApi.h"
#import "AFNetworking.h"
#import "MAPhotoRequestApi.h"
int main(int argc, char * argv[]) {
    @autoreleasepool {
//        
//        NSDictionary *par = @{@"userName":@"longya",@"pwd":@"lalala"};
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        
//        UIImage *image = [UIImage imageNamed:@"avatar.png"];
//        NSData *imageData = UIImageJPEGRepresentation(image,1.0);
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        
//        [manager POST:@"http://10.151.195.138:8080/album/rest/photo/post" parameters:par constructingBodyWithBlock:^(id _Nonnull formData){
//            [formData appendPartWithFormData:imageData name:@"image"];
//        } progress:^(NSProgress *_Nonnull uploadProgress) {
//        
//        }success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {
//            NSLog(@"success");
//        }failure:^(NSURLSessionDataTask *_Nonnull task,NSError *_Nonnull error){
//            NSLog(@"failure");
//        }];
//        NSDictionary *par = @{@"photoName":@"longya",@"description":@"buhaokan a ",@"pid":@"112121",
//                              @"aid":@"dsada"};
//        UIImage *image = [UIImage imageNamed:@"avatar.png"];
//        [MAPhotoRequestApi postPhotoWithImage:image andParm:par];
        [[MAContext sharedContext] initConfiguration];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
