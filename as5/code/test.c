#include <pthread.h>
#include <stdio.h>
#include <math.h>

pthread_barrier_t bar; 
pthread_mutex_t mutex; 
pthread_cond_t cond_update = PTHREAD_COND_INITIALIZER, cond_cal = PTHREAD_COND_INITIALIZER; 

#define MAX 1000000

int end = 0, waiting = 0, update=0; 

void* threadfun(void* arg){
    while(end == 0){
	pthread_mutex_lock(&mutex); 
	while(1){
	    waiting++;
	    /* printf("Now %d threads are waiting. \n", waiting); */ 
	    pthread_cond_wait(&cond_update, &mutex);
	    /* printf("Notified. \n"); */ 
	    if(end == 1){return NULL;}
	    break; 
	}
	pthread_mutex_unlock(&mutex); 
	for(int i=0; i<MAX; i++){
	    double a = sqrt(i); 
	}
	printf("This is the sub thread. \n"); 
	pthread_barrier_wait(&bar); 
    }
}


int main(){
    pthread_t id[5]; 
    pthread_barrier_init(&bar, NULL, 6); 

    for(int i=0; i<5; i++){
	pthread_create(&id[i], NULL, threadfun, NULL); 
    }
    printf("threads created but not working. \n"); 

    printf("Main Start! \n"); 
    while(1){
        pthread_mutex_lock(&mutex); 
	if(waiting == 5){
	    /* printf("Enough prepared. \n"); */ 
	    break; 
	}
	pthread_mutex_unlock(&mutex); 
    }
    waiting = 0; 
    pthread_cond_broadcast(&cond_update); 
    pthread_mutex_unlock(&mutex); 

    int i = 1;
    while(i<5){
	pthread_barrier_wait(&bar);
	while(1){
	    pthread_mutex_lock(&mutex); 
	    if(waiting == 5){
		break; 
	    }
	    pthread_mutex_unlock(&mutex); 
	}
	for(int j=0; j<MAX; j++){
	    double b = sqrt(j); 
	}
	printf("This is the main thread! \n"); 
	waiting = 0; 
	pthread_cond_broadcast(&cond_update);
	pthread_mutex_unlock(&mutex); 	
	i++;
       	/* printf("Now i is %d. \n", i); */ 
    }
    pthread_barrier_wait(&bar); 
    while(1){
        pthread_mutex_lock(&mutex); 
        if(waiting == 5){
	    break; 
	}
        pthread_mutex_unlock(&mutex);
    }
    end = 1; 
    pthread_mutex_unlock(&mutex); 

    printf("Finished! \n"); 
    ; 
}
