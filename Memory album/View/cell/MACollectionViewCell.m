//
//  MACollectionViewCell.m
//  Memory album
//
//  Created by 苏国材 on 16/3/19.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MACollectionViewCell.h"
#import "MAAlbum.h"
#import "MAUserProfile.h"
#import "UIView+MAUtils.h"
#import "UIImageView+WebCache.h"

#define collectionViewCellHeight 70

@interface MACollectionViewCell ()

@property(nonatomic, strong) UIImageView *albumView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sigNatureLabel;
@end

@implementation MACollectionViewCell

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

- (void)refreshWithUserProfile:(MAUserProfile *) userProfile{
    
    [self.albumView setImageWithURL:[NSURL URLWithString:userProfile.avatarUrl] placeholderImage:nil];
    self.nameLabel.text = userProfile.userName;
    self.sigNatureLabel.text = userProfile.signature;
}

- (UIImageView *)albumView{
    if (!_albumView) {
        _albumView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, collectionViewCellHeight - 10, collectionViewCellHeight - 10)];
        _albumView.layer.cornerRadius = _albumView.width / 2.0;
        _albumView.layer.masksToBounds = YES;
    }
    return _albumView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.albumView.right + 15, self.albumView.top - 5, [UIScreen mainScreen].bounds.size.width - self.albumView.right - 5, 30)];
        _nameLabel.font = [UIFont systemFontOfSize:20];
    }
    return _nameLabel;
}

- (void)configureTagArray{

}

- (UILabel *)sigNatureLabel{
    if (!_sigNatureLabel) {
        _sigNatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.left, self.nameLabel.bottom + 15, self.nameLabel.width, 14)];
        [_sigNatureLabel setFont:[UIFont systemFontOfSize:13]];
        _sigNatureLabel.textColor = [UIColor grayColor];
        
    }
    return _sigNatureLabel;
}
@end
