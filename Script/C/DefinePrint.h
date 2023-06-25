/*
 * DefinePrint.h
 *
 * Different gsl print functions.
 *
 * by Aslak Stubsgaard, 2015.
 */

 // Declare function prototypes used in main.
void printarrayaserr(int, int v[], char s[]);
void printarrayasmatrixerr(int, int v[], char s[]);
void printm(gsl_matrix*, char s[]);
void printmerr(gsl_matrix*, char s[]);
void printv(gsl_vector*, char s[]);
void printverr(gsl_vector*, char s[]);
