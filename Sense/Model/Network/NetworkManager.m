//
//  NetworkManager.m
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (instancetype)sharedInstance
{
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        _sharedInstance.responseSerializer = responseSerializer;
    });
    
    return _sharedInstance;
}


+ (NSURLSessionDataTask*)fetchFeedsWithTopic:(NSString*)topicid
                                     success:(void (^)(id data))successBlock
                                     failure:(void (^)(NSError *aError))failureBlock
{
    NSString* url = [NSString stringWithFormat: @"http://l.m.163.com/light/reportArticle/list/%@/0-20.html", topicid];
    return [[NetworkManager sharedInstance] GET: url parameters: nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        successBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(error);
        
    }];
}

@end
