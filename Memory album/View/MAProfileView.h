//
//  MAProfileView.h
//  Memory album
//
//  Created by sugc on 16/2/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MAUserProfile;
@interface MAProfileView : UIView
- (void)refreshWithUserProfile:(MAUserProfile *)userProfile;
@end
