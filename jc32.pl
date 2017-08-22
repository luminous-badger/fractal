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

$Y_MIN = -1.5 ;
$Y_MAX =  1.5 ;
$X_MIN = -1.5 ;
$X_MAX =  1.5 ;

$y_pixel = 0 ;
$offset  = 0.01 ;
$maxiter = 200 ;

srand ( time() ^ ($$ + ( $$ << 15 )) ) ;
$random = rand( ) ;
$arand = substr ( $random, 2, ) ; ## Gets rid of 0. 

$Real = -0.173 ;
$Imag =  0.173 ;

print STDERR "C: $Real + $Imag * i \n" ;

$X_SIZE = ( $X_MAX - $X_MIN ) / $offset ; 
$Y_SIZE = ( $Y_MAX - $Y_MIN ) / $offset ;

$img = GD::Simple->new( $X_SIZE, $Y_SIZE ) ;

my @color_names = GD::Simple->color_names;

for ( $Y = $Y_MIN ; $Y <= $Y_MAX ; $Y = sprintf ( "%7f", $Y + $offset ) ) {
$x_pixel = 0 ;

	for ( $X = $X_MIN ; $X <= $X_MAX ; $X = sprintf ( "%7f", $X + $offset ) ) {

		#print STDERR "X $X  Y $Y Z $Z Iter $iter \n" ;
		## $maxiter = 50 ; ## Max for mbort. Upped to 750 for Julia $C = -0.687 + 0.312*i ; 150 for $C = 0.5 + 0.3*i ;

                $R0 = $X ;
                $I0 = $Y ;
                $R  = $R0 ;
                $Im = $I0 ;
                $Z  = $R + $Im*i ;
		$C  = $Real + $Imag*i ; 

                $iter = 0 ;

		while ( abs ( $Z**5 ) < 4 && ($iter < $maxiter) ) {

			$Z = $Z**5 + $C ; 

			$iter = $iter + 1 ;

		} # end while

		#printf STDERR "%4s ", $iter ;

		plotpixel () ;

		$x_pixel++ ;

	} ## End X.

	#printf STDERR "\n" ;
	$y_pixel++ ;

} ## End Y.

sub plotpixel {

	if ( 1 == 2 ) { 

		if       ( $iter <= 4  ) {

			$iter = 186 ;
		} else {

			$iter %= 92 ;
		}	

		if       ( $iter <= 6  ) {

			$iter = 186 ;

		} elsif ( $iter >= 6 && $iter <= 80 ) {
			$iter = 129 ;

		} elsif ( $iter > 189 ) {
			$iter = 187 ;

		} else {

			#$iter %= 62 ;
			$iter = 0 ;

		}  ## else { $iter += 62 ; ## +52 - not bad. 62 good too. 95 good.  }





		if      ( $iter <= 4 || $iter >= $maxiter ) {
			$iter = 186 ;

		} elsif ( $iter %3 == 0 ) {
			$iter = 29 ;

		} elsif ( $iter %3 == 1 ) {
			$iter = 186 ;

		} elsif ( $iter %3 == 2 ) {
			$iter = 177 ;

		}

	} ## comment in / out colour map.

		if      ( $iter == 1 ) {
			$iter = 186 ;

		} elsif ( $iter == 2 ) {
			$iter = 186 ;
			
		} elsif ( $iter == 3 ) {
			$iter = 186 ;

		} elsif ( $iter >= 3 && $iter < $maxiter ) {

			#$iter = 186 ;
			if ( $iter %3 == 0 ) {
				$iter = 29 ;

			} elsif ( $iter %3 == 1 ) {
				$iter = 186 ;

			} elsif ( $iter %3 == 2 ) {
				$iter = 126 ;

			}

		} else {
			$iter = 186 ;

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
