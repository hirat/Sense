//
//  FeedTableViewTopCell.h
//  Sense
//
//  Created by Hirat on 16/4/1.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewTopCell : UITableViewCell
- (void)bind:(id)data;
- (void)updateIndexPath:(NSIndexPath*)indexPath;
@end
