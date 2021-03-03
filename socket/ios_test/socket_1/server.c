#include<unistd.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<stdio.h>
#include<errno.h>
#include<string.h>
int main(void){
	int listenfd;
    if ((listenfd = socket(PF_INET,SOCK_STREAM,IPPROTO_TCP))<0)
//  listenfd = socket(PF_INET,SOCK_STREAM,0);
    {
        printf("socket\n");
    }
    printf("socket...\n");

        
    struct sockaddr_in servaddr;
    memset(&servaddr,0,sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(5188);
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
//  servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
//  inet_aton("127.0.0.1",&servaddr.sin_addr);
    
    int on;
    if (setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on))<0) {
        printf("REUSEADDR\n");
    }
    printf("REUSEADDR...\n");

    
    if (bind(listenfd,(struct sockaddr*)&servaddr,sizeof(servaddr))<0){
        printf("bind\n");
    }
    printf("bind...\n");


    if (listen(listenfd,SOMAXCONN)<0){
        printf("listen\n");
    }
    printf("listen...\n");

    struct sockaddr_in peeraddr;
    socklen_t peerlen = sizeof(peeraddr);
    
    int conn = 0;
    if ((conn = accept(listenfd,(struct sockaddr*)&peeraddr,&peerlen))<0){
        printf("accept\n");
    }
    printf("accept...\n");

    char recvbuf[1024];
    while (1) {
        memset(recvbuf,0,sizeof(recvbuf));
        ssize_t ret = read(conn,recvbuf,sizeof(recvbuf));
        fputs(recvbuf,stdout);
        write(conn,recvbuf,ret);
    }
    close(conn);
    close(listenfd);
    return 0;
}
