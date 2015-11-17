//
//  ViewController.m
//  GCD_Test
//
//  Created by zhangfei on 15/11/17.
//  Copyright © 2015年 zhangfei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - dispatch_suspend 立即停止队列的运行
    dispatch_queue_t queue = dispatch_queue_create("me.zhangferry.gcd", DISPATCH_QUEUE_SERIAL);
    //提交第一个block,延时5秒打印
    dispatch_async(queue, ^{
        NSLog(@"this is begin");
        [NSThread sleepForTimeInterval:5];
        NSLog(@"After 5 seconds...");
        
    });
    
    //提交第二个block，延时5秒打印
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:5];
        NSLog(@"After 5 seconds again...");
    });
    
    //延时一秒
    NSLog(@"sleep 1 second...");
    [NSThread sleepForTimeInterval:1];
    
    //挂起队列，只对queue起作用，挂起之前的queue内的命令还要继续运行
    NSLog(@"suspend...");
    dispatch_suspend(queue);
    
    //延时10秒
    NSLog(@"sleep 10 second...");
    [NSThread sleepForTimeInterval:10];
    
    //恢复队列
    NSLog(@"resume");
    dispatch_resume(queue);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
