/*
** Plot Julia set in C++ rather than perl.
** For offset of 0.0005 it ran in 8 minutes, as opposed to 8 hours
** for the perl version. Quite an improvement :)
** JM Tue, Feb 19, 2013  2:41:24 PM
*/

#include <stdio.h>
#include <iostream>
#include <complex>
using namespace std;

float Y_MIN =  0.2 ;
float Y_MAX =  0.9 ;
float     Y =  0   ;
float X_MIN = -0.7 ;
float X_MAX =  0.4 ;
float     X =  0   ;

int y_pixel  = 0 ;
float offset = 0.0001 ;

int maxiter = 150 ;

int main () {

for ( Y = Y_MIN ; Y <= Y_MAX ; Y += offset ) {
int x_pixel = 0 ;

	for ( X = X_MIN ; X <= X_MAX ; X += offset ) {

                float R0 = X ;
                float I0 = Y ;
                float R = R0 ;
                float Im = I0 ;
		
                complex<double> Z (R,Im) ;
	
		// complex<double> C( -0.687 , 0.312 ) ;
		// complex<double> C( 0.5 , 0.3 ) ;
		complex<double> C( -0.814 , 0.418 ) ;

                int iter = 0 ;

		while ( abs ( pow ( Z, 2.418 ) ) < 4 && (iter < maxiter) ) {

			Z = pow ( Z, 2.418 ) + C ;
		     // Z = Z**2 + C ; 

			iter = iter + 1 ;

		} // end while

		/*
		cout << iter << " " ;
		*/     
		cout << x_pixel 
		     << "," << y_pixel 
		     << "," << iter 
		     << "\n";
		/*
		cout <<  "x_pixel, y_pixel, iter " << x_pixel 
	      		<< " " << y_pixel 
			<< " " << iter 
			<< " Z " << Z 
			<< " absZ " << abs(Z) 
			<< "\n";
		*/	

	x_pixel++ ;

	} // End X.
	
	y_pixel++ ;

	// cout << "\n";

} // End Y.

return  0  ;

} // End main
