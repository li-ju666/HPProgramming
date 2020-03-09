#define EPS 0.001

typedef struct node node; 

typedef struct vec2d{
    double x; 
    double y; 
}vec2d; 


struct node{
    char is_leaf; 
    vec2d topleft, botright, pos; 
    double mass; 
    node* children[4]; 
};

typedef struct particle{
    vec2d pos; 
    double mass; 
    vec2d vel; 
    double bri; 
}particle; 

void insert(node**, double, vec2d, vec2d, vec2d);
void print(node*, int); 
void release(node*);
void acccal(node*, particle*, vec2d*, float); 
