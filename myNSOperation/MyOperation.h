//
//  MyOperation.h
//  myNSOperation
//
//  Created by Ericzhou on 14-5-23.
//  Copyright (c) 2014年 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MyOperation;
@protocol postDataDelegate <NSObject>

-(void)postData:(MyOperation *)opt;

@end

@interface MyOperation : NSOperation<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property (nonatomic,assign) int tag;
@property (nonatomic,strong) NSMutableData *data;
@property (nonatomic,weak) id<postDataDelegate>delegate;

-(id)initWithUrl:(NSString *)url;
@end
