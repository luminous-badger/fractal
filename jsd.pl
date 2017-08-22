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
$maxiter = 350 ;

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
		## $C = -0.12 + 0.75*i ; ## Rabbit ear picture.
		## $C = -0.687 + 0.312*i ;
		## $C = 0.5 + 0.3*i ; ## Lovely fern-like spirals !
		## $C = 0.5 + 0.217*i ; ## Sarah.
		## $C = -0.696 + 0.303*i ; ## ZCK
		$C = -0.7196 + 0.2619*i ; ## Steffi.

		#$Z = Math::Complex->make( $R0 , $Im ) ;

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

		if    ( $iter % 5 == 0  ) {
			$iter = 92 ;
		}
		elsif ( $iter % 5 == 1  ) {
			$iter = 186 ;
		}
		elsif ( $iter % 5 == 2  ) {
			$iter = 134 ;

		}
		elsif ( $iter % 5 == 3  ) {
			$iter = 48 ;
		}
		elsif ( $iter % 5 == 4  ) {
			$iter = 129 ;

		}	


	if ( 1 == 2 ) { 
		if    ( $iter <= 20  ) {
			$iter = 48 ;
		}
		elsif ( $iter >= 20 && $iter <= 40 ) {
			$iter = 84 ;
		}
		elsif ( $iter >= 41 && $iter <= 60 ) {
			$iter = 84 ;

		}
		elsif ( $iter >= 61 && $iter <= 80 ) {
			$iter = 68 ;
		}
		elsif ( $iter >= 81 && $iter <= 100 ) {
			$iter = 129 ;

		}	elsif ( $iter >= 101 && $iter <= 120 ) {
			$iter = 69 ;

		}	elsif ( $iter >= 121 && $iter <= 140 ) {
			$iter = 29 ;

		}	elsif ( $iter >= 141 && $iter <= 160 ) {
			$iter = 139 ;
		} else {
			$iter %= 186;

		}


		if    ( $iter >= 189  ) {
			$iter %= 62 ;

		} elsif ( $iter <= 7  ) {
			$iter = 186 ;

		} else { 
			$iter += 92 ; ## +52 - not bad. 62 good too. 95 good.  
		}



		## Two colours ...
		## Max iter is 50, so don't need to check for iter > 50.
	} ## comment in / out colour map.

		if    ( $iter >= $maxiter  ) {
			$iter %= 61 ;

		} elsif ( $iter <= 10  ) {
			$iter = 186 ;

		} else {
			$iter += 1 ; ## +52 - not bad. 62 good too. 95 good.

		}


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
