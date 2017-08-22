/*
** plot Mbrot in C++ rather than perl.
** For offset of 0.0005 it ran in 8 minutes, as opposed to 8 hours
** for the perl version. Quite an improvement :)
** JM Tue, Feb 19, 2013  2:41:24 PM
*/

#include <stdio.h>
#include <iostream>
#include <complex>
using namespace std;

float Y_MIN = -0.05 ;
float Y_MAX =  0.05 ;
float     Y =  0.0  ;
float X_MIN =  0.2  ;
float X_MAX =  0.3  ;
float     X =  0.0  ;
// Top right hand corner. Nice pic.

/*
float Y_MIN = -0.0005 ;
float Y_MAX =  0.0005 ;
float     Y =  0.0  ;
float X_MIN = -1.986 ;
float X_MAX = -1.985 ;
float     X =  0.0  ;
*/

int y_pixel = 0 ;
float offset = 0.0001 ;
int maxiter = 75 ;

int main () {

for ( Y = Y_MIN ; Y <= Y_MAX ; Y += offset ) {
int x_pixel = 0 ;

	for ( X = X_MIN ; X <= X_MAX ; X += offset ) {

                float R0 = X ;
                float I0 = Y ;
                float R = R0 ;
                float Im = I0 ;
		// cout << "X " << X << " ,Y " << Y << endl ;
                complex<double> C (R,Im) ;
		complex<double> Z( 0.0 , 0.0 ) ;

                int iter = 0 ;

		while ( abs ( pow ( Z, 2.0 ) ) < 4 && (iter < maxiter) ) {

			Z = pow ( Z, 2.0 ) + C ;
		     // Z = Z**2 + C ; 

			iter = iter + 1 ;

		} // end while

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

} // End Y.

return  0  ;

} // End main
