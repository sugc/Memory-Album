//
//  MAUserRequestApi.m
//  Memory album
//
//  Created by 苏国材 on 16/5/11.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MAUserRequestApi.h"
#import "MABaseRequestApi.h"
#import "MAContext.h"
#import "MAUserProfile.h"

@interface MAUserRequestApi ()

@end



@implementation MAUserRequestApi

-(void)loginWithUserName:(NSString *)userName andPwd:(NSString *)pwd {
    MARequestParam *parm = [[MARequestParam alloc] init];
    parm.url =  @"http://10.151.135.230:8080/album/rest/user/login";
//    NSDictionary *dic = @{@"userName":userName,@"pwd":pwd};
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:userName forKey:@"userName"];
    [dic setObject:pwd forKey:@"pwd"];
    parm.paramDic = dic;
    
    [[MABaseRequestApi sharedApi] getRequestWithParam:parm target:self okSelector:@selector(okSelector:) failSelector:@selector(failSelector:) erroSelector:@selector(erroSelectror:)];
}

- (void)isUserNameCanBeUsed:(NSString *)userName{

    MARequestParam *param = [[MARequestParam alloc] init];
    param.url =  @"http://10.151.135.230:8080/album/rest/photo/post";
    NSDictionary *dic = @{@"userName":userName};
    param.paramDic = dic;
    [[MABaseRequestApi sharedApi] getRequestWithParam:param target:self okSelector:@selector(registerOkSelector) failSelector:@selector(registerFailSelector) erroSelector:@selector(registerErroSelectror)];
    
}


- (void)okSelector:(id) responseObject{
    if ([_delegate respondsToSelector:@selector(loginSuccess)]) {
        
        [_delegate loginSuccess];
    }
    NSDictionary *dic = [[responseObject objectForKey:@"returnObject"] objectForKey:@"userProfile"];
    MAUserProfile *userProfile = [[MAUserProfile alloc] initWithDictionary:dic];
    
    [[MAContext sharedContext] refreshLocalUserWithUserProfile:userProfile];

   
}

- (void)failSelector:(NSError *)erro{
    NSLog(@"failds");
    if ([_delegate respondsToSelector:@selector(loginFaild)]) {
        [_delegate loginFaild];
    }
}

- (void)erroSelectror:(id) responseObject{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户名或密码错误" message:NULL delegate:NULL cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];

}

- (void)registerOkSelector:(id)responseObject{
    NSLog(@"registerOK");
    
}

- (void)registerFailSelector:(NSError *)erro{
    NSLog(@"failds");
    if ([_delegate respondsToSelector:@selector(loginFaild)]) {
        [_delegate loginFaild];
    }
}

- (void)registerErroSelectror:(id)responseObject{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[responseObject objectForKey:@"erroMessage"] message:NULL delegate:NULL cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];

    
}


- (void)registerWithUserName:(NSString *)userName andPwd:(NSString *)pwd{
    MARequestParam *param = [[MARequestParam alloc] init];
    param.url =  @"http://10.151.135.230:8080/album/rest/user/register";
    NSDictionary *dic = @{@"userName":userName,@"pwd":pwd};
    param.paramDic = dic;
    [[MABaseRequestApi sharedApi] postRequestWithParam:param target:self okSelector:@selector(registerOkSelector:) failSelector:@selector(registerFailSelector:) erroSelector:@selector(registerErroSelectror:)];

}


- (void)getFriendsWithUserName:(NSString *)userName{
    MARequestParam *param = [[MARequestParam alloc] init];
    param.url =  @"http://10.151.135.230:8080/album/rest/user/getFriends";
    NSDictionary *dic = @{@"userName":userName};
    param.paramDic = dic;
    [[MABaseRequestApi sharedApi] getRequestWithParam:param target:self.delegate okSelector:@selector(okSelector:) failSelector:@selector(failSelector:) erroSelector:@selector(erroSelectror:)];

}



@end