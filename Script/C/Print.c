/*
 * Print.c
 *
 * Different gsl print functions.
 *
 * by Aslak Stubsgaard, 2015.
 */

#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#include <stdio.h>
#include <math.h>

void printarrayaserr(int n,int v[], char s[])
{
	fprintf(stderr,"%s: ",s);
	for (int i = 0; i < n; ++i)
	{
		fprintf(stderr,"%d,",v[i]);
	}
	fprintf(stderr,"\n");
}

void printarrayasmatrixerr(int n, int v[], char s[])
{
	fprintf(stderr,"%s:",s);
	for (int i = 0; i < n; ++i)
	{
		if( i % (int) sqrt(n) ==0)
		{
			fprintf(stderr,"\n");
		}
		fprintf(stderr,"%d,",v[i]);
	}
	fprintf(stderr,"\n\n");
}



// Prints a matrix with tab as spacing in stdout.
void printm(gsl_matrix* A, char s[])
{
	fprintf(stderr,"%s\n",s);
	for (int i = 0; i < A->size1; ++i)
	{
		for (int j = 0; j < A->size2; ++j)
		{
			fprintf(stdout,"%7.3f\t",gsl_matrix_get(A, i, j));
		}
		fprintf(stdout,"\n");
	}
	fprintf(stdout,"\n");
}

// Prints a matrix with tab as spacing  in stderr.
// void printmerr(gsl_matrix* A, char s[])
// {
// 	fprintf(stderr,"%s\n",s);
// 	for (int i = 0; i < A->size1; ++i)
// 	{
// 		for (int j = 0; j < A->size2; ++j)
// 		{
// 			fprintf(stderr,"%7.0f\t",gsl_matrix_get(A, i, j));
// 		}
// 		fprintf(stderr,"\n");
// 	}
// 	fprintf(stderr,"\n");
// }
void printmerr(gsl_matrix* A, char s[])
{
	fprintf(stderr,"%s\n",s);
	for (int i = 0; i < A->size1; ++i)
	{
		if(i==(A->size1)/2)
		{
			fprintf(stderr,"\n");
			for(int j = 0; j < A->size2; ++j)
			{
				fprintf(stderr,"-\t");
			}
			fprintf(stderr,"\n");
		}
		for (int j = 0; j < A->size2; ++j)
		{
			if(j==(A->size2)/2){fprintf(stderr,"|");}
			fprintf(stderr,"%5.0f\t",gsl_matrix_get(A, i, j));
		}
		fprintf(stderr,"\n");
	}
	fprintf(stderr,"\n");
}

// Prints a vector with tab as spacing in stdout.
void printv(gsl_vector* v, char s[])
{
	fprintf(stderr,"%s\n",s);
	for (int i = 0; i < v->size; ++i)
	{
		fprintf(stdout,"%7.3f\n",gsl_vector_get(v, i));
	}
	fprintf(stdout,"\n");
}

// Prints a vector with tab as spacing in stderr.
void printverr(gsl_vector* v, char s[])
{
	fprintf(stderr,"%s\n",s);
	for (int i = 0; i < v->size; ++i)
	{
		fprintf(stderr,"%7.10f\n",gsl_vector_get(v, i));
	}
	fprintf(stderr,"\n");
}
