//
//  ViewController.m
//  myNSOperation
//
//  Created by Ericzhou on 14-5-23.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  oc队列：NSOperation加到NSOperationQueue中，自动执行NSOperation的main函数方法。

#import "ViewController.h"


@interface ViewController ()
{
    UIScrollView *_scrollView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, 320, 200)];
    _scrollView.contentSize = CGSizeMake(320*3, 200);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    for (int i=0 ; i<3; i++) {
        UIImageView *imgView =[[UIImageView alloc] initWithFrame:CGRectMake(320*i, 20, 320, 200)];
        [_scrollView addSubview:imgView];
    }
    
    NSArray *arr = @[@"http://img.app.d1cm.com/news/img/201312021616153719.jpg",
                     @"http://img1.xcarimg.com/b63/s2515/m_20110718163332702074.jpg",
                     @"http://img.app.d1cm.com/news/img/201312021610065708.jpg"];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    for (int i=0; i<3; i++) {
        MyOperation *opt = [[MyOperation alloc] initWithUrl:arr[i]];
        opt.tag = i;
        opt.delegate = self;
        [queue addOperation:opt];
    }
    
    
}


-(void)postData:(MyOperation *)opt
{
    UIImageView *imgView = (UIImageView *)_scrollView.subviews[opt.tag];
    imgView.image = [UIImage imageWithData:opt.data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
