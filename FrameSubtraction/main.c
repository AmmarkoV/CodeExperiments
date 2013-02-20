#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int SubtractImages(char * imageA,char *imageB,unsigned int elements)
{
    char * imageA_Ptr = imageA;
    char * imageA_Limit = imageA + elements;
    char * imageB_Ptr = imageB;
    while (imageA_Ptr<imageA_Limit)
    {
        if (*imageA_Ptr>=*imageB_Ptr)
        {
            *imageA_Ptr-=*imageB_Ptr;
        }
        else
        {
            *imageA_Ptr=*imageB_Ptr-*imageA_Ptr;
        }

        ++imageA_Ptr;
        ++imageB_Ptr;
    }
    return 1;
}
 


int main()
{
    unsigned int width = 1920;
    unsigned int height = 1080;
    unsigned int frameSize = width*height*3;

    char * imageA = (char * ) malloc(frameSize);
    char * imageB = (char * ) malloc(frameSize);


    unsigned int benchTimes=0;
    for (benchTimes=0; benchTimes<1000; benchTimes++)
     {
       memset(imageA,123,frameSize);
       memset(imageB,123,frameSize);

      SubtractImages(imageA,imageB,frameSize);
     }

    return 0;
}
