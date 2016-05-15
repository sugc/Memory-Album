//
//  MAContext.m
//  Memory album
//
//  Created by sugc on 16/2/23.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MAUserProfile.h"
#import "MAContext.h"
#import "MABrowseViewController.h"
#import "MAAlbumViewController.h"
#import "MACollectionViewController.h"
#import "MAProfileView.h"
#import "MAUserBasicInfoView.h"

#define MAalnumName "memory albums"
static ALAssetsGroup *sharedGroup = nil;
static MAUserProfile *localUserProfile = nil;
@interface MAContext ()

@end

@implementation MAContext

+ (instancetype)sharedContext{
    static MAContext *shareContext = nil;
    static dispatch_once_t onceTokeContext;
    dispatch_once(&onceTokeContext, ^{
        shareContext = [[MAContext alloc] init];
    });
    return shareContext;
}

- (UINavigationController *)rootViewController{
    UINavigationController *rootViewController = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    return rootViewController;
}

- (ALAssetsLibrary *)sharedAssetsLibrary{
    static ALAssetsLibrary *sharedLibrary = nil;
    static dispatch_once_t onceTokeLibrary;
    dispatch_once(&onceTokeLibrary, ^{
        sharedLibrary = [[ALAssetsLibrary alloc] init];
    });
    return sharedLibrary;
}

//创建之后若是被手动删除则无法查找到。并且不会走到fail路径。

- (ALAssetsGroup *)sharedAssetsGroup{
    
    return sharedGroup;
    
}


- (void)initConfiguration{
    
    ALAssetsLibrary *lib = [self sharedAssetsLibrary];
    __block BOOL isHaveAlbum = false;
    [lib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop){
        if ([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:@MAalnumName]) {
            sharedGroup = group;
            isHaveAlbum = YES;
        }
        if (group == nil) {
            if (!isHaveAlbum) {
                [lib addAssetsGroupAlbumWithName:@MAalnumName resultBlock:^(ALAssetsGroup *group){
                    sharedGroup = group;
                    
                } failureBlock:^(NSError *erro){
                    
                }];
                
            }

        }
    } failureBlock:^(NSError *erro){
        
        
    }];
    
}


- (MAUserProfile *)localUserProfile{
    
    static dispatch_once_t onceTokenUser;
    dispatch_once(&onceTokenUser, ^{
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *filePath = [documentPath stringByAppendingPathComponent:@"MALocalUserProfile"];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
        localUserProfile = [[MAUserProfile alloc] initWithDictionary:dic];
    });
    return localUserProfile;
}

- (void)refreshLocalUserWithUserProfile:(MAUserProfile *)userProfile{
    localUserProfile = userProfile;
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"MALocalUserProfile"];
    NSDictionary *dic = [userProfile dictionaryWithProfile];
    
    if ([dic writeToFile:filePath atomically:YES]) {
        NSArray *array = [[self tabBarController] viewControllers];
        for (int i = 0; i < array.count; i++) {
            if ([[array objectAtIndex:i] isKindOfClass:[MAAlbumViewController class]]) {
                MAAlbumViewController *VC = [array objectAtIndex:i];
                [VC.profileView refreshWithUserProfile:userProfile];
            }
            if ([[array objectAtIndex:i] isKindOfClass:[MACollectionViewController class]]) {
                MACollectionViewController *VC = [array objectAtIndex:i];
                [VC.profileView refreshWithUserProfile:userProfile];
            }
            if ([[array objectAtIndex:i] isKindOfClass:[MABrowseViewController class]]) {
                MABrowseViewController *VC = [array objectAtIndex:i];
                [VC.profileView refreshWithUserProfile:userProfile];
            }

        }
    }

}
- (UITabBarController *)tabBarController{
    static dispatch_once_t onceTokenTab;
    static UITabBarController *tab;
    dispatch_once(&onceTokenTab, ^{
        
        tab = [[UITabBarController alloc] init];
    });
    return tab;

}


@end