//
//  TestBlock.m
//  Object-CStudent
//
//  Created by mac on 2020/12/11.
//

#import "TestBlock.h"

@implementation TestBlock
-(void)run:(void(^)(void))block{
    dispatch_queue_t queue = dispatch_queue_create(@"test.queue".UTF8String, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        sleep(5);
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    });
}
@end
