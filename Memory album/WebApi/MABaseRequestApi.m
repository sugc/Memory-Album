//
//  BaseRequestApi.m
//  Memory album
//
//  Created by sugc on 16/2/24.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MABaseRequestApi.h"
#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@implementation MARequestParam


@end

@implementation MABaseRequestApi

+ (instancetype)sharedApi{
    static dispatch_once_t onceTokenApi;
    static MABaseRequestApi *sharedApi = nil;
    
    dispatch_once(&onceTokenApi, ^{
        sharedApi = [[MABaseRequestApi alloc] init];
    });
    return sharedApi;
}

- (void)postRequestWithParam:(MARequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector{


    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:param.url parameters:param.paramDic constructingBodyWithBlock:^(id _Nonnull formData){
        [formData appendPartWithFileData:param.formData name:@"image" fileName:@"image" mimeType:@"image/png"];
    } progress:^(NSProgress *_Nonnull uploadProgress) {
        
    }success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        if (dic == NULL || [[dic objectForKey:@"erroCode"] intValue] != 0) {
            
            if ([target respondsToSelector:erroSelector]) {
                [target performSelectorOnMainThread:erroSelector withObject:responseObject waitUntilDone:YES];
            }
            
        }
        else{
            if ([target respondsToSelector:okSelector]) {
                [target performSelectorOnMainThread:okSelector withObject:responseObject waitUntilDone:YES];
            }
            
        }
        
        
        
    }failure:^(NSURLSessionDataTask *_Nonnull task,NSError *_Nonnull error){
        NSLog(@"failure");
        if ([target respondsToSelector:failSelector]) {
            [target performSelectorOnMainThread:failSelector withObject:error waitUntilDone:YES];
        }
        
    }];
    

    
}
- (void)getRequestWithParam:(MARequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector{

//    NSURLSession *session = [NSURLSession sharedSession];
//    NSString *urlStr = [param.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    //    NSData *data = [NSJSONSerialization dataWithJSONObject:param.paramDic options:NSJSONWritingPrettyPrinted error:nil];
//    
//    [request setHTTPMethod:@"GET"];
//    [request setHTTPBody:nil];
//    
//    [[session dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *erro){
//        id respose = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@",respose);
//    }] resume];
    
    NSDictionary *par = param.paramDic;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:param.url parameters:par progress:^(NSProgress *_Nonnull downloadProgress) {
        
    }success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {

         NSDictionary *dic = responseObject;
        if (dic == NULL || [[dic objectForKey:@"erroCode"] intValue] != 0) {
            
            if ([target respondsToSelector:erroSelector]) {
                [target performSelectorOnMainThread:erroSelector withObject:responseObject waitUntilDone:YES];
            }

        }
        else{
            if ([target respondsToSelector:okSelector]) {
                [target performSelectorOnMainThread:okSelector withObject:responseObject waitUntilDone:YES];
            }

        }
       
        
        
    }failure:^(NSURLSessionDataTask *_Nonnull task,NSError *_Nonnull error){
        NSLog(@"failure");
        if ([target respondsToSelector:failSelector]) {
            [target performSelectorOnMainThread:failSelector withObject:error waitUntilDone:YES];
        }
        
    }];
    

}

- (void)postImageRequest{
    
    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSString *urlStr = @"http://localhost/api/album/uploadImage";
//    NSURL *url = [NSURL URLWithString:urlStr];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
////   [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
//    //[request setValue:@"image/png" forHTTPHeaderField:@"Content-Type"];
//    NSString *boundary = @"AAAAAA";
//    NSString *fileName = @"avatar.png";
//    NSString *strTop=[NSString stringWithFormat:@"--%@\nContent-Disposition: form-data; name=\"file1\"; filename=\"%@\"\nContent-Type: %@\n\n",boundary,fileName,@"jpeg/png"];
//    
//    NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"avatar.png"]);
//    [request setHTTPMethod:@"POST"];
//
//    
//    [[session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *erro){
//        id respose = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        
//        NSLog(@"-------%@",respose);
//        NSLog(@"%@",response);
//    }] resume];
//
    
    
    
    NSString *fileName=@"avatar.png";
    //1.创建url
    NSString *urlStr=@"http://localhost/api/album/uploadImage";
    urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];
    //2.创建请求
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod=@"POST";
    
    //3.构建数据
    NSData *data=[self getHttpBody];
    request.HTTPBody=data;
    
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)data.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",@"KenshinCui"] forHTTPHeaderField:@"Content-Type"];
    
    
    
    //4.创建会话
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask=[session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSString *dataStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataStr);
        }else{
            NSLog(@"error is :%@",error.localizedDescription);
        }
    }];
    
    [uploadTask resume];
}

-(NSData *)getHttpBody{
    NSString *boundary=@"KenshinCui";
    NSMutableData *dataM=[NSMutableData data];
    
    NSString *strTop=[NSString stringWithFormat:@"--%@\nContent-Disposition: form-data; name=\"file1\"; filename=\"%@\"\nContent-Type: %@\n\n",boundary,@"avatar.png",@"image/png"];
    NSString *strBottom=[NSString stringWithFormat:@"\n--%@--",boundary];
    NSData *fileData= UIImagePNGRepresentation([UIImage imageNamed:@"avatar.png"]);
    [dataM appendData:[strTop dataUsingEncoding:NSUTF8StringEncoding]];
    [dataM appendData:fileData];
    [dataM appendData:[strBottom dataUsingEncoding:NSUTF8StringEncoding]];
    return dataM;
}
@end