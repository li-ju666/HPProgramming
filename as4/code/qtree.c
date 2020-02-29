#include <stdio.h>
#include "structdef.h"

typedef checkresult{
    int drct; 
    2dvec topleft, botright; 
}checkresult; 


void insert(node** cnode, double mass, 2dvec pos, 2dvec topleft, 2dvec botright){
    if(*cnode == NULL){
	*cnode = calloc(1, sizeof(node));
	**cnode.is_leaf = 1; 	
	**cnode.pos = pos;
	**cnode.mass = mass; 
	**cnode.topleft = topleft; 
	**cnode.botright = botright; 
    }
    else if(**cnode.is_leaf == 1){
	checkresult result = check(cnode, **cnode.pos)
	insert(&(**cnode.children[result.drct]), **cnode.mass, **cnode.pos, result.topleft, result.botright); 
	result = check(cnode, pos); 
	insert(&(**cnode.children[result.drct]), mass, pos, result.topleft, result.botright); 
	**cnode.mass += **node; 
	**cnode.is_leaf = 0; 
	**cnode.pos.x = 
    }


}

checkresult check(node** cnode, 2dvec pos){
    checkresult result; 
    double width = (**cnode.botright.x - cnode.topleft.x)/2
    if(pos.x < (**cnode.topleft.x + width) && pos.y < (**cnodetopleft.y + width)){
	result.drct = 0; 
	result.topleft = **cnode.topleft; 
	result.botright.x = **cnode.topleft.x + width; 
	result.botright.y = **cnode.topleft.y + width; 
    }
    else if(pos.x >= (**cnode.topleft.x + width) && pos.y < (**cnodetopleft.y + width)){
	result.drct = 1; 
	result.topleft.x = **cnode.topleft.x + width; 
	result.topleft.y = **cnode.topleft.y; 
	result.botright.x = **cnode.botright.x; 
	result.botright.y = **cnode.botright.y - width; 
    }
    else if(pos.x < (**cnode.topleft.x + width) && pos.y >= (**cnodetopleft.y + width)){
	result.drct = 2; 
	result.topleft.x = **cnode.topleft.x; 
	result.topleft.y = **cnode.topleft.y + width; 
	result.botright.x = **cnode.botright.x - width; 
	result.botright.y = **cnode.botright.y; 
    }
    else{
	result.drct = 3; 
	result.topleft.x = **cnode.topleft.x + width; 
	result.topleft.y = **cnode.topleft.y + width; 
	result.botright = **cnode.botright; 
    }
    return result
}
