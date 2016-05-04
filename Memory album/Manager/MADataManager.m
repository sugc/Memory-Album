//
//  MADataManager.m
//  Memory album
//
//  Created by sugc on 16/3/1.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MADataManager.h"
#import "MAContext.h"

@interface MADataManager ()
@property (nonatomic, strong) NSMutableArray *localImageArray;
@end

@implementation MADataManager

+ (instancetype)sharedDataManager{
    static MADataManager *sharedDataManager = nil;
    static dispatch_once_t dataManagerToken;
    
    dispatch_once(&dataManagerToken, ^{
        sharedDataManager = [[MADataManager alloc] init];
        sharedDataManager.localImageArray = [[NSMutableArray alloc] init];
        [sharedDataManager refresh];
    });
    return sharedDataManager;
}

- (NSArray *)localImage{
    
    
    return _localImageArray;
}

- (void)refresh{
   
    ALAssetsLibrary *lib = [[MAContext sharedContext] sharedAssetsLibrary];
    [lib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop){
        [group enumerateAssetsUsingBlock:^(ALAsset *result,NSUInteger index, BOOL *stop){
            if (result != nil && [[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                [_localImageArray addObject:result];
            }
        }];
        
    } failureBlock:^(NSError *erro){
        
    }];


}

@end