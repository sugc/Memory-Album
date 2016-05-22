//
//  MAPhotoTableViewCell.m
//  Memory album
//
//  Created by sugc on 16/3/2.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MAPhotoTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MAphotoView.h"
#define photoTableViewCellHeight  ([UIScreen mainScreen].bounds.size.width - 15)/4.0 + 5
@interface MAPhotoTableViewCell ()

@property (nonatomic, strong) MAPhotoView *imageView0;
@property (nonatomic, strong) MAPhotoView *imageView1;
@property (nonatomic, strong) MAPhotoView *imageView2;
@property (nonatomic, strong) MAPhotoView *imageView3;

@property (nonatomic, strong) NSArray *photoArray;

@end

@implementation MAPhotoTableViewCell


+ (CGFloat)cellHeight{
    return photoTableViewCellHeight;
   
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, photoTableViewCellHeight );
        
        _imageView0 = [[MAPhotoView alloc] initWithFrame:CGRectMake(0, 0, photoTableViewCellHeight - 5, photoTableViewCellHeight - 5)];
        _imageView1 = [[MAPhotoView alloc] initWithFrame:CGRectMake( photoTableViewCellHeight,0, photoTableViewCellHeight - 5, photoTableViewCellHeight - 5)];

        _imageView2 = [[MAPhotoView alloc] initWithFrame:CGRectMake( (photoTableViewCellHeight) * 2,  0, photoTableViewCellHeight - 5, photoTableViewCellHeight - 5)];

        _imageView3 = [[MAPhotoView alloc] initWithFrame:CGRectMake( (photoTableViewCellHeight) *3, 0 , photoTableViewCellHeight - 5, photoTableViewCellHeight - 5)];
        _imageView2.backgroundColor = [UIColor redColor];
        _imageView3.backgroundColor = [UIColor yellowColor];

        [self.contentView addSubview:_imageView0];
        [self.contentView addSubview:_imageView1];
        [self.contentView addSubview:_imageView2];
        [self.contentView addSubview:_imageView3];
    }
    
    return self;
}




- (void)refreshWithPhotoArray:(NSArray *)photoArray{
    self.photoArray = photoArray;
    
    
    if (photoArray.count > 0) {
        [self.imageView0 refreshWithPhoto:[photoArray objectAtIndex:0]];
        self.imageView0.hidden = NO;
        if (photoArray.count > 1) {
            [self.imageView1 refreshWithPhoto:[photoArray objectAtIndex:1]];
             self.imageView1.hidden = NO;
            if (photoArray.count > 2) {
                [self.imageView2 refreshWithPhoto:[photoArray objectAtIndex:2]];
                 self.imageView2.hidden = NO;
                if (photoArray.count > 3) {
                    [self.imageView3 refreshWithPhoto:[photoArray objectAtIndex:3]];
                     self.imageView3.hidden = NO;
                }
            }
        }
    }
    
//    [_imageView4 setImageWithURL:[NSURL URLWithString:(NSString *)[photoArray objectAtIndex:0]]];
    
    
}





@end