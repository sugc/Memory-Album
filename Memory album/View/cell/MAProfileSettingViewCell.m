//
//  MAProfileSettingViewCell.m
//  Memory album
//
//  Created by 苏国材 on 16/5/15.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAProfileSettingViewCell.h"
#import "UIView+MAUtils.h"
#define cellHeight 40
@interface MAProfileSettingViewCell ()

@end

@implementation MAProfileSettingViewCell

+ (CGFloat)cellHeiht{
    return cellHeight;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview: self.textView];
    }
    return  self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, self.height)];
    }
    return _titleLabel;
}


- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(self.titleLabel.right + 20, 0, self.width - self.titleLabel.width - 20, self.height)];
        _textView.editable = NO;
        _textView.font = [UIFont systemFontOfSize:17];
    }
    return _textView;
}

@end