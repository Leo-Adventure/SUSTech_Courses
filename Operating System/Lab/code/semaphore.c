#include <semaphore.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

typedef struct _Zem_t{
    int value;
    pthread_cond_t cond;
    pthread_mutex_t lock;

} Zem_t;

void Zem_init(Zem_t *s, int value){
    s -> value = value;
    Cond_init(&s -> cond);
    Mutex_init(&s -> lock);
}

void Zem_wait(Zem_t *s){
    Mutex_lock(&s -> lock);
    while(s -> value <= 0){
        Cond_wait(&s -> cond, &s -> lock);
    }
    s -> value --;
    Mutex_unlock(&s -> lock);
}

void Zem_post(Zem_t *s){
    Mutex_lock(&s -> lock);
    s -> value ++;
    Cond_signal(&s -> cond);
    Mutex_unlock(&s -> lock);
}
