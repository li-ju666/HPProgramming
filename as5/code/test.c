#include <pthread.h>
#include <stdio.h>

pthread_barrier_t bar; 
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER; 
pthread_cond_t cond = PTHREAD_COND_INITIALIZER; 

int finish=0, update=0, sub=0; 

void* threadfun(void* arg){
    while(finish==0){
	pthread_mutex_lock(&mutex); 
	while(update == 0){
	    pthread_cond_wait(&cond, &mutex); 
	    printf("I am waiting! \n"); 
	}
	pthread_mutex_unlock(&mutex); 
	printf("Subprint! \n");
	sub++; 	
	pthread_barrier_wait(&bar); 
    }
}

int main(){
    pthread_t id[5]; 
    pthread_barrier_init(&bar, NULL, 6); 

    for(int i=0; i<5; i++){
	pthread_create(&id[i], NULL, threadfun, NULL); 
    }
    printf("threads created. \n"); 
    
    printf("main print start! \n"); 
    pthread_mutex_lock(&mutex); 
    update = 1; 
    pthread_cond_broadcast(&cond); 
    pthread_mutex_unlock(&mutex); 

    int i = 1;
    while(i<5){
	pthread_barrier_wait(&bar); 
	printf("Main print! \n"); 
	pthread_mutex_lock(&mutex); 
    	printf("sub: %d. \n", sub); 
	update = 1; 
	sub = 0; 
	pthread_cond_broadcast(&cond);
	pthread_mutex_unlock(&mutex); 	
	i++; 
    }
    pthread_barrier_wait(&bar); 
    finish = 1; 
}
