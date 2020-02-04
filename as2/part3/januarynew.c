#include <stdio.h>
#include <stdlib.h>

typedef struct node node; 

struct node{
	int day; 
	float max, min; 
	node* next; 
};

int main(){
	int run=1, day;
	char input[100]; 
        char command;
	float max, min;
	node *root = (node*)malloc(sizeof(node)); 
	root->day = 0; 
	root->min = -1; 
	root->max = -1; 
	root->next = NULL; 
	while(run){
		printf("\nEnter command: "); 
		while(fgets(input, 100, stdin)==NULL); 
		
		// when command is "A": 
		if(input[0]==65){
			sscanf(input, "%*c %d %f %f", &day, &min, &max); 
			//printf("%d, %f, %f\n", day, min, max);
			if((unsigned int)(day-1) < 31){
				node *temp = (node*)malloc(sizeof(node)), *current_node = root; 
				temp->day = day; 
				temp->max = max; 
				temp->min = min; 
				temp->next = NULL; 
				// locating current_node to the modification-required position
				while(current_node->next != NULL && (current_node->next->day)<day){
					current_node = current_node->next;  
				}
				// case in which new node needs to be inserted to the tail
				if(current_node->next == NULL){
						current_node->next = temp; 
				}
				// case in which next node needs to be updated
				else if(current_node->next->day == day){
					free(temp); 	
					current_node->next->min = min; 	
					current_node->next->max = max; 
					}
				// case in which the node needs to be inserted before next node
				else{
					temp->next = current_node->next; 
					current_node->next = temp; 
				}

			}
			
			else{
				printf("Error: invalid day input! \n"); 
			}
		}
		// when command is "D":
		else if(input[0]==68){
			sscanf(input, "%*c %d", &day); 
			if((unsigned int)(day-1) < 31){
				node* current_node = root, *temp;
				// if the table is empty. 
				if(root->next == NULL){printf("Error: The table is already empty. \n"); }
				else{
					// locating current_node to the node pointing to the to-deleted node or the last node
					while(current_node->next != NULL && current_node->next->day != day){
						current_node = current_node->next;}
					// if all queued nodes are traversed and current_node is pointing to the last node (input day does not exist. ): 
					if(current_node->next == NULL){
						printf("Data of the day not existing! \n"); 
					}
					// delete the next node. 
					else{
						temp =  current_node->next; 
						current_node->next = current_node->next->next; 
						free(temp); 
					}
				}
			}
				
			else{
				printf("Error: invalid day input! \n"); 
			}
			
		}
		// when command is "P": 
		else if(input[0]==80){
			node* current_node = (root->next); 
			printf("day   min         max\n"); 
			while(current_node != NULL){
				printf("%d   %f   %f\n", current_node->day, current_node->min, current_node->max); 
				current_node = current_node->next; 
			}
		}
		// when command is "Q": 
		else if(input[0]==81){
			// Loop ends. 
			run = 0;
			node* temp; 
			// free all memory of each node. 
			while(root!=NULL){
				temp = root; 
				root = root->next; 
				free(temp); 
			}
			printf("All nodes have been deleted! \n"); 

		}
		// other invalid command: 
		else{
			printf("Error: invalid command! \n"); 
		}
	}
}
