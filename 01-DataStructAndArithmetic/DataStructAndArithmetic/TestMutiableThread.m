//
//  TestMutiableThread.m
//  DataStructAndArithmetic
//
//  Created by gegaozhao on 2020/11/25.
//

#import "TestMutiableThread.h"

@implementation TestMutiableThread

- (void)test {
    dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); // 并发队列
    dispatch_async(global_queue, ^{
        NSLog(@"1");
        [self performSelector:@selector(printLog) withObject:nil afterDelay:0];
        NSLog(@"3");
    });
        
}
- (void)printLog {
    NSLog(@"2");
}

@end
