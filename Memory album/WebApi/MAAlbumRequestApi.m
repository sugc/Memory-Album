//
//  MAAlbumRequestApi.m
//  Memory album
//
//  Created by 苏国材 on 16/5/13.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAAlbumRequestApi.h"
#import "MABaseRequestApi.h"
#import "MAContext.h"
#import "MAUserProfile.h"
@interface MAAlbumRequestApi ()

@end


@implementation MAAlbumRequestApi

- (void)getAlbumsWithUserName:(NSString *)userName{
    MARequestParam *parma = [[MARequestParam alloc] init];
    parma.url = @"http://10.151.195.138:8080/album/rest/album/getAlbum";
    NSMutableDictionary *dic = @{@"userName":userName};
    parma.paramDic = dic;
    [[MABaseRequestApi sharedApi] getRequestWithParam:parma target:_delegate okSelector:@selector(okSelector:) failSelector:@selector(failSelector:) erroSelector:@selector(erroSelector:)];


}
- (void)deleteAlbumWithAid:(NSString *) aid{

    MARequestParam *parma = [[MARequestParam alloc] init];
    parma.url = @"http://10.151.195.138:8080/album/rest/album/deleteAlbum";
    NSMutableDictionary *dic = @{@"aid":aid};
    parma.paramDic = dic;
    [[MABaseRequestApi sharedApi] getRequestWithParam:parma target:_delegate okSelector:NULL failSelector:NULL erroSelector:NULL];

}

- (void)createAlbumWithAlbumName:(NSString *) albumName {
    NSString *userName = [[MAContext sharedContext] localUserProfile].userName;
    MARequestParam *parma = [[MARequestParam alloc] init];
    parma.url = @"http://10.151.195.138:8080/album/rest/album/createAlbum";
    NSMutableDictionary *dic = @{@"albumName":albumName,@"userName":userName};
    parma.paramDic = dic;
    [[MABaseRequestApi sharedApi] getRequestWithParam:parma target:_delegate okSelector:@selector(okSelector:) failSelector:@selector(failSelector:) erroSelector:@selector(erroSelector:)];
}



@end