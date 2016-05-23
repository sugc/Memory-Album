//
//  MAPhotoView.m
//  Memory album
//
//  Created by 苏国材 on 16/5/18.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPhotoView.h"
#import "MAPhoto.h"
#import "UIImageView+WebCache.h"
static bool isCanBeSelect = NO;
@interface MAPhotoView ()
@property (nonatomic, strong) UILabel *selectLabel;
@property (nonatomic, strong) UILabel *yesLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) MAPhoto *photo;
@end


@implementation MAPhotoView

- (instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
       
       //
//        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
//        longPressGesture.minimumPressDuration = 0.5;
        [self addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView{
    if (!_imageView) {
       

        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.userInteractionEnabled = YES;
        UIButton *button = [[UIButton alloc] initWithFrame:_imageView.bounds];
        [_imageView addSubview:button];
        [button addTarget:self action:@selector(tapImage) forControlEvents:UIControlEventTouchUpInside];

        
    }
    return _imageView;
}

- (void)tapImage{
    
    
    if ([_delegate respondsToSelector:@selector(clickImage:)]) {
        [_delegate clickImage:self.photo.pid];
    }
}

- (void)refreshWithPhoto:(MAPhoto *)photo{
    self.photo = photo;
    NSString *pidString = [NSString stringWithFormat:@"%@",photo.pid];
    NSString *urlString = [@"http://10.151.195.138:8080/album/rest/photo/getImage/" stringByAppendingString:pidString];
//      NSString *urlString =@"http://10.151.195.138:8080/album/rest/photo/getImage/11";
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:NULL];
    self.hidden = NO;

}
- (void)longPress:(UILongPressGestureRecognizer *)longPressGesture{
    

}

+ (void)setSelectState:(BOOL)flag{


}


@end