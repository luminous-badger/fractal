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

$Y_MIN = -0.05 ;
$Y_MAX =  0.05 ;
$X_MIN =  0.2  ;
$X_MAX =  0.3  ;

$y_pixel = 0 ;
$x_pixel = 0 ;
$iter = 0 ;
$offset = 0.0001 ;

$maxiter = 75 ;

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

	if    ( $iter < 7 ) {
		$iter = 186 ;

	} elsif ( $iter >= $maxiter ) {
		$iter = 186 ;

	} else {
		$iter += 104 ;

	}


#print STDERR "PLOT:: X $x_pixel Y $y_pixel C $iter  \n" ;

	$img->moveTo( $x_pixel, $y_pixel ) ;
	$img->fgcolor( $color_names[ $iter ] ) ;
	$img->lineTo( $x_pixel, $y_pixel ) ;

} ## End plotpixel.


# convert into png data
binmode STDOUT ;
print $img->png;
