#include "main.ih"

const float circleRadius=0.025, circleColor=0;
const int windowWidth=800;

int main(int argc, char const *argv[])
{
    if (argc != 6)
    {
        printf("Incorrect number of input arguments, 5 expected: ./galsim N FILENAME NSTEPS DELTA_T GRAPHICS\n");
        return 1;
    }
    //Reading command line arguments
    int N = atoi(argv[1]);
    FILE *file = fopen(argv[2], "rb");
    int timeSteps = atoi(argv[3]);
    double delta_t = atof(argv[4]);
    int graphics = atoi(argv[5]);

    if (graphics)
    {
        InitializeGraphics(argv[0],windowWidth,windowWidth);
        SetCAxes(0,1);
    }
    

    //Setting variables to hold File data
    double Masses[N];
    double xVel[N];
    double yVel[N];
    double xPos[N];
    double yPos[N];
    double Brightness[N];

    //Reading from file into variables
    for (size_t i = 0; i < N; i++)
    {

        int read1 = fread(&(xPos[i]), sizeof(double), 1, file);
        int read2 = fread(&(yPos[i]), sizeof(double), 1, file);
        int read3 = fread(&(Masses[i]), sizeof(double), 1, file);
        int read4 = fread(&(xVel[i]), sizeof(double), 1, file);
        int read5 = fread(&(yVel[i]), sizeof(double), 1, file);
        int read6 = fread(&(Brightness[i]), sizeof(double), 1, file);

        if (read1 != 1 || read2 != 1 || read3 != 1 || read4 != 1 || read5 != 1 || read6 != 1)
            return 1;
    }

    simplecticEuler(N, timeSteps, delta_t, Masses, xPos, yPos, xVel, yVel, graphics);

    FILE *out = fopen("result.gal", "wb");
    for (size_t i = 0; i < N; i++)
    {
        fwrite(&(xPos[i]), sizeof(double), 1, out);
        fwrite(&(yPos[i]), sizeof(double), 1, out);
        fwrite(&(Masses[i]), sizeof(double), 1, out);
        fwrite(&(xVel[i]), sizeof(double), 1, out);
        fwrite(&(yVel[i]), sizeof(double), 1, out);
        fwrite(&(Brightness[i]), sizeof(double), 1, out);
    }

    if (graphics)
    {
        FlushDisplay();
        CloseDisplay();
    }
    
    return 0;
}
