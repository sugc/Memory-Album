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

@interface MAPhotoTableViewCell ()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIImageView *imageView4;
@property (nonatomic, strong) NSArray *photoArray;

@end

@implementation MAPhotoTableViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureImageView];
    }
    return self;
}


- (void)configureImageView{
    
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width /4.0 - 15, ([UIScreen mainScreen].bounds.size.width /4.0 - 15) * [UIScreen mainScreen].bounds.size.height / [UIScreen mainScreen].bounds.size.width)];
    _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(_imageView1.right + 5, _imageView1.top, _imageView1.width, _imageView1.height)];
    _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(_imageView2.right + 5, _imageView2.top, _imageView2.width, _imageView2.height)];
    _imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(_imageView3.right + 5, _imageView3.top, _imageView3.width, _imageView3.height)];
    
    [self.contentView addSubview:_imageView1];
    [self.contentView addSubview:_imageView2];
    [self.contentView addSubview:_imageView3];
    [self.contentView addSubview:_imageView4];
}

- (void)configureImageButton{
    
    UIButton *imageButton1 = [[UIButton alloc] initWithFrame:_imageView1.bounds];
    UIButton *imageButton2 = [[UIButton alloc] initWithFrame:_imageView2.bounds];
    UIButton *imageButton3 = [[UIButton alloc] initWithFrame:_imageView3.bounds];
    UIButton *imageButton4 = [[UIButton alloc] initWithFrame:_imageView4.bounds];
    
    [imageButton1 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [imageButton2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [imageButton3 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [imageButton4 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    imageButton1.tag = 1;
    imageButton2.tag = 2;
    imageButton3.tag = 3;
    imageButton4.tag = 4;
    
    [self.contentView addSubview:imageButton1];
    [self.contentView addSubview:imageButton2];
    [self.contentView addSubview:imageButton3];
    [self.contentView addSubview:imageButton4];
}

- (void)refreshWithPhotoArray:(NSArray *)photoArray{
    self.photoArray = photoArray;
    
}


- (void)clickButton:(UIButton *)button{
    
}


@end