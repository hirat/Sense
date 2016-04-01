//
//  FeedTableViewHeader.h
//  Sense
//
//  Created by Hirat on 16/4/1.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewHeader : UIView

- (void)updateWith:(NSString*)imageURL width:(CGFloat)width height:(CGFloat)height;

@property (nonatomic) CGFloat offset;

@end
