#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#include <smmintrin.h>

/*
<mmintrin.h>  MMX

<xmmintrin.h> SSE

<emmintrin.h> SSE2

<pmmintrin.h> SSE3

<tmmintrin.h> SSSE3

<smmintrin.h> SSE4.1

<nmmintrin.h> SSE4.2

<ammintrin.h> SSE4A

<wmmintrin.h> AES

<immintrin.h> AVX
*/

/*
int  SubtractImages_SSE4(char * imageA,char *imageB,unsigned int elements)
{

    char * imageA_Ptr = imageA;
    char * imageA_Limit = imageA + elements;
    char * imageB_Ptr = imageB;

    __m128i A0, A1, B0, B1, OUT , s5, s6, s7;

    while (imageA_Ptr<imageA_Limit)
    {
       A0 = _mm_loadu_si128((__m128i*)imageA_Ptr);
       A1 = _mm_loadu_si128((__m128i*)imageA_Ptr+8);

       B0 = _mm_loadu_si128((__m128i*)imageB_Ptr);
       B1 = _mm_loadu_si128((__m128i*)imageB_Ptr+8);


      // OUT = _mm_adds_epu16(s4, _mm_mpsadbw_epu8(s0, s2, 5));

      // _mm_store_ps (imageA_Ptr,OUT);


       imageA_Ptr+=8;
       imageB_Ptr+=8;
    }
*/


    /*
    unsigned int lowSum = UINT_MAX;
    unsigned int temSum = 0;

    int blockHeight = 16;
    int blockWidth = 16;

    int k;

    const unsigned char *pRef, *pCur;
    __m128i s0, s1, s2, s3, s4, s5, s6, s7;

    for (int i=0; i<=frameHeight-blockHeight; i++)

    {

        int j=0;

        ;
        for (j=0; j<=frameWidth-24; j+=8)

        {

            pCur = curBlock;

            pRef = refFrame+i*stepBytesRF+j;

            s3 = _mm_setzero_si128();

            s4 = _mm_setzero_si128();

            s5 = _mm_setzero_si128();

            s6 = _mm_setzero_si128();

            for (k=0; k<blockHeight; k++)

            {

                s0 = _mm_loadu_si128((__m128i*)pRef);

                s1 = _mm_loadu_si128((__m128i*)(pRef+8));

                s2 = _mm_loadu_si128((__m128i*)pCur);

                s3 = _mm_adds_epu16(s3, _mm_mpsadbw_epu8(s0, s2, 0));

                s4 = _mm_adds_epu16(s4, _mm_mpsadbw_epu8(s0, s2, 5));

                s5 = _mm_adds_epu16(s5, _mm_mpsadbw_epu8(s1, s2, 2));

                s6 = _mm_adds_epu16(s6, _mm_mpsadbw_epu8(s1, s2, 7));

                pCur+=stepBytesCB;

                pRef+=stepBytesRF;

            }

            s7 = _mm_adds_epu16(_mm_adds_epu16(s3, s4), _mm_adds_epu16(s5, s6));

            s7 = _mm_minpos_epu16(s7);

            temSum = _mm_extract_epi16(s7,0);

            if (temSum < lowSum)

            {

                lowSum = temSum;

                k = _mm_extract_epi16(s7,1);

                *matchBlock = j+k;

                *(matchBlock+1) = i;

            }

        }


        for (; j<=frameWidth-blockWidth; j++)

        {

            pCur = curBlock;

            pRef = refFrame+i*stepBytesRF+j;


            s2 = _mm_setzero_si128();

            for (k=0; k<blockHeight; k++)

            {

                s0 = _mm_loadu_si128((__m128i*)pRef);

                s1 = _mm_loadu_si128((__m128i*)pCur);

                s2 = _mm_adds_epu16(s2, _mm_sad_epu8(s0, s1));


                pCur+=stepBytesCB;

                pRef+=stepBytesRF;


            }


            temSum = _mm_extract_epi16(s2,0) + _mm_extract_epi16(s2,4);

            if (temSum < lowSum)

            {

                lowSum = temSum;

                *matchBlock = j;

                *(matchBlock+1) = i;

            }

        }

    }

    return 0;

return 0;
}
*/


int SubtractImages(char * imageA,char *imageB,unsigned int elements)
{
    char * imageA_Ptr = imageA;
    char * imageA_Limit = imageA + elements;
    char * imageB_Ptr = imageB;
    while (imageA_Ptr<imageA_Limit)
    {
        if (*imageA_Ptr>*imageB_Ptr)
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
