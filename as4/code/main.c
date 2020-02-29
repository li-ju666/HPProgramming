#include "structdef.h"

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
    int pnum = atoi(argv[1]); 
    FILE* fp = fopen(argv[2], "r"); 
    particle* part_ary = (particle*)malloc(pnum*sizeof(particle)); 
    if(fread(part_ary, sizeof(particle), pnum, fp) == pnum){
	fclose(fp); 
    }
    for(int i=0; i<pnum; i++){
	printf("The %dth particle: position-(%.3f, %.3f), mass-%.3f. \n", 
		i, part_ary[i].pos.x, part_ary[i].pos.y, part_ary[i].mass);
    }

    node* root = NULL; 
    for(int i=0; i<pnum; i++){
	vec2d topleft, botright, pos; 
	topleft.x = topleft.y = 0; 
	botright.x = botright.y = 1;	
	insert(&root, part_ary[i].mass, part_ary[i].pos, topleft, botright); 
    }
    print(root, 0); 
    free(part_ary); 
}
