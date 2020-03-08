#include "structdef.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

int main(int argc, char* argv[]){
    if(argc!=6){
	printf("Error: 5 input parameters expected! \n"); 
	return 1; 
    }
    /* Assign parameters to variables */ 
    int pnum = atoi(argv[1]), nsteps = atoi(argv[3]); 
    double delta_t = atof(argv[4]); 
    char graphic = atoi(argv[5]); 

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
    /* variables for timecost analysis */
    struct timeval insert_start, insert_end, acc_start, acc_end; 
    int insert_time = 0, acc_time = 0; 
    
    /* root node initialization */
    node* root = NULL;

    for(int i=0; i<nsteps; i++){
	gettimeofday(&insert_start, NULL); 
	root = NULL; 
	
	/* create a quadtree with all particles */
	for(int i=0; i<pnum; i++){
	vec2d topleft, botright, pos; 
	topleft.x = topleft.y = 0; 
	botright.x = botright.y = 1;	
	insert(&root, part_ary[i].mass, part_ary[i].pos, topleft, botright); 
	}
	
	gettimeofday(&insert_end, NULL); 
	/* calculate the time used for quadtree creation */
	insert_time += 1000000*(insert_end.tv_sec - insert_start.tv_sec) + (insert_end.tv_usec - insert_start.tv_usec); 
	
	gettimeofday(&acc_start, NULL); 
	/* calculate the acceleration of particles and update the information in particle array */
	for(int i=0; i<pnum; i++){
	    vec2d acce = {0,0}; 
	    acccal(root, &part_ary[i], &acce);
	    part_ary[i].vel.x += -(double)100.0/pnum*acce.x*delta_t; 
	    part_ary[i].vel.y += -(double)100.0/pnum*acce.y*delta_t; 
	    part_ary[i].pos.x += part_ary[i].vel.x*delta_t;
	    part_ary[i].pos.y += part_ary[i].vel.y*delta_t; 
	}
	/* free all resources of the tree */
	release(root); 
	gettimeofday(&acc_end, NULL); 
	acc_time += 1000000*(acc_end.tv_sec - acc_start.tv_sec) + (acc_end.tv_usec - acc_start.tv_usec); 
	
    }
    fp = fopen("result.gal", "w"); 
    if(fwrite(part_ary, pnum, sizeof(particle), fp) == 0){
	printf("Error: Write file failed! \n"); 
	return 1; 	
     }; 
    fclose(fp); 
    free(part_ary); 
    printf("Time for insert is: %d, time for update is: %d. \n", insert_time, acc_time); 
}
