//
//  MyOperation.m
//  myNSOperation
//
//  Created by Ericzhou on 14-5-23.
//  Copyright (c) 2014年 lcx. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation
{
   BOOL  _isDownloadFinish;
   NSURL *_url;
   
}

- (instancetype)initWithUrl:(NSString *)url
{
    self = [super init];
    if (self) {
        _url = [NSURL URLWithString:url];
        _data = [[NSMutableData alloc] init];
    }
    return self;
}

//main函数自动执行
-(void)main
{
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    while (!_isDownloadFinish) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];//NSDefaultRunLoopMode不能写成NSRunLoopCommonModes
        
    }
    NSLog(@"dead %d",self.tag);//  子线程几乎无序并发执行。
}

#pragma mark - NSConnectiondatadelegate
-(void )connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _data.length = 0;

}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (_delegate && [_delegate respondsToSelector:@selector(postData:)]) {
        [_delegate postData:self];
    }
    _isDownloadFinish = YES;
    NSLog(@"data");
}
@end
