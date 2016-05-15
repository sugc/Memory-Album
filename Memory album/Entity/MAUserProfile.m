//
//  UserProfile.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAUserProfile.h"

@interface MAUserProfile ()

@end

@implementation MAUserProfile

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.userName = [dic objectForKey:@"userName"];
        self.avatarUrl = [dic objectForKey:@"avatarUrl" ];
        self.signature = [dic objectForKey:@"signature"];
        self.level = [[dic objectForKey:@"level"] intValue];
    }
    return self;
}
- (NSDictionary *)dictionaryWithProfile{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    if (self.userName != NULL && ![self.userName isEqual:[NSNull null]]&& ![self.userName isEqualToString:@""]) {
         [dic setObject:self.userName forKey:@"userName"];
    }
    if (self.avatarUrl != NULL&& ![self.avatarUrl isEqual:[NSNull null]]  &&![self.avatarUrl isEqualToString:@""]) {
        
             [dic setObject:self.avatarUrl forKey:@"avatarUrl"];
       
       
    }
    if (self.signature != NULL && ![self.signature isEqual:[NSNull null]]&& ![self.signature isEqualToString:@""]) {
        [dic setObject:self.signature forKey:@"signature"];
    }
//    if (self.level != NULL) {
//        [dic setObject:@(self.level) forKey:@"level"];
//    }
   

    
    return dic;
}


@end