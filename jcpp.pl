#!/usr/bin/perl

use GD::Simple;
use Math::Complex ;

#require 'julia_colours.pl' ;
#require 'mand_red.pl' ;

$RCS_Id = '$RCSfile: gds.pl,v $ $Revision: 1.3 $ ' ;

## 0,0 is top left hand corner.
## New constructor gives us the size of the canvas.
## Draw mbrot with 1-6 in shades of orange etc.
## JM Fri, Dec 07, 2012 12:31:22 PM
## Use Perl's own complex handler.
## Julia set is Z^2 + C where C is const.
## so, use a constant C !

$Y_MIN = -1.1 ;
$Y_MAX =  1.1 ;
$X_MIN = -1.6 ;
$X_MAX =  1.6 ;

$y_pixel = 0 ;
$offset  = 0.01 ;
$maxiter = 180 ;

$X_SIZE = ( $X_MAX - $X_MIN ) / $offset ; 
$Y_SIZE = ( $Y_MAX - $Y_MIN ) / $offset ;

$img = GD::Simple->new( $X_SIZE, $Y_SIZE ) ;

my @color_names = GD::Simple->color_names;

for ( $Y = $Y_MIN ; $Y <= $Y_MAX ; $Y = sprintf ( "%7f", $Y + $offset ) ) {
$x_pixel = 0 ;

	for ( $X = $X_MIN ; $X <= $X_MAX ; $X = sprintf ( "%7f", $X + $offset ) ) {

		#print STDERR "X $X  Y $Y Z $Z Iter $iter \n" ;
		## $maxiter = 50 ; ## Max for mbort. Upped to 750 for Julia $C = -0.687 + 0.312*i ; 150 for $C = 0.5 + 0.3*i ;

		## $Z = $X + $Y*i ;
                $R0 = $X ;
                $I0 = $Y ;
                $R = $R0 ;
                $Im = $I0 ;
                $Z = $R + $Im*i ;
		## $C = -0.7308 + 0.308*i ; ## Phil McMullen 30/08. Not Aug, Oct !!!!!! But nice pic for -0.7308
		## $C = -0.73010 + 0.3010*i ; ## Phil McMullen 30/10. Good.
		$C = -0.73010 + 0.3010*i ; ## Phil McMullen 30/10.

                $iter = 0 ;

		while ( abs ( $Z**2 ) < 4 && ($iter < $maxiter) ) {

			## $Z = $Z**2 - 1 ;
			## 2.2 gave a nice pic.

			$Z = $Z**2 + $C ; 

			$iter = $iter + 1 ;

		} # end while

		#printf STDERR "%4s ", $iter ;
		#printf STDERR "$x_pixel, $y_pixel, $iter \n" ;

		plotpixel () ;

		$x_pixel++ ;

	} ## End X.

	#printf STDERR "\n" ;
	$y_pixel++ ;

} ## End Y.

sub plotpixel {


		if    ( $iter >= 189  ) {
			$iter = 186 ;

		} elsif ( $iter <= 4  ) {
			$iter = 186 ;


		} else { 
			$iter += 10 ; ## +52 - not bad. 62 good too. 95 good.  
		}

	if ( 1 == 2 ) { 


		## Two colours ...
		## Max iter is 50, so don't need to check for iter > 50.

		if    ( $iter >= $maxiter  ) {
			$iter %= 61 ;

		} elsif ( $iter <= 10  ) {
			$iter = 186 ;

		} else {
			$iter += 61 ; ## +52 - not bad. 62 good too. 95 good.

		}

	} ## comment in / out colour map.

	$img->moveTo( $x_pixel, $y_pixel ) ;
	$img->fgcolor( $color_names[ $iter ] ) ;
	$img->lineTo( $x_pixel, $y_pixel ) ;

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
