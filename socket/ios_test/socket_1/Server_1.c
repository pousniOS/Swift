//
//  Server_1.c
//  ios_test
//
//  Created by mac on 2021/3/4.
//  Copyright © 2021 apple. All rights reserved.
//

#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <arpa/inet.h>
#include <unistd.h>

void do_service(int conn){
    char recvbuf[1024];
    while (1) {
        memset(recvbuf, 0, sizeof(recvbuf));
        size_t ret = read(conn, recvbuf, sizeof(recvbuf));
        if (ret == 0) {//说明客户端关闭了
            printf("client_close\n");
            break;
        }else if (ret == -1){
            _exit(-1);
        }
        fputs(recvbuf, stdout);
        write(conn, recvbuf, ret);
    }
}

int main(void){
    int l  = socket(PF_INET,SOCK_STREAM,IPPROTO_TCP);
    if (l<0) {//创建失败
        printf("socket error\n");
        return -1;
    }
    printf("socket completed...\n");
    
    struct sockaddr_in s_addr;
    memset(&s_addr, 0, sizeof(s_addr));
    s_addr.sin_family = AF_INET;//协议类型
    s_addr.sin_port = htons(5188);//端口
    s_addr.sin_addr.s_addr = htonl(INADDR_ANY);//IP地址

//  s_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
//  inet_aton("127.0.01", (struct sockaddr*)&s_addr);
    int on;
    if (setsockopt(l, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on))<0) {
        printf("setsockopt error\n");
        return -1;
    }
    printf("setsockopt...\n");

    
    int b = bind(l, (struct sockaddr *)&s_addr, sizeof(s_addr));
    if (b<0) { //绑定失败
        printf("bind error\n");
        return -1;
    }
    printf("bind completed...\n");
    printf("绑定的IP和端口号:%s_%d\n",inet_ntoa(s_addr.sin_addr),ntohs(s_addr.sin_port));
    
    if (listen(l, SOMAXCONN) < 0) {
        printf("listen error\n");
        return -1;
    }
    printf("listen completed...\n");

    struct sockaddr_in conn_addr;
    socklen_t conn_len = sizeof(conn_addr);
    pid_t pid;
    while (1) {
        int conn = accept(l, (struct sockaddr*)&conn_addr, &conn_len);
        if (conn < 0) {
            printf("accept error\n");
            return -1;
        }
        printf("连接方的IP和端口号:%s_%d\n",inet_ntoa(conn_addr.sin_addr),ntohs(conn_addr.sin_port));
        printf("accept completed...\n");
        
        pid = fork();
        if (pid == -1) {
            printf("pid error...\n");
            return -1;
        }

        if (pid == 0) {
            close(l);
            do_service(conn);
            _exit(0);
        }else{
            close(conn);
        }
    }
    
    return 0;
}

