//
//  MAPhotoViewController.h
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MAAlbum;
@interface MAPhotoViewController : UIViewController
- (void)refreshWithAlbum:(MAAlbum *)album;

@end