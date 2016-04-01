//
//  FeedTableViewCell.m
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import "FeedTableViewCell.h"
#import "FeedModel.h"
#import <Masonry.h>
#import <Colours.h>
#import <UIImageView+WebCache.h>

#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface FeedTableViewCell ()
@property (nonatomic, strong) UIImageView* mainImageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* contentLabel;

@property (nonatomic, strong) NSIndexPath* indexPath;

@end

@implementation FeedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier: reuseIdentifier])
    {
        [self makeUI];
    }
    
    return self;
}

#pragma mark - 私有函数

- (void)makeUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.mainImageView = [UIImageView new];
    self.mainImageView.clipsToBounds = YES;
    self.mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview: self.mainImageView];
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.and.trailing.mas_equalTo(0);
        make.height.mas_equalTo(kScreenW*0.58);
    }];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [UIColor colorFromHexString: @"666666"];
    self.titleLabel.font = [UIFont boldSystemFontOfSize: 24];
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview: self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(24);
        make.trailing.mas_equalTo(-24);
        make.top.equalTo(self.mainImageView.mas_bottom).offset(24);
    }];
    
    self.contentLabel = [UILabel new];
    self.contentLabel.textColor = [UIColor colorFromHexString: @"666666"];
    self.contentLabel.font = [UIFont systemFontOfSize: 17];
    self.contentLabel.numberOfLines = 0;
    [self.contentView addSubview: self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(24);
        make.trailing.mas_equalTo(-24);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(24);
    }];
    
    UIView* padView = [UIView new];
    padView.backgroundColor = [UIColor colorFromHexString: @"eeeeee"];
    [self.contentView addSubview: padView];
    [padView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(24);
        make.bottom.mas_equalTo(0);
        make.leading.and.trailing.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
}

#pragma mark - 公有函数

- (void)bind:(FeedObject*)feed
{
    FeedImageObject* image = feed.imageList.firstObject;
    [self.mainImageView sd_setImageWithURL: [NSURL URLWithString: image.imgsrc]];
    self.titleLabel.text = feed.title;
    self.contentLabel.text = feed.digest;
}

- (void)updateIndexPath:(NSIndexPath*)indexPath
{
    
}


@end
