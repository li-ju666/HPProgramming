#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "structdef.h"

#define THETA 0.05
typedef struct checkresult{
    int drct; 
    vec2d topleft, botright; 
}checkresult; 

checkresult check(node**, vec2d); 


void insert(node **cnode, double mass, vec2d pos, vec2d topleft, vec2d botright){
    if((*cnode) == NULL){
	// Construct a new leaft node
	*cnode = (node*)calloc(1, sizeof(node));
	(**cnode).is_leaf = 1;
	// Position of leaf node is the position of particle
	(**cnode).pos = pos;
	(**cnode).mass = mass; 
	(**cnode).topleft = topleft; 
	(**cnode).botright = botright; 
    }
    else if((**cnode).is_leaf == 1){
	// Current node needs to be split into a non-leaf node with two leaf nodes
	// The 1st one is the original node
	checkresult result = check(cnode, (**cnode).pos);
	insert(&((**cnode).children[result.drct]), (**cnode).mass, (**cnode).pos, result.topleft, result.botright); 
	// The 2nd is the to-be-added node
	result = check(cnode, pos); 
	insert(&((**cnode).children[result.drct]), mass, pos, result.topleft, result.botright); 
	// Mass for current node is the sum of all its children nodes
	(**cnode).mass += mass; 
	(**cnode).is_leaf = 0; 
	// The position of current non-leaf node is the center
	(**cnode).pos.x = ((**cnode).topleft.x + (**cnode).botright.x)/2; 
	(**cnode).pos.y = ((**cnode).topleft.y + (**cnode).botright.y)/2; 
    }
    else{
	// To-be-added node needs to be inserted to current node's children
	checkresult result = check(cnode, pos); 
	insert(&((**cnode).children[result.drct]), mass, pos, result.topleft, result.botright); 
	(**cnode).mass += mass;
    }
}


/* a function to check which child a given particle should be inserted in, returning children number and boundary positions */
checkresult check(node** cnode, vec2d pos){
    // drct 0 is topleft, 1 is topright, 2 is bottomleft and 3 is bottom right
    checkresult result; 
    double width = ((**cnode).botright.x - (**cnode).topleft.x)/2; 
    // Check if given position is out of space
    if(pos.x > (**cnode).botright.x || pos.x < (**cnode).topleft.x || pos.y > (**cnode).botright.y || pos.y < (**cnode).topleft.y){
	printf("Error: given particle out of space! \n");
	printf("%.f, %.f. \n", pos.x, pos.y); 
	exit(1);  
    }
    if(pos.x < ((**cnode).topleft.x + width) && pos.y < ((**cnode).topleft.y + width)){
	result.drct = 0; 
	result.topleft = (**cnode).topleft; 
	result.botright.x = ((**cnode).topleft).x + width; 
	result.botright.y = ((**cnode).topleft).y + width; 
    }
    else if(pos.x >= ((**cnode).topleft.x + width) && pos.y < ((**cnode).topleft.y + width)){
	result.drct = 1; 
	result.topleft.x = (**cnode).topleft.x + width; 
	result.topleft.y = (**cnode).topleft.y; 
	result.botright.x = (**cnode).botright.x; 
	result.botright.y = (**cnode).botright.y - width; 
    }
    else if(pos.x < ((**cnode).topleft.x + width) && pos.y >= ((**cnode).topleft.y + width)){
	result.drct = 2; 
	result.topleft.x = (**cnode).topleft.x; 
	result.topleft.y = (**cnode).topleft.y + width; 
	result.botright.x = (**cnode).botright.x - width; 
	result.botright.y = (**cnode).botright.y; 
    }
    else{
	result.drct = 3; 
	result.topleft.x = (**cnode).topleft.x + width; 
	result.topleft.y = (**cnode).topleft.y + width; 
	result.botright = (**cnode).botright; 
    }
    return result;
}


/* a function to free all resources of a quadtree */
void release(node* cnode){
    if(cnode != NULL){
	if((*cnode).is_leaf == 0){
	    for(int i=0; i<4; i++){
		release((*cnode).children[i]); 
	    }
	}
	free(cnode); 
    }
}


/* a function to print the quadtree out. */ 
void print(node* cnode, int depth){
    for(int i=0; i<depth; i++){
	printf("  "); 
    } 
    if(cnode == NULL){
	printf("%d: Empty node! \n", depth);
    } 
    else{
	printf("%d: Mass-%.3f, Pos-(%.8f, %.8f), is_leaf-%d. \n", depth, (*cnode).mass, (*cnode).pos.x, (*cnode).pos.y, (*cnode).is_leaf); 
	for(int i=0; i<4; i++){
	    print((*cnode).children[i], depth+1); 
	}
    }
}

void acccal(node* cnode, particle* p, vec2d* acce){
    /* calculate the distance between particle p and current node */
    double distance = sqrt(((*cnode).pos.x - (*p).pos.x) * ((*cnode).pos.x - (*p).pos.x) + 
			    ((*cnode).pos.y - (*p).pos.y) * ((*cnode).pos.y - (*p).pos.y)); 
    
    if((*cnode).is_leaf == 0){
	/* float division is avoided, using multiplying instead. */ 
        if(((*cnode).botright.x - (*cnode).topleft.x) <= THETA*distance){
	    /* update acceleration */
	    double coeff = (*cnode).mass / ((distance+EPS)*(distance+EPS)*(distance+EPS)); 
	    (*acce).x += coeff * ((*p).pos.x - (*cnode).pos.x); 
	    (*acce).y += coeff * ((*p).pos.y - (*cnode).pos.y); 
	}
	/* traverse all non-null children node of current node */
	else{
	    if((*cnode).children[0] != NULL){ acccal((*cnode).children[0], p, acce); } 
	    if((*cnode).children[1] != NULL){ acccal((*cnode).children[1], p, acce); } 
	    if((*cnode).children[2] != NULL){ acccal((*cnode).children[2], p, acce); } 
	    if((*cnode).children[3] != NULL){ acccal((*cnode).children[3], p, acce); }  
	}
    }
    /* distance is used to check if current node is particle p itself */
    else if(distance > 1e-10){
	    double coeff = (*cnode).mass / ((distance+EPS)*(distance+EPS)*(distance+EPS)); 
	    (*acce).x += coeff * ((*p).pos.x - (*cnode).pos.x); 
	    (*acce).y += coeff * ((*p).pos.y - (*cnode).pos.y); 
    }
}

