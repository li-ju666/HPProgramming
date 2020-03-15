#include "structdef.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <pthread.h>

typedef struct threaddata{
    int id, nthread, pnum; 
    double delta_t, THETA;
    node** root;  
    particle* part_ary; 
}threaddata; 

pthread_barrier_t bar; 
pthread_mutex_t mutex; 
pthread_cond_t cond = PTHREAD_COND_INITIALIZER; 

int waiting = 0, end = 0; 

void* threadfun(void* arg){
    /* data preparation */ 
    threaddata* mydata = (threaddata*)arg;
    int id = mydata->id, nthread = mydata->nthread, pnum = mydata->pnum; 
    double delta_t = mydata->delta_t, THETA = mydata->THETA; 
    node** root = mydata->root; 
    particle* part_ary = mydata->part_ary; 
    printf("id: %d. \n", id); 
    while(end == 0){
	/* logic control */
	pthread_mutex_lock(&mutex); 
	while(1){
	    waiting++; 
	    pthread_cond_wait(&cond, &mutex); 
	    if(end == 1){return NULL; }
	    break; 
	}
	pthread_mutex_unlock(&mutex);
	 
	/* subwork to do */
	for(int i=id; i<pnum; i=i+nthread){
	    vec2d acce = {0,0};
	    acccal(*root, &part_ary[i], &acce, THETA);
	    part_ary[i].vel.x += -(double)100.0/pnum*acce.x*delta_t; 
	    part_ary[i].vel.y += -(double)100.0/pnum*acce.y*delta_t; 
	    part_ary[i].pos.x += part_ary[i].vel.x*delta_t;
	    part_ary[i].pos.y += part_ary[i].vel.y*delta_t; 
	}

	/* waiting for other threads finished */
	pthread_barrier_wait(&bar); 
    } 
}



int main(int argc, char* argv[]){
    if(argc!=8){
	printf("Error: 6 input parameters expected! \n"); 
	return 1; 
    }
    /* Assign parameters to variables */ 
    const int pnum = atoi(argv[1]), nsteps = atoi(argv[3]), nthread = atoi(argv[7]); 
    const double delta_t = atof(argv[4]); 
    const float THETA = atof(argv[5]); 
    const char graphic = atoi(argv[6]); 

    FILE* fp = fopen(argv[2], "r"); 
    particle* part_ary = (particle*)malloc(pnum*sizeof(particle)); 
    
    /* read data from file to array of particle */
    if(fread(part_ary, sizeof(particle), pnum, fp) == pnum){
	fclose(fp); 
    }
    else{
	printf("Error: Read data failed. \n"); 
	fclose(fp); 
	return 1; 
    }
    
    /* root node initialization */
    node* root = NULL;

    /* pthread initialize */
    pthread_t thread_id[nthread]; 
    pthread_barrier_init(&bar, NULL, nthread+1); 
    threaddata info[nthread]; 
    
    
    for(int i=0; i<pnum; i++){
        vec2d topleft, botright, pos; 
        topleft.x = topleft.y = 0; 
        botright.x = botright.y = 1;	
        insert(&root, part_ary[i].mass, part_ary[i].pos, topleft, botright); 
    }

    /* print(root, 0); */
    
    /* create all threads and let them wait for start when all prepared. */ 
    for(int i=0; i<nthread; i++){
	info[i].id = i;
	info[i].nthread = nthread; 
	info[i].pnum = pnum; 
	info[i].delta_t = delta_t; 
	info[i].THETA = THETA; 
	info[i].part_ary = part_ary; 
	info[i].root = &root; 
	if(pthread_create(&thread_id[i], NULL, threadfun, (void*)(&info[i])) != 0){
	    printf("Thread create failed. \n"); 
	}
    }
    printf("All threads created. \n"); 
    
    if(nsteps > 0){
	/* To check if all threads are prepared to start */
	while(1){
	    pthread_mutex_lock(&mutex); 
	    if(waiting == nthread){
		break; 
	    }
	    pthread_mutex_unlock(&mutex); 
	}

	waiting = 0;
	pthread_cond_broadcast(&cond); 
	pthread_mutex_unlock(&mutex);
	for(int i=1; i<nsteps; i++){
	    pthread_barrier_wait(&bar); 
	    while(1){
		pthread_mutex_lock(&mutex); 
		if(waiting == nthread){
		    break; 
		}
		pthread_mutex_unlock(&mutex); 
	    }
	    release(root); 
	    root = NULL; 
	    /* update a quadtree with all particles */
	    for(int i=0; i<pnum; i++){
		vec2d topleft, botright, pos; 
		topleft.x = topleft.y = 0; 
		botright.x = botright.y = 1;	
		insert(&root, part_ary[i].mass, part_ary[i].pos, topleft, botright); 
	    }
	    waiting = 0; 
	    pthread_cond_broadcast(&cond); 
	    pthread_mutex_unlock(&mutex); 	
	}
	pthread_barrier_wait(&bar);} 
   
    /* check all threads if they are prepare to end */ 
    while(1){
	pthread_mutex_lock(&mutex); 
	if(waiting == nthread){
	    break; 
	}
	pthread_mutex_unlock(&mutex); 
    }
    end = 1; 
    pthread_mutex_unlock(&mutex);

    fp = fopen("result.gal", "w"); 
    if(fwrite(part_ary, pnum, sizeof(particle), fp) == 0){
	printf("Error: Write file failed! \n"); 
	return 1; 	
     }; 
    fclose(fp); 
    free(part_ary); 
}
