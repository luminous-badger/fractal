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
## Print co-ords at top / side of screen.

$Y_MIN = -0.6 ;
$Y_MAX =  0.8 ;
$X_MIN = -0.7 ;
$X_MAX =  0.2 ;

$y_pixel = 0 ;
$offset = 0.01 ;

$X_SIZE = ( $X_MAX - $X_MIN ) / $offset ; 
$Y_SIZE = ( $Y_MAX - $Y_MIN ) / $offset ;

$img = GD::Simple->new( $X_SIZE, $Y_SIZE ) ;

my @color_names = GD::Simple->color_names;

for ( $Y = $Y_MIN ; $Y <= $Y_MAX ; $Y = sprintf ( "%7f", $Y + $offset ) ) {
$x_pixel = 0 ;

	for ( $X = $X_MIN ; $X <= $X_MAX ; $X = sprintf ( "%7f", $X + $offset ) ) {

		#print STDERR "X $X  Y $Y Z $Z Iter $iter \n" ;
		## $maxiter = 50 ; ## Max for mbort. Upped to 750 for Julia $C = -0.687 + 0.312*i ; 150 for $C = 0.5 + 0.3*i ;
		$maxiter = 750 ;

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
		$C = -0.696 + 0.303*i ; ## ZCK

		#$Z = Math::Complex->make( $R0 , $Im ) ;

                $iter = 0 ;

		while ( abs ( $Z**2.63 ) < 4 && ($iter < $maxiter) ) {

			## $Z = $Z**2 - 1 ;
			## 2.2 gave a nice pic.

			$Z = $Z**2.63 + $C ; 

			$iter = $iter + 1 ;

		} # end while

		#printf STDERR "%4s ", $iter ;
		printf STDERR "$x_pixel, $y_pixel, $iter \n" ;

		plotpixel () ;

		$x_pixel++ ;

	} ## End X.

	#printf STDERR "\n" ;
	$y_pixel++ ;

} ## End Y.

sub plotpixel {

		if    ( $iter >= 189  ) {
			$iter %= 62 ;

		} elsif ( $iter <= 10  ) {
			$iter = 186 ;

		}  ## else { $iter += 62 ; ## +52 - not bad. 62 good too. 95 good.  }

	if ( 1 == 2 ) { 

		## Two colours ...
		## Max iter is 50, so don't need to check for iter > 50.

		if    ( $iter >= $maxiter  ) {
			$iter %= 52 ;

		} elsif ( $iter <= 10  ) {
			$iter = 186 ;

		} else {
			$iter += 52 ; ## +52 - not bad. 62 good too. 95 good.

		}

	} ## comment in / out colour map.

    if ( $x_pixel % 20 == 0 ) {

	## Set FG & BG colour to show numbers as contrast.
	$string = sprintf ( "%1.1f", $X ) ;
	$img->fgcolor( 7 ) ;
	#$img->bgcolor( 0 ) ;
	$img->fontsize(20);

	$img->moveTo( $x_pixel , 40);
	$img->angle( -90 );
	$img->string( $string ) ;
    
    } elsif ( $y_pixel % 20 == 0 && $y_pixel > 40 ) {

	## Set FG & BG colour to show numbers as contrast.
	$string = sprintf ( "%1.1f", $Y ) ;
	$img->fgcolor( 7 ) ;
	#$img->bgcolor( 0 ) ;
	$img->fontsize(20);

	$img->moveTo( 10, $y_pixel );
	$img->angle( 90 );
	$img->string( $string ) ;

    } else {

	$img->moveTo( $x_pixel, $y_pixel ) ;
	$img->fgcolor( $color_names[ $iter ] ) ;
	$img->lineTo( $x_pixel, $y_pixel ) ;

    } ## end print axes.	

} ## End plotpixel.


# convert into png data
binmode STDOUT ;
print $img->png;
