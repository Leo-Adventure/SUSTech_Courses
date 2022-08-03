/*dad_mem_mutex.c*/
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

const int BOUND = 100;

int count = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

void *dad(void *arg)
{
    int i = 5;
    while (i--)
    {
        printf("Dad comes home.\n");
        sleep(rand() % 2 + 1);
        printf("Dad checks the fridge.\n");
        pthread_mutex_lock(&mutex);
        printf("Dad add lock\n");
        count--;
        printf("milk number is %d\n", count);
        if (count <= 0)
        {
            pthread_cond_signal(&cond);
        }
        printf("Dad release lock\n");
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}

void *me(void *arg)
{
    int i = 5;
    while (i--)
    {
        printf("I comes home.\n");
        sleep(rand() % 2 + 1);
        printf("I checks the fridge.\n");
        pthread_mutex_lock(&mutex);
        printf("I add lock\n");
        count--;
        printf("milk number is %d\n", count);
        if (count <= 0)
        {
            pthread_cond_signal(&cond);
        }
        printf("I release lock\n");
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}

void *sister(void *arg)
{
    int i = 5;

    while (i--)
    {
        pthread_mutex_lock(&mutex);
        printf("sister add lock\n");
        if (count > 0)
        {
            printf("sister begin wait\n");
            pthread_cond_wait(&cond, &mutex);
            printf("sister end wait\n");
        }
        count++;
        printf("milk number is %d\n", count);
        pthread_mutex_unlock(&mutex);
        printf("sister release lock\n");
    }
    return NULL;
}

void *mom(void *arg)
{
    int i = 5;

    while (i--)
    {
        pthread_mutex_lock(&mutex);
        printf("Mom add lock\n");
        if (count > 0)
        {
            printf("Mom begin wait\n");
            pthread_cond_wait(&cond, &mutex);
            printf("Mom end wait\n");
        }
        count++;
        printf("milk number is %d\n", count);
        pthread_mutex_unlock(&mutex);
        printf("Mom release lock\n");
    }
    return NULL;
}

int main(int argc, char *argv[])
{
    pthread_t producethread1, producethread2, consumethread1, consumethread2;
    pthread_create(&consumethread1, NULL, dad, NULL);
    pthread_create(&consumethread2, NULL, mom, NULL);
    pthread_create(&producethread1, NULL, me, NULL);
    pthread_create(&producethread2, NULL, sister, NULL);
    pthread_join(producethread1, NULL);
    pthread_join(consumethread1, NULL);
    pthread_join(producethread2, NULL);
    pthread_join(consumethread2, NULL);
    return 0;
}
