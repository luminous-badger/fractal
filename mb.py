#!/usr/bin/python

import numpy as np
import cmath

Y_MIN = -1.4 
Y_MAX =  1.4 
X_MIN = -1.9 
X_MAX =  1.4 

offset = 0.05
maxiter = 50

for y in np.arange ( Y_MIN, Y_MAX, offset ):
	for x in np.arange ( X_MIN, X_MAX, offset ):
	#	print x,y
		z = complex ( 0, 0 )
		c = complex ( x, y )
		iter = 0

		while ( abs ( z**2 ) < 4 and iter < maxiter ):
			
			z = z**2 + c
			iter += 1

		if ( iter < maxiter ):
			print ( " " ),
		else:	
			print ( "#" ),

	print
