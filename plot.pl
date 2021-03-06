#!/usr/bin/perl

use GD::Simple;
use Math::Complex ;

## require 'mandlebrot_colours.pl' ;
## require 'mand_red.pl' ;
## require 'julia_colours3.pl' ; ## Doesn't look too good with Mbrot.

$RCS_Id = '$RCSfile: gds.pl,v $ $Revision: 1.3 $ ' ;

## 0,0 is top left hand corner.
## New constructor gives us the size of the canvas.
## Use Perl's own complex handler.
## Julia set is Z^2 + C where C is const.
## so, use a constant C !
## Use file with already calculated plot, ie x,y,iter.
## JM Tue Feb 12 11:11:54 GMT 2013

$Y_MIN =  0.2 ;
$Y_MAX =  0.9 ;
$X_MIN = -0.7 ;
$X_MAX =  0.4 ;

$y_pixel = 0 ;
$x_pixel = 0 ;
$iter = 0 ;
$offset = 0.0001 ;

$maxiter = 150 ;

$X_SIZE = ( $X_MAX - $X_MIN ) / $offset ; 
$Y_SIZE = ( $Y_MAX - $Y_MIN ) / $offset ;

$img = GD::Simple->new( $X_SIZE, $Y_SIZE ) ;

my @color_names = GD::Simple->color_names;

my $plotfile = shift || die "Usage: $0 plotfile \n" ;

open PLOT, $plotfile || die "Unable to open $plotfile $! \n" ;

while ( $line = <PLOT> ) {

      chop $line ; ## Stops EoL being part of iter - caused probs.

      ( $x_pixel, $y_pixel, $iter ) = split /,/, $line ;

      #print STDERR "X: $x_pixel, Y: $y_pixel, $iter \n" ;

      plotpixel () ;

} ## End while.      


sub plotpixel {

if ( 1 == 2 ) {

if    ( $iter >= $maxiter  ) {
        $iter = 9 ;

} elsif ( $iter % 5 == 0  ) {
        $iter = 66 ;

} elsif ( $iter  % 5 == 1  ) {
        $iter = 73 ;

} elsif ( $iter  % 5 == 2  ) {
        $iter = 79 ;

} elsif ( $iter  % 5 == 3  ) {
        $iter =  81 ;

} elsif ( $iter  % 5 == 4  ) {
        $iter = 84 ;
}

	if ( $iter <= 20  ) {

		$iter = $colour_map{ $iter } ;

	#} elsif ( $iter >= 20 && $iter <= 30 ) {

		#$iter = 0 ;

	} else {
		$iter += 102 ;
	}

	if ( $iter <= 20  ) {
		$iter = $colour_map{ $iter } ;

	} elsif ( $iter >= 20 && $iter <= 50 ) {

		$iter += 62 ;

	} elsif ( $iter >= 50 && $iter <= 77 ) {

		$iter += 2 ;

	} else {
		$iter = 188 ;
	}

	## Blue 'n' white.

	if    ( $iter >= $maxiter  ) {
		$iter = 0 ;
	} else {
		$iter = 9 ;
	}


	## Bluish tinge ...

	if    ( $iter >= $maxiter  ) {
		$iter = 0 ;

	} elsif ( $iter % 5 == 0  ) {
		$iter = 173 ;

	} elsif ( $iter  % 5 == 1  ) {
		$iter = 20 ;

	} elsif ( $iter  % 5 == 2  ) {
		$iter = 134 ;

	} elsif ( $iter  % 5 == 3  ) {
		$iter = 122 ;

	} elsif ( $iter  % 5 == 4  ) {
		$iter = 41 ;
	}

	## Orangey ....

	if    ( $iter >= $maxiter  ) {
		$iter = 9 ;

	} elsif ( $iter % 5 == 0  ) {
		$iter = 66 ;

	} elsif ( $iter  % 5 == 1  ) {
		$iter = 73 ;

	} elsif ( $iter  % 5 == 2  ) {
		$iter = 79 ;

	} elsif ( $iter  % 5 == 3  ) {
		$iter =  81 ;

	} elsif ( $iter  % 5 == 4  ) {
		$iter = 84 ;
	}

	## More Orangey ....
	## Looks good, too.

	if    ( $iter >= $maxiter  ) {
		$iter = 21 ;

	} elsif ( $iter <= 10  ) {
		$iter = 149 ;

	} elsif ( $iter % 5 == 0  ) {
		$iter = 66 ; ## Was 85

	} elsif ( $iter  % 5 == 1  ) {
		$iter = 73 ; ## Was 81

	} elsif ( $iter  % 5 == 2  ) {
		$iter = 89 ;

	} elsif ( $iter  % 5 == 3  ) {
		$iter = 81 ;

	} elsif ( $iter  % 5 == 4  ) {
		$iter = 84 ;
	}

} ## Comment out / in colour change.

	## Redder ...

	if    ( $iter >= $maxiter  ) {
		$iter = 21 ;

	} elsif ( $iter <= 10  ) {
		$iter = 149 ;

	} elsif ( $iter % 5 == 0  ) {
		$iter = 163 ; ## Was 85

	} elsif ( $iter  % 5 == 1  ) {
		$iter = 151 ; ## Was 81

	} elsif ( $iter  % 5 == 2  ) {
		$iter = 129 ;

	} elsif ( $iter  % 5 == 3  ) {
		$iter = 104 ;

	} elsif ( $iter  % 5 == 4  ) {
		$iter = 37 ;
	}


#print STDERR "PLOT:: X $x_pixel Y $y_pixel C $iter  \n" ;

	$img->moveTo( $x_pixel, $y_pixel ) ;
	$img->fgcolor( $color_names[ $iter ] ) ;
	$img->lineTo( $x_pixel, $y_pixel ) ;

} ## End plotpixel.


# convert into png data
binmode STDOUT ;
print $img->png;
