//
//  FeedTableViewModel.h
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import <ReactiveViewModel/ReactiveViewModel.h>
#import "FeedModel.h"

@interface FeedTableViewModel : RVMViewModel

@property (nonatomic, copy) NSString* topicid;

@property (nonatomic, strong, readonly) FeedModel* feed;

@end
