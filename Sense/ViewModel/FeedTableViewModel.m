//
//  FeedTableViewModel.m
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import "FeedTableViewModel.h"
#import <ReactiveCocoa.h>
#import "NetworkManager.h"
#import "FeedModel.h"

@interface FeedTableViewModel ()
@property (nonatomic, strong) FeedModel* feed;
@end

@implementation FeedTableViewModel

- (instancetype)init
{
    if (self = [super init])
    {
        @weakify(self);
        [self.didBecomeActiveSignal subscribeNext:^(id x) {
           
            @strongify(self);
            [NetworkManager fetchFeedsWithTopic: self.topicid success:^(id data) {
                
                @strongify(self);
                
                NSError* error;
                self.feed = [[FeedModel alloc] initWithDictionary: data error: &error];
                
                if (error)
                {
                    NSLog(@"error: %@", error.localizedDescription);
                }
                
            } failure:^(NSError *aError) {
                
            }];
            
        }];
    }
    
    return self;
}

@end
