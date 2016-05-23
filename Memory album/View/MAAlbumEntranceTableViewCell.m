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

#define collectionViewCellHeight 150

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
    
    if (album != NULL && album.firstUrl != NULL && ![album.firstUrl isEqual:[NSNull null]]) {
        [self.albumView sd_setImageWithURL:[NSURL URLWithString:album.firstUrl]];

    }
    
    //cut image here
    self.nameLabel.text = @"";
    self.sigNatureLabel.text = @"";
    if (![album.albumName isEqual:[NSNull null]] && album.albumName != NULL) {
         self.nameLabel.text = album.albumName;
    }
    if (![album.descriptions isEqual:[NSNull null]] ) {
    
          self.sigNatureLabel.text = album.descriptions;
    }
  
}

- (UIImageView *)albumView{
    if (!_albumView) {
        _albumView = [[UIImageView alloc] initWithFrame:CGRectMake(5, self.nameLabel.bottom, [UIScreen mainScreen].bounds.size.width - 10, 80)];
        _albumView.contentMode = UIViewContentModeScaleAspectFill;
        _albumView.layer.masksToBounds = YES;
    }
    return _albumView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake( 5, 0, [UIScreen mainScreen].bounds.size.width  - 5, 30)];
        _nameLabel.font = [UIFont systemFontOfSize:20];
    }
    return _nameLabel;
}

- (void)configureTagArray{
    
}

- (UILabel *)sigNatureLabel{
    if (!_sigNatureLabel) {
        _sigNatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.albumView.bottom, [UIScreen mainScreen].bounds.size.width - 5, 40)];
        _sigNatureLabel.textColor = [UIColor grayColor];
        _sigNatureLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return _sigNatureLabel;
}
@end
