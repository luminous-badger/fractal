#!/bin/bash

X=1

for i in {0..10..1}
do
      X=$(echo $X + 0.1 | bc)
      echo "For: $X " $(date)
      nwt_Atest.pl $X > nwtA_${X}.png
done

