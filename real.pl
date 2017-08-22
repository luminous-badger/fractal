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

$Y_MIN = -1.3 ;
$Y_MAX =  1.3 ;
$X_MIN = -2.3 ;
$X_MAX =  0.9 ;

$y_pixel    = 0    ;
$iter_count = 0    ;
$maxiter    = 50   ;
$offset     = 0.011 ;
$random     = rand() ;

$X_SIZE = ( $X_MAX - $X_MIN ) / $offset ; 
$Y_SIZE = ( $Y_MAX - $Y_MIN ) / $offset ;

$img = GD::Simple->new( $X_SIZE, $Y_SIZE ) ;

my @color_names = GD::Simple->color_names;


		#print STDERR "X $X  Y $Y R2 $R2 I2 $I2 $iter \n" ;
                $iter = 0 ;
		$R    = 4.0 ;
		$Im   = 6.0 ;
                $C    = $R + $Im*i ;
                $Z    = -1 * $random + 0.0*i ;
		print "C: $C \n" ;
		print "Re: ", Re($C) ;
		print " Im: ", Im($C) ;
		print "\n" ;

