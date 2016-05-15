//
//  MAUserRequestApi.h
//  Memory album
//
//  Created by 苏国材 on 16/5/11.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import<Foundation/Foundation.h>
@class LoginViewController;
@protocol userApiProtocol <NSObject>

@optional
- (void)loginSuccess;
- (void)loginFaild;
- (void)isUserNameCanBeUsed:(BOOL) flag;
- (void)okSelector:(id)responseObject;
- (void)erroSelector:(id)responseObject;
- (void)failSelector:(NSError *)erro;

@end

@interface MAUserRequestApi : NSObject

@property(nonatomic, assign)id<userApiProtocol> delegate;

-(void)loginWithUserName:(NSString *)userName andPwd:(NSString *)pwd;
- (void)registerWithUserName:(NSString *)userName andPwd:(NSString *)pwd;
- (void)getFriendsWithUserName:(NSString *)userName;

@end
