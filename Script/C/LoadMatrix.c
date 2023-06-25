/*
 * LoadMatrix.c
 *
 * This function loads a .txt-file and saves it as a gsl matrix structure.
 * Thorium Research: "Preliminary Monte Carlo".
 *
 * by Aslak Stubsgaard, 2015.
 */

#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_blas.h>
#include <math.h>

// I include a header file with useful some definitions.
#include "Define.h"

// I include a header file which definitions some gsl print functions.
#include "DefinePrint.h"

// 
void LoadMatrix(char filename[], gsl_matrix* A)
{
	// char buffer;
	// FILE * pTextFile = fopen(filename, "rb");
	// FILE *pBinaryFile = fopen("binaryTMP.bin", "wb");
	// while (!pTextFile(EOF))
	// {
	// 	fread(buffer, 1, 1, pTextFile);
	// 	fwrite(buffer, 1, 1, pBinaryFile);
	// }
	// fclose(pTextFile);
	// fclose(pBinaryFile);

	FILE * f = fopen (filename, "rb");
	gsl_matrix_fscanf (f, A);
	fclose (f);
}
