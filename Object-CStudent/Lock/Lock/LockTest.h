//
//  LockTest.h
//  Lock
//
//  Created by mac on 2020/11/9.
//

#import <Foundation/Foundation.h>
#import <libkern/OSAtomic.h>
#import <os/lock.h>

NS_ASSUME_NONNULL_BEGIN

@interface LockTest : NSObject
+(void)spin_lock;//自旋锁
@end

NS_ASSUME_NONNULL_END
