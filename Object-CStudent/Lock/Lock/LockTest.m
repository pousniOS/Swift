//
//  LockTest.m
//  Lock
//
//  Created by mac on 2020/11/9.
//

#import "LockTest.h"
#import <pthread/pthread.h>
@implementation LockTest
+(void)spin_lock{
    /*
     ## SpinLock
     + OSSpinLock存在线程安全问题,它可能导致优先级反转问题,目前我们在任何情况先都不应该使用它
     + atmic:原子操作,但他不是线程安全的,它的原子性仅限于它修饰的变量的setter、getter
     + 自旋锁OSSpinLock不是一个线程安全的锁,等待的线程处于忙等待的状态(busy-wait)状态,一直暂用cup资源.(类似一个while(1)循环一样,不停查询锁的状态)
     + 例如A/B两个线程 A线程的优先级大于B,但是使用OSSpinlock加锁,如果B优先获取共享资源的访问并加锁,A在去访问共享资源时处于加锁状态会处于忙等到状态,由于
     A的优先级高它会一直暂用cup资源不会让出时间片,这样B一直不能获得cup资源去执行任务,导致任务一直无法执行完成
     **/
    
    OSSpinLock spinLock = OS_SPINLOCK_INIT;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
   __block NSInteger sum = 0;

    dispatch_async(queue, ^{
        OSSpinLockLock(&spinLock);
        for (NSInteger i = 0; i<1000; i++) {
            sum += 1;
        }
        NSLog(@"1.sum:%ld",sum);
        OSSpinLockUnlock(&spinLock);
    });

    dispatch_async(queue, ^{
        OSSpinLockLock(&spinLock);
        for (NSInteger i = 0; i<1000; i++) {
            sum += 1;
        }
        NSLog(@"2.sum:%ld",sum);
        OSSpinLockUnlock(&spinLock);
    });
}
+(void)unfiar_lock{
    /*:
     ## un_fair_lock
     + 当线程处于等待状态线程会休眠
     + un_fair_lock 是一种低级锁,在日常开发中一线高级锁才是我们的首选
     + 在那个线程加的锁就必须使用该线程解锁
     + 不能通过共享或多重映射内存从多个进程或线程访问此锁,锁的实现依赖锁的内存地址和所属的进程
     + 必须使用OS_UNFAIR_LOCK_INIT来初始化
     **/
    os_unfair_lock unfair_lock = OS_UNFAIR_LOCK_INIT;
}
+(void)pthread_mutex{
    pthread_mutex_t mutex;
    pthread_attr_t mutex_attr;
    pthread_mutex_init(&mutex, &mutex_attr);
    
    pthread_mutexattr_settype(<#pthread_mutexattr_t * _Nonnull#>, <#int#>)
}
@end
