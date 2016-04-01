//
//  FeedModel.h
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol FeedObject <NSObject>
@end

@protocol FeedImageObject <NSObject>
@end

@interface FeedModel : JSONModel

@property (nonatomic, copy) NSString* topicid;
@property (nonatomic, strong) NSArray<FeedObject>* list;

@end

@interface FeedObject : JSONModel

@property (nonatomic, copy) NSString* boardid;
@property (nonatomic, copy) NSString* digest;
@property (nonatomic, copy) NSString* docid;
@property (nonatomic, copy) NSString* postid;
@property (nonatomic) NSInteger shareCount;
@property (nonatomic, copy) NSString* source;
@property (nonatomic, copy) NSString* title;

@property (nonatomic, strong) NSArray<FeedImageObject>* imageList;

@end

@interface FeedImageObject : JSONModel
@property (nonatomic, copy) NSString* bodyImgsrc;
@property (nonatomic, copy) NSString* bodyPixel;
@property (nonatomic, copy) NSString* imgsrc;
@property (nonatomic, copy) NSString* lightDotLeft;
@property (nonatomic, copy) NSString* lightDotTop;
@property (nonatomic, copy) NSString* pixel;
@end