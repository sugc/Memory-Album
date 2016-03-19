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
#import "UIView+MAUtils.h"

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

- (void)refreshWithAlbum:(MAAlbum *) album{
    self.albumView.image = [UIImage imageNamed:@"avatar.png"];
    self.nameLabel.text = @"larray";
    self.sigNatureLabel.text = @"dashkkas";
}

- (UIImageView *)albumView{
    if (!_albumView) {
        _albumView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, collectionViewCellHeight - 10)];
    }
    return _albumView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.albumView.right + 5, self.albumView.top - 5, [UIScreen mainScreen].bounds.size.width - self.albumView.right - 5, 15)];
    }
    return _nameLabel;
}

- (void)configureTagArray{

}

- (UILabel *)sigNatureLabel{
    if (!_sigNatureLabel) {
        _sigNatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.left, self.nameLabel.bottom + 25, self.nameLabel.width, 14)];
        
    }
    return _sigNatureLabel;
}
@end
