 set title "Tiro parabolico"
set xlabel "Distancia"
set ylabel "Altura"
set xtics 10.0
set grid 
set xrange [-2:200]
set yrange [0:210]
plot "simulacion.dat" 
pause 5

