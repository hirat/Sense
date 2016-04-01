//
//  NetworkManager.h
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkManager : AFHTTPSessionManager

/**
 *  获取feeds列表
 *
 *  @param topicid      topicid
 *  @param successBlock 成功
 *  @param failureBlock 失败
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask*)fetchFeedsWithTopic:(NSString*)topicid
                                     success:(void (^)(id data))successBlock
                                     failure:(void (^)(NSError *aError))failureBlock;

@end
