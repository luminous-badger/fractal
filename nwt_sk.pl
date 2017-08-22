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
## Now modded to calc for PM: 21 Oct
## JM Fri Nov 30 11:56:18 GMT 2012


$Y_MIN = -6.0 ;
$Y_MAX =  6.0 ;
$X_MIN = -6.0 ;
$X_MAX =  6.0 ;

$y_pixel = 0 ;
$offset  = 0.01 ;
$maxiter = 120 ;
$A = 1.19720721 ;     

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

              while ( abs( $Z**7 - 1 ) >= 0.001 && ($iter < $maxiter) ) {
                     ## Avoid divide by zero error.

		  if ( $Z ) { 
                     #$Z = $Z - $A * ( ( $Z**2 - 1 ) / ( 2 * $Z ) ) ; ## nice 2.21
                     $Z = $Z - $A * ( ( $Z**7 - 1 ) / ( 7 * $Z**6 ) ) ; ## nice 2.21
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


	if    ( $iter < 20 ) {
		$iter += 9

	} elsif ( $iter <= 80  ) {
		$iter += 107 ;
	} else {

		$iter += 49 ;
	}


if ( 1 ==2 ) {

	if    ( exists ( $colour_map{ $iter } ) ) {
		$iter = $colour_map{ $iter } ;

	} else {

		$iter += 127 ;
	}


                     if ( $iter >= $maxiter  ) {
                        $iter = 186 ;

                } elsif ( $iter % 5 == 0  ) {
                        $iter = 30 ;

                } elsif ( $iter % 5 == 1  ) {
                        $iter = 107 ;

                } elsif ( $iter % 5 == 2  ) {
                        $iter = 45 ;

                } elsif ( $iter % 5 == 3  ) {
                        $iter = 128 ;

                } elsif ( $iter % 5 == 4  ) {
                        $iter = 129 ;
                }

}

	$img->moveTo( $x_pixel, $y_pixel ) ;
	$img->fgcolor( $color_names[ $iter ] ) ;
	$img->lineTo( $x_pixel, $y_pixel ) ;

} ## End plotpixel.

if ( 1 ==2 ) {

	$string = "Z - $A " ;
	$img->bgcolor( 0 ) ;
	$img->fgcolor( 9 ) ;
	$img->fontsize(20);

	$img->moveTo( 20, 20 );
	#$img->angle( 90 );
	$img->string( $string ) ;

} ## End comment

# convert into png data
binmode STDOUT ;
print $img->png;
