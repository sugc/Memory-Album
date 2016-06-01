//
//  MAAlbumRequestApi.h
//  Memory album
//
//  Created by 苏国材 on 16/5/13.
//  Copyright © 2016年 sugc. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol albumRequestProtocol <NSObject>
- (void)okSelector:(id)responseObject;
- (void)erroSelector:(id)responseObject;
- (void)failSelector:(NSError *)erro;

@optional


@end

@interface MAAlbumRequestApi : NSObject

@property(nonatomic, assign)id<albumRequestProtocol> delegate;
- (void)getAlbumsWithUserName:(NSString *)userName;
- (void)deleteAlbumWithAid:(NSString *) aid;
- (void)createAlbumWithAlbumName:(NSString *) albumName;
- (void)getAlbumsWithUserName:(NSString *)userName andKeyword:(NSString *)keyword;
@end
