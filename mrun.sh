
echo "Starting exe ... " $( date )

xcmp.exe > mbum_b.txt

echo "Starting plot ... " $( date )

mplot.pl mbum_b.txt > mbum_b.png

echo "Finished ... " $( date )
