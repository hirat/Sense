//
//  FeedTableViewCell.h
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewCell : UITableViewCell

- (void)bind:(id)data;
- (void)updateIndexPath:(NSIndexPath*)indexPath;

@end
