#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    printf("hello world (pid: %d)\n", (int)getpid());
    int rc = fork();
    if (rc < 0)
    {
        fprintf(stderr, "fork failed\n");
    }
    else if (rc == 0)
    {
        printf("hello, I am child (pid = %d)\n", (int) getpid());
        char *myargs[3];
        myargs[0] = strdup("wc");
        myargs[1] = strdup("p1.c");
        myargs[2] = NULL;
        execvp(myargs[0], myargs);
        printf("This shouldn't print out");
    }else{
        int wc = wait(NULL); // wc 为子进程的进程描述符
        printf("Hello, wc = %d\n", wc);
        printf("hello, I am parent of %d (pid: %d)\n", rc, (int) getpid());
    }
    return 0;
}