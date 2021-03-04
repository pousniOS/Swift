//
//  ViewController.m
//  ios_test
//
//  Created by apple on 17/8/2020.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"
#include <arpa/inet.h>
#include <netinet/in.h>
#import "Test.h"
#import <sys/socket.h>
@interface ViewController ()
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UITextField *smgTextField;
@property(nonatomic,strong)UIButton *startBut;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat top = 64;
    CGFloat width = self.view.frame.size.width;
    
    UITextView *textView = UITextView.new;
    _textView = textView;
    textView.layer.cornerRadius = 4.0f;
    textView.layer.borderColor = UIColor.blackColor.CGColor;
    textView.layer.borderWidth = 1.0f;
    [self.view addSubview:textView];
    textView.frame = CGRectMake(10, top, width-20, 100);
    top += 100 +10;
    
    UITextField * textFiled = UITextField.new;
    _smgTextField = textFiled;
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textFiled];
    textFiled.frame = CGRectMake(10, top, width-20-60, 40);
    
    
    UIButton *startBut = UIButton.new;
    _startBut = startBut;
    startBut.layer.cornerRadius = 4.0f;
    startBut.layer.borderColor = UIColor.blackColor.CGColor;
    startBut.layer.borderWidth = 1.0f;
    startBut.frame = CGRectMake(10+width-20-50, top, 60, 40);
    [self.view addSubview:startBut];
    [startBut addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [startBut setTitle:@"启动" forState:UIControlStateNormal];
    [startBut setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    
}
-(void)buttonAction:(UIButton *)sender{
    [self _socket];
}
- (void)_socket{
    int skt  = socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
    if (skt<0) {
        NSLog(@"socket create fail");
        return;
    }
    NSLog(@"socket 连接成功");
    struct sockaddr_in servaddr;
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(5188);
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);//本机任意的一个ip地址
//    servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
//    inet_aton("127.0.0.1", &servaddr.sin_addr);
    int on = 1;
    if (setsockopt(skt, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on))<0) {
        NSLog(@"REUSEADDR 设置失败");
        return;
    }
    NSLog(@"REUSEADDR 设置成功");
    
    int b = bind(skt, (struct sockaddr*)&servaddr, sizeof(servaddr));
    if (b<0) {
        NSLog(@"bild fail");
        return;
    }
    NSLog(@"socket 绑定成功");

    
    int l = listen(skt, SOMAXCONN);
    if (l<0) {
        NSLog(@"listen fail");
        return;
    }
    NSLog(@"socket 监听成功");
    
    struct sockaddr_in peer_add;
    socklen_t peer_add_len;
    memset(&peer_add, 0, sizeof(peer_add));
    int a = accept(skt, (struct sockaddr *)&peer_add, &peer_add_len);
    if (a<=0) {
        NSLog(@"accept fail");
        return;
    }
    NSLog(@"socket 已经接收到连接");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        char recvbuf[1024];
        while (1) {
            memset(recvbuf, 0, sizeof(recvbuf));
           size_t ret = read(a, recvbuf, sizeof(recvbuf));
            NSString *string = [NSString stringWithUTF8String:recvbuf];
            if ((int)ret>0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    _textView.text = string;
                });
                write(a, recvbuf, sizeof(recvbuf));
            }
        }
    });
    
}


@end
