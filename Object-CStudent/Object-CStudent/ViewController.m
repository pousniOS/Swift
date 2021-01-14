//
//  ViewController.m
//  Object-CStudent
//
//  Created by mac on 2020/11/9.
//

#import "ViewController.h"
#import <pthread/pthread.h>
#import "TestBlock.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,assign)pthread_cond_t cond;
@property(nonatomic,assign)pthread_mutex_t lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *but = UIButton.new;
    but.frame = CGRectMake(0, 0, 100, 100);
    but.backgroundColor = UIColor.blackColor;
    [self.view addSubview:but];
    [but addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)buttonAction:(UIButton *)sender{
    [self pustTest];
}
-(void)pustTest{
    ViewController *vc = ViewController.new;
    vc.view.backgroundColor = UIColor.redColor;
    [vc push:^{
        sleep(10);
        [self presentViewController:vc animated:YES completion:nil];
    }];
}


-(void)push:(void(^)(void))block{
    block();
}
-(void)block_test{
    TestBlock *block = TestBlock.new;
    [block run:^{
        sleep(5);
        UILabel *lable = UILabel.new;
        lable.frame = CGRectMake(0, 0, 100, 100);
        lable.text = block.description;
        [self.view addSubview:lable];
    }];
}
-(void)pthred_Test{
    self.dataArr = NSMutableArray.new;
    
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    pthread_mutex_init(&_lock, &attr);
    pthread_mutexattr_destroy(&attr);

    pthread_cond_init(&_cond, NULL);
    
    dispatch_queue_t queue_low = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_queue_t queue_high = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    __weak typeof(self) _self = self;
    dispatch_async(queue_high, ^{
        __strong typeof(_self) strongSelf = _self;
        if (strongSelf == nil) {
            return;
        }

        pthread_mutex_lock(&strongSelf->_lock);
        if (strongSelf.dataArr.count < 1) {
            NSLog(@"没数据等待删除");
            pthread_cond_wait(&strongSelf->_cond, &strongSelf->_lock);
        }
        NSLog(@"准备删除");
        [strongSelf.dataArr removeLastObject];
        NSLog(@"删除完成");
        pthread_mutex_unlock(&strongSelf->_lock);
    });
    
    dispatch_async(queue_low, ^{
        __strong typeof(_self) strongSelf = _self;
        if (strongSelf == nil) {
            return;
        }
        pthread_mutex_lock(&strongSelf->_lock);
        NSLog(@"准备添加");
        [strongSelf.dataArr addObject:@"XXX"];
        NSLog(@"添加完成");
        pthread_cond_signal(&strongSelf->_cond);
        pthread_mutex_unlock(&strongSelf->_lock);
    });
}

-(void)dealloc{
    pthread_mutex_unlock(&self->_lock);
}


@end
