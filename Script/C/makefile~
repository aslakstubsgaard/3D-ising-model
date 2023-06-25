##
# Makefile
#
# Project ...
#
# by Aslak Stubsgaard, 2015.
##

# print error warnings with color.
CC = colorgcc
CFLAGS+= --std=gnu99 -Wall -O -lgslcblas -lgsl -lmarray `gsl-config --cflags`
LDLIBS+= `gsl-config --libs`

.PHONY: all
all: T.dat

##################################################################
# Scrap code

# plot1.png: T1.dat fit1.plt
# 	pyxplot fit1.plt

#	for x in 1 2 3; do \
#		./mainA $$x >> outA.dat; \
#	done
##################################################################

objects = Ising.o Print.o LoadMatrix.o 

main: main.o $(objects)

########################## TØ 1 ############################

T.dat: main makefile
	cat /dev/null > T.dat
	./main > T.dat

############################ Clean ###############################
.PHONY: clean
clean:
	rm --force  main *.o *.dat *.png

##################################################################
