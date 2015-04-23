set title "Comparativo Tiro Parabolico"
set xlabel "Distancia"
set ylabel "Altura"
set xtics 10.0
set grid 
set xrange [-1:250]
set yrange [0:100]
plot "SinArrastre.dat" lt 4 , "ConArrastre.dat" lt 3 
pause 5

