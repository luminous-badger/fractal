#!/usr/bin/perl

use GD::Simple;
use Math::Complex ;
#require 'blues.txt' ;

$RCS_Id = '$RCSfile: gds.pl,v $ $Revision: 1.3 $ ' ;

## 0,0 is top left hand corner.
## New constructor gives us the size of the canvas.
## Template for drawing Fractals.
## JM Mon, Nov 12, 2012  1:28:10 PM
##
## Try a mandlebrot using the complex number package.
## Plot for Z^2 + C.
## From: http://stackoverflow.com/questions/425953/how-to-program-a-fractal
## JM Sun Dec 16 18:32:06 GMT 2012
## Change to set z=x+Y and c is constant.
## Try a different starting point for Z. eg Z = -0.25 + 0.3i
## Add XY axes.

$Y_MIN = -1.1 ;
$Y_MAX =  1.1 ;
$X_MIN = -2.5 ;
$X_MAX =  0.2 ;

$y_pixel    = 0    ;
$iter_count = 0    ;
$maxiter    = 50   ;
$offset     = 0.011 ;

$X_SIZE = ( $X_MAX - $X_MIN ) / $offset ; 
$Y_SIZE = ( $Y_MAX - $Y_MIN ) / $offset ;

$img = GD::Simple->new( $X_SIZE, $Y_SIZE ) ;

my @color_names = GD::Simple->color_names;

for ( $Y = $Y_MIN ; $Y <= sprintf ( "%4f", $Y_MAX ) ; $Y = sprintf ( "%4f", $Y + $offset ) ) {
$x_pixel = 0 ;

	for ( $X = $X_MIN ; $X <= sprintf ( "%4f", $X_MAX ) ; $X = sprintf ( "%4f", $X + $offset ) ) {

		#print STDERR "X $X  Y $Y R2 $R2 I2 $I2 $iter \n" ;
                $iter = 0 ;
		$R0   = $X ;
		$I0   = $Y ;
		$R    = $R0 ;
		$Im   = $I0 ;
                $C    = $R + $Im*i ;
                $Z    = -0.9 + 0.0*i ;

		while ( abs( $Z**2 ) <= 4 && ($iter < $maxiter) ) {

			## printf STDERR "X %2.3f Y %2.3f Z %2.3f Iter: %d \n", $R, $I, $Z, $iter ;

			$Z =  $Z**2 + $C ;

			$iter = $iter + 1 ;
			$iter_count++ ;

		} # end while

		print "$iter " ;

		#plotpixel () ;

	$x_pixel++ ;

	} ## End X.

	print "\n" ;

	$y_pixel++ ;

} ## End Y.

