/*
 * mainA.c
 *
 * Finds the critical coefficients of the three dimensional ising model, in order to validate the corresponding derivision.
 *
 * by Aslak Stubsgaard, 2016.
 */

#include <gsl/gsl_blas.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_eigen.h>

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
// #include <sys/time.h>
// #include <time.h>

#include "Define.h"
#include "DefinePrint.h"
#include "DefineScripts.h"

/////////////////////////////////////////////////////////////////////////////

void isingP(int, gsl_matrix*, double, double);

/////////////////////////////////////////////////////////////////////////////
int main(int argc, char *argv[])
{
	// Determine the number of spin per side in a square plane
	int n=(argc>1? atoi(argv[1]):3);

	// Hold the dimensions of the P-matrix
	int N=pow(2,pow(n,2));

	// Define the binding energies
	double J=1.0, h=1.0;

	// Allocate the transfer matrix
	gsl_matrix* P = gsl_matrix_calloc(N,N);

	// Generates the transfer matrix
	isingP(n,P,J,h);
	// printmerr(P,"P=");

	// Find eigenvalues and eigenvectors
	gsl_vector *eval = gsl_vector_alloc (N);
  	gsl_matrix *evec = gsl_matrix_alloc (N, N);
	gsl_eigen_symmv_workspace * w = gsl_eigen_symmv_alloc (N);
	gsl_eigen_symmv (P, eval, evec, w);
	gsl_eigen_symmv_free (w);
	gsl_eigen_symmv_sort (eval, evec,	GSL_EIGEN_SORT_ABS_DESC);

	// printverr(eval,"eval=");
	// printmerr(evec,"evec=");

	double tmp=0;
	for(int i=0; i<N; i++)
	{
		tmp+=pow(gsl_vector_get(eval,i),n);
	}
	fprintf(stderr,"%d\t%g\n",n,1/(1-tmp));

/////////////////////////////////////////////////////////////////////////////

	gsl_matrix_free(P);
	gsl_vector_free (eval);
  gsl_matrix_free (evec);

	return 0;
}

/////////////////////////////////////////////////////////////////////////////
