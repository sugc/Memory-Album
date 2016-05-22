//
//  MAAlbum.m
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAAlbum.h"

@interface MAAlbum ()

@end


@implementation MAAlbum

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.albumName = [dic objectForKey:@"albumName"];
        self.aid = [dic objectForKey:@"aid" ];
        self.descriptions = [dic objectForKey:@"descriptions"];
        self.firstUrl = [dic objectForKey:@"firstPid"];
    }
    return self;

}
- (NSDictionary *)dictionaryWithAlbum{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    if (self.albumName != NULL && ![self.albumName isEqual: [NSNull null]] && ![self.albumName isEqualToString:@""]) {
        [dic setObject:self.albumName forKey:@"albumName"];
    }
    return dic;
}

@end
