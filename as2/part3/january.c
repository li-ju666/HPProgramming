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
	node *root = NULL, *temp=NULL, *current_node=NULL; 
	while(run){
		printf("\nEnter command: "); 
		fgets(input, 100, stdin); 
		// when command is "A": 
		if(input[0]==65){
			sscanf(input, "%*c %d %f %f", &day, &min, &max); 
			//printf("%d, %f, %f\n", day, min, max);
			if((unsigned int)day < 32 && day != 0){
				temp = (node*)malloc(sizeof(node)); 
				temp->day = day; 
				temp->max = max; 
				temp->min = min; 
				temp->next = NULL; 
				//printf("Data is: %d, %f, %f. \n", temp->day, temp->min, temp->max); 
				current_node = root; 
				// Insert before the first node
				if (root == NULL || (root->day) > (temp->day)){
					temp->next = root; 
					root = temp; 
				}
				// Update the first node
				else if(root->day == temp->day){
					root->min = temp->min; 
					root->max = temp->max; 
					free(temp); 
				}
				// Cases requiring modifying non-first node
				else{
					// locating current_node to the modification-required position
					while(current_node->next != NULL && (current_node->next->day)<(temp->day)){
						current_node = current_node->next; 
					}
					// case in which new node needs to be inserted
					if(current_node->next == NULL || (current_node->next->day)>(temp->day)){
						temp->next = current_node->next; 
						current_node->next = temp; 
					}
					// case in which next node needs to be updated
					else{
						current_node->next->min = temp->min; 	
						current_node->next->max = temp->max; 
						free(temp); 
					}

				}
			}
			else{
				printf("Error: invalid day input! \n"); 
			}
		}
		// when command is "D":
		else if(input[0]==68){
			sscanf(input, "%*c %d", &day); 
			if(day != 0 && (unsigned int)day < 32){
				current_node = root;
				//if the table is empty. 
				if(root == NULL){printf("Error: The table is already empty. \n"); }
				// if the first node needs to be deleted. 
				else if(root->day == day){
					temp = root->next; 
					free(root); 
					root = temp;
				}
				// if nodes after needs to be deleted; 
				else{
					// locating the current_node to the node before the deletion-required node or the last node. 
					while(current_node->next != NULL && current_node->next->day != day){
						current_node = current_node->next;}
					// if all queued nodes are traversed and current_node is located to the last node (input day does not exist. ): 
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
			current_node = root;
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
