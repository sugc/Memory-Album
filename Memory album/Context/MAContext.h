//
//  MAContext.h
//  Memory album
//
//  Created by sugc on 16/2/23.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ALAssetsLibrary;
@class ALAssetsGroup;
@class MAUserProfile;
@interface MAContext : NSObject

+ (instancetype)sharedContext;
- (UINavigationController *)rootViewController;
- (ALAssetsLibrary *)sharedAssetsLibrary;
- (ALAssetsGroup *)sharedAssetsGroup;
- (void)initConfiguration;
- (MAUserProfile *)localUserProfile;
- (UITabBarController *)tabBarController;
- (void)refreshLocalUserWithUserProfile:(MAUserProfile *)userProfile;
@end
