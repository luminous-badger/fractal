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
## Try a different starting point for Z. eg Z = -0.25 + 0.3i. Z= -0.9 + 0i works best.
## Try it for a Julia ...
## Won't it be just the same as adding Z to C ????
## Yes!! Just shifts the result left (+) or right (-).
## Add XY axes.

$Y_MIN = -1.1 ;
$Y_MAX =  1.1 ;
$X_MIN = -1.5 ;
$X_MAX =  1.5 ;

$y_pixel    = 0    ;
$iter_count = 0    ;
$maxiter    = 150   ;
$offset     = 0.011 ;
$random = rand() ;

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
                
                $Z    = $R + $Im*i ;
                #$C    = -0.75  +  0.318*i ;
                ## $C    = -0.75 + $random +  0.318*i ;
                $C    = -0.75 + $random + ( 0.318 + $random )*i ;

		while ( abs( $Z**2 ) <= 4 && ($iter < $maxiter) ) {

			## printf STDERR "X %2.3f Y %2.3f Z %2.3f Iter: %d \n", $R, $I, $Z, $iter ;

			$Z =  $Z**2 + $C ;

			$iter = $iter + 1 ;
			$iter_count++ ;

		} # end while

		#print "$iter " ;

		plotpixel () ;

	$x_pixel++ ;

	} ## End X.

	#print "\n" ;

	$y_pixel++ ;

} ## End Y.

sub plotpixel {

	if ( $iter <= 6  ) {
		$iter = 186 ;

	} else {

		$iter += 108 ;

	}


if ( 1==2 ) {

	if ( $iter <= 6  ) {
		$iter = 39 ;

	}
	elsif ( $iter == $maxiter ) {
		$iter = 186 ;

	}
	elsif ( $iter %5 == 0 ) {
		$iter = 141 ;

	}
	elsif ( $iter %5 == 1 ) {
		$iter = 134 ;

	}
	elsif ( $iter %5 == 2 ) {
		$iter = 41 ;

	}
	elsif ( $iter %5 == 3 ) {
		$iter = 122 ;

	}
	elsif ( $iter %5 == 4 ) {
		$iter = 140 ;

	}  else { 
		$iter += 12 ; 

	}

} ## End comment.

	$img->moveTo  ( $x_pixel, $y_pixel    ) ;
	$img->fgcolor ( $color_names[ $iter ] ) ;
	$img->lineTo  ( $x_pixel, $y_pixel    ) ;


} ## End plotpixel.

	## Print value of C in top left corner. For reference.
	$img->fgcolor( 7 ) ;
	$img->bgcolor( 0 ) ;
	$img->fontsize(20);
	$img->moveTo( 20, 20 );
	$img->angle( 90 );
	$img->string( $C ) ;


# convert into png data
binmode STDOUT ;
print $img->png;

print STDERR "Iter Count $iter_count :: Rand: $random  \n" ;
