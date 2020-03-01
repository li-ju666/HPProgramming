#include "structdef.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char* argv[]){
    if(argc!=6){
	printf("Error: 5 input parameters expected! \n"); 
	return 1; 
    }
    // Assign parameters to variables 
    int pnum = atoi(argv[1]), nsteps = atoi(argv[3]); 
    double delta_t = atof(argv[4]); 
    char graphic = atoi(argv[5]); 

    FILE* fp = fopen(argv[2], "r"); 
    particle* part_ary = (particle*)malloc(pnum*sizeof(particle)); 
    

    if(fread(part_ary, sizeof(particle), pnum, fp) == pnum){
	fclose(fp); 
    }
    else{
	printf("Error: Read data failed. \n"); 
	fclose(fp); 
	return 1; 
    }


    for(int i=0; i<pnum; i++){
	printf("The %dth particle: position-(%.3f, %.3f), mass-%.3f. \n", 
		i, part_ary[i].pos.x, part_ary[i].pos.y, part_ary[i].mass);
    }


    node* root = NULL; 
    /* for(int i=0; i<pnum; i++){ */
	/* vec2d topleft, botright, pos; */ 
	/* topleft.x = topleft.y = 0; */ 
	/* botright.x = botright.y = 1; */	
	/* insert(&root, part_ary[i].mass, part_ary[i].pos, topleft, botright); */ 
    /* } */
    //print(root, 0);
    for(int i=0; i<nsteps; i++){
	root = NULL; 
	for(int i=0; i<pnum; i++){
	vec2d topleft, botright, pos; 
	topleft.x = topleft.y = 0; 
	botright.x = botright.y = 1;	
	insert(&root, part_ary[i].mass, part_ary[i].pos, topleft, botright); 
	}
	
	for(int i=0; i<pnum; i++){
	    vec2d acce = {0,0}; 
	    acccal(root, &part_ary[i], &acce, pnum); 
	    part_ary[i].vel.x += acce.x * delta_t; 
	    part_ary[i].vel.y += acce.y * delta_t; 
	    part_ary[i].pos.x += part_ary[i].vel.x * delta_t;
	    part_ary[i].pos.y += part_ary[i].vel.y * delta_t; 
	}
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
