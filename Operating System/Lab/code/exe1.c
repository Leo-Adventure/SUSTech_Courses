#include<stdlib.h>
#include<unistd.h>
#include<stdio.h>

int main(int argc, char *argv[]){
    int x = 10;
    int child = fork();
    
    x = 100;
    if(child < 0){
        fprintf(stderr, "child process failed\n");
    }else if(child == 0){
        printf("In child process, x = %d\n", x);
        x = 1000;
    }else{
        wait(NULL);
        printf("In parent process before, x = %d\n", x);
        x = 10000;
        printf("In parent process before, x = %d\n", x);
    }
    return 0;
}