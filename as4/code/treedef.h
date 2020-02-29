typedef struct node node; 

typedef struct 2dvec{
    double x; 
    double y; 
}2dvec; 


struct node{
    char is_leaf; 
    2dvec topleft, botright, pos; 
    double mass; 
    node* children[4]; 
};

typedef struct particle{
    double pos_x, pos_y, mass, vel_x, vel_y, bri; 
}particle
