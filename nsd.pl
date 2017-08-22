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
## Now modded to calc for Steffi: 19/06
## JM Fri Nov 30 11:56:18 GMT 2012


$Y_MIN = -6.0 ;
$Y_MAX =  6.0 ;
$X_MIN = -6.0 ;
$X_MAX =  6.0 ;

$y_pixel = 0 ;
$offset  = 0.01 ;
$maxiter = 120 ;
$A = 1.1906 ;     

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

              while ( abs( $Z**8 - 1 ) >= 0.001 && ($iter < $maxiter) ) {
                     ## Avoid divide by zero error.

		  if ( $Z ) { 
                     #$Z = $Z - $A * ( ( $Z**2 - 1 ) / ( 2 * $Z ) ) ; ## nice 2.21
                     $Z = $Z - $A * ( ( $Z**8 - 1 ) / ( 8 * $Z**7 ) ) ; ## nice 2.21
                     #$Z = $Z - $A * ( ( $Z**6 - 1 ) / ( 6 * $Z**5 ) ) ; ## nice 2.21
		  }   

                     $iter = $iter + 1 ;

              } # end while

	      #print "$iter " ;

	      plotpixel () ;

	$x_pixel++ ;

	} ## End X.

	#print "\n" ;

	$y_pixel++ ;

} ## End Y.

sub plotpixel {


	$img->moveTo( $x_pixel, $y_pixel ) ;
	$img->fgcolor( $color_names[ $iter ] ) ;
	$img->lineTo( $x_pixel, $y_pixel ) ;


} ## End comment

# convert into png data
binmode STDOUT ;
print $img->png;
