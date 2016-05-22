//
//  MAPhoto.m
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPhoto.h"

@interface MAPhoto ()

@end

@implementation MAPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.aid = [dic objectForKey:@"aid"];
        self.pid = [dic objectForKey:@"pid"];
    }

    return self;
}

@end