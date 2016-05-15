//
//  BaseRequstApi.h
//  Memory album
//
//  Created by sugc on 16/2/24.
//  Copyright © 2016年 sugc. All rights reserved.
//
/*
 负责底层发送请求，上传下载任务
 
 */

#import <Foundation/Foundation.h>
@interface MARequestParam : NSObject

@property (nonatomic, strong) NSDictionary *paramDic;
@property (nonatomic, copy) NSString *url;


@end
@interface MABaseRequestApi : NSObject

+ (instancetype)sharedApi;
- (void)postRequestWithParam:(MARequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector;
- (void)getRequestWithParam:(MARequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector;

@end

