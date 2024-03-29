#include "main.ih"


inline void simplecticEuler(int N, int timeSteps, double delta_t, double mass[], double xPos[], double yPos[], double xVel[], double yVel[], int graphics)
{

    double accX;
    double accY;
    double G = (100 + 0.0) / (N + 0.0);
    double sumx;
    double sumy;
    double c1;
    double xOldPos[N];
    double yOldPos[N];

    //Loop over time
    for (size_t time = 0; time < timeSteps; time++)
    {

        //Copy the previous time-step
		for (int i=0; i<N; i++){
			xOldPos[i] = xPos[i]; 
			yOldPos[i] = yPos[i]; 
		}
        //1st loop over the particles
        for (size_t i = 0; i < N; i++)
        {
            sumx = 0;
            sumy = 0;
            //2nd loop over the particles
            for (size_t j = 0; j < N; j++)
            {
                if (j == i)
                    continue;

                c1 = 1 / (sqrt((xOldPos[i] - xOldPos[j])*(xOldPos[i]-xOldPos[j]) + 
					(yOldPos[i] - yOldPos[j])*(yOldPos[i]-yOldPos[j])) + eps0);
		c1 = mass[j]/c1*c1*c1; 
                sumx += c1 * (xOldPos[i] - xOldPos[j]);
                sumy += c1 * (yOldPos[i] - yOldPos[j]);
            }
            
            accX = -G * sumx;
            accY = -G * sumy;
            xVel[i] += delta_t * accX;
            yVel[i] += delta_t * accY;
            xPos[i] += delta_t * xVel[i];
            yPos[i] += delta_t * yVel[i];
        }


        if (graphics)
        {
            ClearScreen();

             /* Call graphics routines. */
            for (size_t i = 0; i < N; i++)
                DrawCircle(xPos[i], yPos[i], 1, 1, 0.025, 0);
                
            Refresh();
            /* Sleep a short while to avoid screen flickering. */
            usleep(3000); 
        }
    }
}
