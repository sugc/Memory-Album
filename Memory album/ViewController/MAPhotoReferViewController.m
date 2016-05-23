//
//  MAPhotoPickViewController.m
//  Memory album
//
//  Created by 苏国材 on 16/4/8.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPhotoReferViewController.h"
#import "UIView+MAUtils.h"
#import "MAPhoto.h"
#import "UIImageView+WebCache.h"
@interface MAPhotoReferViewController()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *titleView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIImageView *imageView0;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, assign) NSInteger index;

@end


@implementation MAPhotoReferViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.titleView];
    [self.scrollView addSubview:self.imageView0];
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    self.scrollView.contentOffset = CGPointMake(self.scrollView.width, 0);
}


- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.titleView.bottom, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.titleView.bottom)];
        _scrollView.contentSize = CGSizeMake(_scrollView.width *3, _scrollView.height);
        _scrollView.pagingEnabled = YES;
    }

    return _scrollView;
}

- (UIImageView *)imageView0{
    if (!_imageView0) {
        _imageView0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.width, self.scrollView.height)];
        _imageView0.contentMode = UIViewContentModeCenter;
    }
    return _imageView0;
}

- (UIImageView *)imageView1{
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.width, 0, self.scrollView.width, self.scrollView.height)];
        _imageView1.contentMode = UIViewContentModeCenter;
    }
    return _imageView1;
}

- (UIImageView *)imageView2{
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.width*2, 0, self.scrollView.width, self.scrollView.height)];
            _imageView2.contentMode = UIViewContentModeCenter;
        _scrollView.delegate = self;
    }
    return _imageView2;
}


- (UIImageView *)titleView{
    if (!_titleView) {
        _titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 70)];
        _titleView.userInteractionEnabled = YES;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _titleView.width, _titleView.height - 30)];
        titleLabel.text = @"";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleView.backgroundColor = [UIColor blueColor];
        UIButton *returnButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 35, 40, 40)];
        [returnButton setTitle:@"返回" forState:UIControlStateNormal];
        [_titleView addSubview:titleLabel];
        [_titleView addSubview:returnButton];
        
        [returnButton addTarget:self action:@selector(returnBack) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 14 - 20, 35, 40, 40)];
        [addButton setTitle:@"🚮" forState:UIControlStateNormal];
        [_titleView addSubview:addButton];
        
        [addButton addTarget:self action:@selector(deletePhoto) forControlEvents:UIControlEventTouchUpInside];

    }
    return _titleView;
}

- (void)deletePhoto{


}

- (void)setData:(NSArray *)dataArray{
    _dataArray = [dataArray mutableCopy];

}

- (void)refreshWithIndex:(NSInteger)index{
    _index = index;
    if (index  > 0 && index  < (_dataArray.count - 1) ) {
        MAPhoto *photo0 = [_dataArray objectAtIndex:_index -1];
        NSString *urlString0 = [NSString stringWithFormat:@"http://10.151.195.138:8080/album/rest/photo/getImage/%@",photo0.pid];
        [self.imageView0 sd_setImageWithURL:[NSURL URLWithString:urlString0]];
        
        MAPhoto *photo1 = [_dataArray objectAtIndex:_index ];
        NSString *urlString1 = [NSString stringWithFormat:@"http://10.151.195.138:8080/album/rest/photo/getImage/%@",photo1.pid];
        [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:urlString1]];
        
        
        MAPhoto *photo2 = [_dataArray objectAtIndex:_index +1];
        NSString *urlString2 = [NSString stringWithFormat:@"http://10.151.195.138:8080/album/rest/photo/getImage/%@",photo2.pid];
        [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:urlString2]];
        self.scrollView.contentOffset = CGPointMake(self.scrollView.width, 0);
    }
    
}

- (void)returnBack{

    [self dismissViewControllerAnimated:NO completion:^(void){}];

}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        [self refreshWithIndex:_index - 1];
    }else if(scrollView.contentOffset.x == scrollView.width *2){
        [self refreshWithIndex:_index + 1];
    }
    

}
@end