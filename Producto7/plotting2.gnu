set title "Mareas maximas por Mes"
set xlabel "Dia Medido"
set ylabel "Nivel del agua"
set grid 
set xzeroaxis lt -2
set yzeroaxis lt -2
set yrange [-2:2]
set ytics 2 nomirror tc lt 1
plot "MinimosMes.dat" w l, "MaximosMes.dat" w l
pause 5


