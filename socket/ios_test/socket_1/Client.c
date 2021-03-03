#include<unistd.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<stdio.h>
#include<errno.h>
#include<string.h>
int main(void){
	int sock;
    if ((sock = socket(PF_INET,SOCK_STREAM,IPPROTO_TCP))<0)
//     listenfd = socket(PF_INET,SOCK_STREAM,0);
    {
        printf("socket\n");
//        _Exit(1);
    }
    printf("socket...\n");


    struct sockaddr_in servaddr;
    memset(&servaddr,0,sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(5188);
//    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
  servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
//  inet_aton("127.0.0.1",&servaddr.sin_addr);

    int conn = 0;
    if ((conn = connect(sock,(struct sockaddr*)&servaddr,sizeof(servaddr)))<0){
        printf("accept\n");
//        _Exit(1);
    }
    printf("accept...\n");
    char sendbuf[1024] = {0};
    char recvbuf[1024] = {0};
    while (fgets(sendbuf, sizeof(sendbuf), stdin) != NULL) {
        write(sock,sendbuf,strlen(sendbuf));
        read(sock, recvbuf, sizeof(recvbuf));
        fputs(recvbuf, stdout);
        memset(sendbuf, 0, sizeof(sendbuf));
        memset(recvbuf, 0, sizeof(recvbuf));
    }
    close(sock);
    return 0;
}
