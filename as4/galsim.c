#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define CONST_G (double)100.0f/pnum
#define EPSILON (double)0.001

typedef struct particles{
    double position_x, position_y, mass, velocity_x, velocity_y, brightness; 
}particle; 

typedef struct forces{
    double x, y; 
}vector2d; 


int main(int argc, char* argv[]){
    // Check if input parameters are sufficient. 
    if(argc!=6){
	printf("Error: 5 input parameters expected! \n"); 
	return 1; 
    }
    // Assign parameters to variables 
    int pnum = atoi(argv[1]), nsteps = atoi(argv[3]); 
    double delta_t = atof(argv[4]); 
    char graphic = atoi(argv[5]); 
    particle* part_ary = malloc(sizeof(particle)*pnum); 
    
    // Read particle data from input file to particle information array
    FILE* fp = fopen(argv[2], "r"); 
    // Check if file pointer is valid and read data into memory
    if(fp==NULL){
	printf("Error: Invalid file to read! \n");
	return 1; 	
    }
    if(fread(part_ary, sizeof(particle), pnum, fp) == pnum){
	fclose(fp);
    }
    else{
	printf("Error: Invalid input particle numbers. \n");
	fclose(fp); 	
	return 1; 
    }

    // Create an array to store position information of last step
    vector2d oldpos[pnum]; 
    // Variable to save acceleration of particle i
    vector2d acc; 
    // Loop to update particle array step by step
    for(int step=0; step<nsteps; step++){
	/* printf("Now is step: %d. \n", step); */ 
	double rij, temp_coeffi; 
	for(int i=0; i<pnum;i++){
	    oldpos[i].x = part_ary[i].position_x; 
	    oldpos[i].y = part_ary[i].position_y; 
	}
	// 1st loop: to update particle information of the particle array
	for(int i=0; i<pnum; i++){
	    acc.x = 0; 
	    acc.y = 0; 
	    // 2nd loop: to accumulate the acceleration of particle i
	    for(int j=0; j<i; j++){
		
		rij = 1/(sqrt((oldpos[i].x - oldpos[j].x) * (oldpos[i].x - oldpos[j].x) +
			   (oldpos[i].y - oldpos[j].y) * (oldpos[i].y - oldpos[j].y)) + EPSILON); 

		temp_coeffi = part_ary[j].mass * rij * rij * rij;
		acc.x += temp_coeffi * (oldpos[i].x - oldpos[j].x); 
		acc.y += temp_coeffi * (oldpos[i].y - oldpos[j].y);
	    }
	    // To avoid cache miss
	    for(int j=i+1; j<pnum; j++){
		// To avoid function call
		rij = 1/(sqrt((oldpos[i].x - oldpos[j].x) * (oldpos[i].x - oldpos[j].x) +
			   (oldpos[i].y - oldpos[j].y) * (oldpos[i].y - oldpos[j].y)) + EPSILON); 
		// Use rij * rij * rij rather than pow(rij, 3)
		temp_coeffi = part_ary[j].mass * rij * rij * rij;
		//Acceleration accumulation on two coordinates
		acc.x += temp_coeffi * (oldpos[i].x - oldpos[j].x); 
		acc.y += temp_coeffi * (oldpos[i].y - oldpos[j].y);
	    }
	    // To update velocity information
	    /* printf("Acceleration: (%.10f, %.10f). \n", acc.x, acc.y); */ 
	    part_ary[i].velocity_x += -CONST_G * acc.x * delta_t;
	    part_ary[i].velocity_y += -CONST_G * acc.y * delta_t; 	
	    // To update position information
	    part_ary[i].position_x += part_ary[i].velocity_x * delta_t; 
	    part_ary[i].position_y += part_ary[i].velocity_y * delta_t; 
	}
    }

#if 1
    fp = fopen("refresult.gal", "w"); 
    if(fwrite(part_ary, pnum, sizeof(particle), fp) == 0){
	printf("Error: Write file failed! \n"); 
	return 1; 	
     }; 
    fclose(fp); 
    free(part_ary);
#endif
}
