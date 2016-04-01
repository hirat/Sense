//
//  FeedModel.m
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import "FeedModel.h"

@implementation FeedModel

@end

@implementation FeedObject

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end

@implementation FeedImageObject

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
