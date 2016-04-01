//
//  FeedTableViewHeader.m
//  Sense
//
//  Created by Hirat on 16/4/1.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import "FeedTableViewHeader.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface FeedTableViewHeader ()
@property (nonatomic, strong) UIImageView* mainImageView;
//@property (nonatomic) CGFloat imageHeight;
//@property (nonatomic) CGFloat imageWidth;
@property (nonatomic) CAShapeLayer* shapeLayer;
@end

@implementation FeedTableViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame])
    {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI
{
    self.clipsToBounds = YES;
    CGFloat scale = 1.5;
    CGFloat width = self.frame.size.width*scale;
    CGFloat height = width*3/4;
    
    self.mainImageView = [[UIImageView alloc] initWithFrame: CGRectMake(self.frame.size.width*(1 - scale)/2.0f, 0, width, height)];
    self.mainImageView.clipsToBounds = YES;
    [self addSubview: self.mainImageView];
    
    CGSize finalSize = CGSizeMake(CGRectGetWidth(self.frame), 400);
    CGFloat layerHeight = finalSize.height * 0.1;
    self.shapeLayer = [CAShapeLayer layer];
    UIBezierPath* bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint: CGPointMake(0, finalSize.height -layerHeight)];
    [bezier addLineToPoint: CGPointMake(0, finalSize.height)];
    [bezier addLineToPoint: CGPointMake(finalSize.width, finalSize.height)];
    [bezier addLineToPoint: CGPointMake(finalSize.width, finalSize.height - layerHeight)];
    [bezier addQuadCurveToPoint: CGPointMake(0,finalSize.height - layerHeight)
                   controlPoint: CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) + 120/1.5)];
    self.shapeLayer.path = bezier.CGPath;
    self.shapeLayer.fillColor = [UIColor whiteColor].CGColor;

    [self.layer addSublayer: self.shapeLayer];
}

- (void)updateWith:(NSString*)imageURL width:(CGFloat)width height:(CGFloat)height
{
//    self.imageWidth = width;
//    self.imageHeight = height;
    
    [self.mainImageView sd_setImageWithURL: [NSURL URLWithString: imageURL]];
}

- (void)setOffset:(CGFloat)offset
{
    _offset = offset;

    if (offset <= 120
        && offset > 0
        )
    {
        CGFloat scale = 1.5 - offset/240;
        CGFloat width = self.frame.size.width*scale;
        CGFloat height = width*3/4;
        self.mainImageView.frame = CGRectMake(self.frame.size.width*(1 - scale)/2.0f, offset, width, height);
        
        CGSize finalSize = CGSizeMake(CGRectGetWidth(self.frame), 400);
        CGFloat layerHeight = finalSize.height * 0.1;
        
        UIBezierPath* bezier = [UIBezierPath new];
        [bezier moveToPoint: CGPointMake(0, finalSize.height -layerHeight)];
        [bezier addLineToPoint: CGPointMake(0, finalSize.height)];
        [bezier addLineToPoint: CGPointMake(finalSize.width, finalSize.height)];
        [bezier addLineToPoint: CGPointMake(finalSize.width, finalSize.height - layerHeight)];
        [bezier addQuadCurveToPoint: CGPointMake(0,finalSize.height - layerHeight)
                       controlPoint: CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) + (120 - offset)/scale)];
        self.shapeLayer.path = bezier.CGPath;
    }
}

@end
