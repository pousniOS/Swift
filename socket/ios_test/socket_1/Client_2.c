//
//  Client_1.c
//  ios_test
//
//  Created by mac on 2021/3/4.
//  Copyright © 2021 apple. All rights reserved.
//

#include<stdio.h>
#include<sys/socket.h>
#include <sys/types.h>
#include <arpa/inet.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
int main(void){
    int st = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (st<0) {
        printf("socket error\n");
        return -1;
    }
    printf("socket completed...\n");
    
    struct sockaddr_in addr;
    memset(&addr,0,sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_port = htons(5188);
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");

    int conn = connect(st, (struct sockaddr *)&addr, sizeof(addr));
    if (conn<0) {
        printf("connect error\n");
        return -1;
    }
    printf("connect compeleted\n");
    
    
    pid_t pid;
    pid = fork();
    if (pid == -1) {
        printf("fork error...");
        _exit(-1);
    }
    
    if (pid == 0) {
        char sendbuf[1024] = {0};
        while (fgets(sendbuf, sizeof(sendbuf), stdin) != NULL) {
            write(st, sendbuf, strlen(sendbuf));
            memset(sendbuf, 0, sizeof(sendbuf));
        }
        _exit(0);
    }else{
        char revcbuf[1024] = {0};
        while (1) {
           size_t ret = read(st, revcbuf, sizeof(revcbuf));
            if (ret == -1) {
                _exit(-1);
            }else if (ret == 0){
                printf("server is close\n");
                _exit(0);
            }
            fputs(revcbuf, stdout);
            memset(revcbuf, 0, sizeof(revcbuf));
        }
    }
    

    return 0;
}
