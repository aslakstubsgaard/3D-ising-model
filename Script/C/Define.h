/*
 * Define.h
 *
 * Holds some useful standard definitions.
 *
 * by Aslak Stubsgaard, 2014.
 */

// Define the macro RND which casts rand to be a double.
// The constant RAND_MAX is the maximum value that can be returned by the rand function.
// So RND returns a number (double) between 0 and 1.
#define RND ( (double)rand() / RAND_MAX )

// Define the FMT so that printf prints a float with width 7 and precision 3.
#define FMT "%7.3f"

// Define TIME to hold the system time.
#define TIME ((double)clock())/CLOCKS_PER_SEC
#define max_print 11

// Load data from file to a gsl_matrix format. Can't load empty entrances.
void LoadMatrix(char filename[], gsl_matrix*);

