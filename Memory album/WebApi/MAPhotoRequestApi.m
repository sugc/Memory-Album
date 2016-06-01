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
#import "MAContext.h"
#import "MAUserProfile.h"
@implementation MAPhotoRequestParam

- (void)transferToDic{
    

}

@end
@interface MAPhotoRequestApi ()

@end

@implementation MAPhotoRequestApi

- (void)postPhotoWithImage:(UIImage *) image andAid:(NSString *)aid{
    
    MARequestParam *parma = [[MARequestParam alloc] init];
    parma.url = @"http://10.151.135.230:8080/album/rest/photo/post";
    
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    NSString *userName = [[MAContext sharedContext] localUserProfile].userName;
    NSDictionary *dic = @{@"aid":aid};
     parma.paramDic = dic;
    parma.formData = data;
    [[MABaseRequestApi sharedApi] postRequestWithParam:parma target:_target okSelector:@selector(okSelector:) failSelector:@selector(failSelector:) erroSelector:@selector(erroSelectro:)];

}


- (void)getImageWithAid:(NSString *)aid{
    MARequestParam *parma = [[MARequestParam alloc] init];
    parma.url = @"http://10.151.135.230:8080/album/rest/photo/getPhoto";
//    NSString *userName = [[MAContext sharedContext] localUserProfile].userName;
    NSDictionary *dic = @{@"aid":aid};
    parma.paramDic = dic;
    [[MABaseRequestApi sharedApi] getRequestWithParam:parma target:_target okSelector:@selector(okSelector:) failSelector:@selector(failSelector:) erroSelector:@selector(erroSelectro:)];

}




@end