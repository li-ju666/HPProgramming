#include "structdef.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

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
    node* root = NULL;

    for(int i=0; i<nsteps; i++){
	root = NULL; 
	
	for(int i=0; i<pnum; i++){
	vec2d topleft, botright, pos; 
	topleft.x = topleft.y = 0; 
	botright.x = botright.y = 1;	
	insert(&root, part_ary[i].mass, part_ary[i].pos, topleft, botright); 
	}
	
	/* calculate the acceleration of particles and update the information in particle array */
#pragma omp parallel for num_threads(nthread)
	for(int i=0; i<pnum; i++){
	    vec2d acce = {0,0}; 
	    acccal(root, &part_ary[i], &acce, THETA);
	    part_ary[i].vel.x += -(double)100.0/pnum*acce.x*delta_t; 
	    part_ary[i].vel.y += -(double)100.0/pnum*acce.y*delta_t; 
	    part_ary[i].pos.x += part_ary[i].vel.x*delta_t;
	    part_ary[i].pos.y += part_ary[i].vel.y*delta_t; 
	}
	/* free all resources of the tree */
	release(root); 
    }
    fp = fopen("result.gal", "w"); 
    if(fwrite(part_ary, pnum, sizeof(particle), fp) == 0){
	printf("Error: Write file failed! \n"); 
	return 1; 	
     }; 
    fclose(fp); 
    free(part_ary); 
}
