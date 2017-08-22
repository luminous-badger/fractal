#!/usr/bin/perl

use GD::Simple;
use Math::Complex ;

#require 'yellows.pl' ;

$RCS_Id = '$RCSfile: gds.pl,v $ $Revision: 1.3 $ ' ;

## 0,0 is top left hand corner.
## New constructor gives us the size of the canvas.
## Template for drawing Fractals.
## JM Mon, Nov 12, 2012  1:28:10 PM
##
## Plot a newton fractal for Z^3 = 1
## Use code from: http://www.math.utsa.edu/ftp/gokhman/mirrors/maple/mfrnewt.htm
## Now modded to calc boat 503799
## get more 'flowery' pic at around A=0.8, so use A=0.799503
## JM Wed Aug 28 15:19:48 BST 2013


$Y_MIN = -7.0 ;
$Y_MAX =  7.0 ;
$X_MIN = -7.0 ;
$X_MAX =  7.0 ;

$y_pixel = 0 ;
$offset  = 0.1 ;
$maxiter = 120 ;
$A = 0.799503 ;     

$X_SIZE = ( $X_MAX - $X_MIN ) / $offset ; 
$Y_SIZE = ( $Y_MAX - $Y_MIN ) / $offset ;

$img = GD::Simple->new( $X_SIZE, $Y_SIZE ) ;

my @color_names = GD::Simple->color_names;

for ( $Y = $Y_MIN ; $Y <= $Y_MAX ; $Y = sprintf ( "%4f", $Y + $offset ) ) {
$x_pixel = 0 ;

	for ( $X = $X_MIN ; $X <= $X_MAX ; $X = sprintf ( "%4f", $X + $offset ) ) {

		#printf "X %2.3f Y %2.3f Z %2.3f Iter: %d \n", $R, $I, $Z, $iter ;
		## print "X $X  Y $Y R2 $R2 I2 $I2 $iter \n" ;
                $iter = 0 ;
		$R0 = $X ;
		$I0 = $Y ;
		$R = $R0 ;
		$Im = $I0 ;
                $Z = $R + $Im*i ;

              while ( abs( $Z**5 - 1 ) >= 0.001 && ($iter < $maxiter) ) {
                     ## Avoid divide by zero error.

		  if ( $Z ) { 
                     #$Z = $Z - $A * ( ( $Z**2 - 1 ) / ( 2 * $Z ) ) ; ## nice 2.21
                     $Z = $Z - $A * ( ( $Z**5 - 1 ) / ( 5 * $Z**4 ) ) ; ## nice 2.21
                     #$Z = $Z - $A * ( ( $Z**6 - 1 ) / ( 6 * $Z**5 ) ) ; ## nice 2.21
		  }   

                     $iter = $iter + 1 ;

              } # end while

	      print "$x_pixel,$y_pixel,$iter\n" ;

	      #plotpixel () ;

	$x_pixel++ ;

	} ## End X.

	#print "\n" ;

	$y_pixel++ ;

} ## End Y.

