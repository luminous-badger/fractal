
echo "Starting xj3 at " $(date)

xj3.exe > pcb4.txt

echo "Starting plot at " $(date)

plot.pl pcb4.txt > jb10.png

echo "Finished at " $(date)
