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
    
    char sendbuf[1024] = {0};
    char revcbuf[1024] = {0};
    while (fgets(sendbuf, sizeof(sendbuf), stdin) != NULL) {
        write(st, sendbuf, strlen(sendbuf));
        read(st, revcbuf, sizeof(revcbuf));
        fputs(revcbuf, stdout);
        memset(sendbuf, 0, sizeof(sendbuf));
        memset(revcbuf, 0, sizeof(revcbuf));
    }
    close(conn);
    return 0;
}
