#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define CONST_G 100
#define EPSILON 0.001

typedef struct particles{
    double position_x, position_y, mass, velocity_x, velocity_y, brightness; 
}particle; 

typedef struct forces{
    double x, y; 
}vector2d; 


int main(int argc, char* argv[]){
    // Check if input parameters are sufficient. 
    if(argc!=6){
	printf("Error: Insufficient input parameters! \n"); 
	return 1; 
    }
    
    int pnum = atoi(argv[1]), nsteps = atoi(argv[3]); 
    float delta_t = atof(argv[4]); 
    char graphic = atoi(argv[5]); 
    particle* part_ary = malloc(sizeof(particle)*pnum); 
    
    // Read particle data from input file to particle information array
    FILE* fp = fopen(argv[2], "r"); 
    // Check if file pointer is valid
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

#if 0
    for(int i=0; i<pnum; i++){
    printf("Particle %d: \n", i); 
    printf("%f, %f, %f, %f, %f, %f. \n", part_ary[i].position_x, 
	    part_ary[i].position_y, part_ary[i].mass, part_ary[i].velocity_x, 
	    part_ary[i].velocity_y,part_ary[i].brightness); 
    }
#endif


    // Create a matrix(sequence) to store forces between each two particles and initialize all default value as 0
    vector2d* force_mat = (vector2d*)calloc(pnum*pnum, sizeof(vector2d)); 
    for(int step=0; step<nsteps; step++){
	/* printf("Now is step: %d. \n", step); */ 
	int i, j; 
	double rij, temp_coeffi, x_cord, y_cord; 
#if 1
	// To update the force matrix
	for(i=1; i<pnum; i++){
	    for(j=0; j<i; j++){
		
		// Calculate the value of rij
		x_cord = (part_ary[i].position_x - part_ary[j].position_x) * (part_ary[i].position_x - part_ary[j].position_x);
		y_cord = (part_ary[i].position_y - part_ary[j].position_y) * (part_ary[i].position_y - part_ary[j].position_y); 
		rij = sqrt(x_cord + y_cord) + EPSILON; 

		/* rij = sqrt(pow((part_ary[i].position_x - part_ary[j].position_x), 2) + */ 
		/* 	   pow((part_ary[i].position_y - part_ary[j].position_y), 2)); */ 
		/* printf("Now rij is: %f. \n", rij); */ 		
		// Calculate the value of non-vector part
		
		/* temp = -CONST_G * part_ary[i].mass * part_ary[j].mass / pow((rij + EPSILON), 3); */ 
		temp_coeffi = -CONST_G / (rij * rij * rij * pnum); 	
		/* temp_coeffi = -CONST_G / (rij * (x_cord + y_cord) + 3 * rij * EPSILON * */ 
		/*     EPSILON + 3 * (x_cord + y_cord) * EPSILON + EPSILON * EPSILON * EPSILON); */ 
		/* printf("Now const is: %f. \n", temp); */ 
		// Store two coordinates of force vector into force array
		force_mat[i*pnum+j].x = temp_coeffi * (part_ary[i].position_x - part_ary[j].position_x); 
		force_mat[i*pnum+j].y = temp_coeffi * (part_ary[i].position_y - part_ary[j].position_y); 
	    }
	}
	/* if(step==nsteps-1){ */
	/* for(i=0; i<pnum; i++){ */
	/*     for(j=0; j<pnum; j++){ */
	/* 	printf("(%f, %f) ", force_mat[i*pnum+j].x, force_mat[i*pnum+j].y); */ 
	/*     } */
	/*     printf("\n"); }} */
	
#endif

#if 1
	// Update attributes of particles in part_ary
	vector2d acce, error, temp, acc2; 
	for(int i=0; i<pnum; i++){
	    // Calculate the acceleration sum of particle i exerted by other particles
	    acce.x = 0;
	    acce.y = 0; 
	    error.x = 0; 
	    error.y = 0; 
	    temp.x = 0; 
	    temp.y = 0; 
	    acc2.x = 0; 
	    acc2.y = 0; 
	    // Forces j exerted to i are added positively
	    for(j=0; j<i; j++){
		temp.x = acce.x + (force_mat[i*pnum+j].x*part_ary[j].mass -error.x);
		error.x = (temp.x - acce.x) - force_mat[i*pnum+j].x*part_ary[j].mass;
		acce.x = temp.x; 
		
		temp.y = acce.y + (force_mat[i*pnum+j].y*part_ary[j].mass - error.y); 
		error.y = (temp.y - acce.y) - force_mat[i*pnum+j].y*part_ary[j].mass; 
		acce.y = temp.y; 

		acc2.x += force_mat[i*pnum+j].x*part_ary[j].mass; 
		acc2.y += force_mat[i*pnum+j].y*part_ary[j].mass;
	    }
	    /* printf("ACC2.x-ACC1.x: %.20f. \n", acce.x - acc2.x); */ 
	    /* printf("ACC2.y-ACC1.y: %.20f. \n", acce.y - acc2.y); */ 

	    // Forces i exerted to j are added negatively, according to Newton's 3rd Law
	    /* error.x = 0; */
	    /* error.y = 0; */ 
	    for(j=i+1; j<pnum; j++){
		acc2.x -= force_mat[j*pnum+i].x*part_ary[j].mass; 
		acc2.y -= force_mat[j*pnum+i].y*part_ary[j].mass; 

		temp.x = acce.x - (force_mat[j*pnum+i].x*part_ary[j].mass + error.x); 
		error.x = (temp.x - acce.x) + force_mat[j*pnum+i].x*part_ary[j].mass; 
		acce.x = temp.x; 
		
		temp.y = acce.y - (force_mat[j*pnum+i].y*part_ary[j].mass + error.y); 
		error.y = (temp.y - acce.y) + force_mat[j*pnum+i].y*part_ary[j].mass; 
		acce.y = temp.y; 
	    }
	    /* printf("ACC2.x-ACC1.x: %.20f. \n", acce.x - acc2.x); */ 
	    /* printf("ACC2.y-ACC1.y: %.20f. \n", acce.y - acc2.y); */ 


	    // Acceleration is calculated by Newton's 2nd Law
	    /* acce.x = acce.x/part_ary[i].mass; */ 
	    /* acce.y = acce.y/part_ary[i].mass; */ 
	    
	    // Update the velocity of particle i
#if 0
	    part_ary[i].velocity_x += acce.x * delta_t;	
	    part_ary[i].velocity_y += acce.y * delta_t; 	
#else
	    part_ary[i].velocity_x += acc2.x * delta_t;	
	    part_ary[i].velocity_y += acc2.y * delta_t; 
#endif
	    // Update the position of particle i with velocity of particle i
	    part_ary[i].position_x += part_ary[i].velocity_x * delta_t; 
	    part_ary[i].position_y += part_ary[i].velocity_y * delta_t; 
	}
#endif
    }
#if 0
    for(int i=0; i<pnum; i++){
    printf("Particle %d: \n", i); 
    printf("%f, %f, %f, %f, %f, %f. \n", part_ary[i].position_x, 
	    part_ary[i].position_y, part_ary[i].mass, part_ary[i].velocity_x, 
	    part_ary[i].velocity_y,part_ary[i].brightness); 
    }
#endif

#if 1
    fp = fopen("result.gal", "w"); 
    if(fwrite(part_ary, pnum, sizeof(particle), fp) == 0){
	printf("Error: Write file failed! \n"); 
	return 1; 	
     }; 
    fclose(fp); 
    free(part_ary);
    free(force_mat);  
#endif
}
