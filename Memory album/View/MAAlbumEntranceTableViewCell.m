//
//  MAAlbumEntranceTabelView.m
//  Memory album
//
//  Created by sugc on 16/2/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAAlbumEntranceTableViewCell.h"
#import "MAAlbum.h"
#import "UIView+MAUtils.h"
#import "UIImageView+WebCache.h"

#define collectionViewCellHeight 140

@interface MAAlbumEntranceTableViewCell ()

@property(nonatomic, strong) UIImageView *albumView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sigNatureLabel;

@end

@implementation MAAlbumEntranceTableViewCell

+ (CGFloat)cellHeight{
    return collectionViewCellHeight;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, collectionViewCellHeight);
        [self.contentView addSubview:self.albumView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.sigNatureLabel];
    }
    return self;
}

- (void)refreshWithAlbum:(MAAlbum *) album{
    self.albumView.image = [UIImage imageNamed:@"avatar.png"];
    [self.albumView setImageWithURL:@"http://10.151.195.138:8080/album/rest/photo/getImage/44"];
    
    //cut image here
    self.nameLabel.text = @"larray";
    self.sigNatureLabel.text = @"dashkkas";
}

- (UIImageView *)albumView{
    if (!_albumView) {
        _albumView = [[UIImageView alloc] initWithFrame:CGRectMake(5, self.nameLabel.bottom, [UIScreen mainScreen].bounds.size.width - 10, 80)];
    }
    return _albumView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake( 5, 0, [UIScreen mainScreen].bounds.size.width  - 5, 30)];
    }
    return _nameLabel;
}

- (void)configureTagArray{
    
}

- (UILabel *)sigNatureLabel{
    if (!_sigNatureLabel) {
        _sigNatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.albumView.bottom, [UIScreen mainScreen].bounds.size.width - 5, 30)];
        
    }
    return _sigNatureLabel;
}
@end
