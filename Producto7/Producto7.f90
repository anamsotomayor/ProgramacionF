!Programa para graficar los datos de mareas tomados durante un periodo de tiempo
!para representar el comportamiento de las mareas, segun la hora del dia,
!temperatura y presion atmosferica
!Código por Ana M. Sotomayor
!¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬|

Module Parametros
     Implicit None
    integer, parameter :: puntos = 7632 !total de puntos
    integer, parameter :: dias = 159 !dias completos muestreados
    integer, parameter :: inicio = 286 !DOY inicial
    integer, parameter :: datos = 48 !Datos por dia
    integer, parameter :: datxmes = 1344
    integer, parameter :: dxmes = 28 !dias por mes lunar
    integer, parameter :: meses = 5 !Meses completos muestreados
    integer, parameter :: completos = 6720 !dias que completan los 5 meses
    integer, parameter :: semana = 7 !dias de la semana

End Module Parametros

Program Producto7
    Use Parametros
    implicit none
    integer :: i, j, k
    real :: xMax, xMin, dian, PromMin, PromMax
    real, dimension (1:5) :: Minmes, Maxmes,diamax, diamin, periodomax, periodomin
    real, dimension (1:dias) :: Mindia, Maxdia,  horamin, horamax
    real, dimension (1:puntos) :: PresAtm, Temp, NivAgua, DOY
    real, dimension (1:semana) :: Minam,HoraMinam,Maxam, HoraMaxam, Maxpm, HoraMaxpm, Minpm, HoraMinpm
    real, dimension (:,:), Allocatable :: Array,Arraymes
ALLOCATE (Array(dias,datos))
ALLOCATE (Arraymes(meses,datxmes))

  do i = 1, puntos, 1
    open (1, file = "data.csv", status="old")
    Read (1,*) PresAtm(i), Temp(i), NivAgua(i), DOY(i)
    open (2, file = "HNA.dat")
    open (3, file = "PresionNivelAgua.dat")
    open (4, file = "TempNivelAgua.dat")
    write (2,*) DOY(i), NivAgua(i) 
    Write (3,*) DOY(i), Temp(i) 
    write (4,*) DOY(i), PresAtm(i)
  end do
    close (1)
    close (2)
    close (3)
    close (4)
!Asignamos valores a la primera matriz (por dia)
i=1
   Open (2, file ="HNA.dat", status = "old")
   do  j = 1, dias, 1
     do k = 1, datos, 1  
       Read (2,*) DOY(i), NivAgua(i)
       Array (j,k) = NivAgua(i)
       i=i+1
     end do
   end do
  close (2)
!write (*,*) array

!Asignamos valores a la segunda matriz(por mes)
i=1
 Open (2, file ="HNA.dat", status = "old") 
 Do j=1,meses,1
	Do k = 1,datxmes,1
          Read (2,*) DOY(i), NivAgua(i)
          Arraymes (j,k)=NivAgua(i)
          i = i+1
	End do
End do
close (2)
!Write (*,*) arraymes


!Datos Minimos por mes
open (6, file="MinimosMes.dat")
 do j = 1, meses, 1
 xMin=0
     do k= 1,datxmes, 1
        if (Arraymes(j,k) .lt.  xMin) then
        xMin=Arraymes(j,k)
        dian=(j-1)*dxmes+k/48
        end if
     Minmes(j)=xMin
     diamin(j)= dian+inicio
     end do
 Write (6,*) diamin(j), Minmes(j)
 end do
close (6)

!Datos Maximos por mes
 open (7, file="MaximosMes.dat")
 do j = 1, meses, 1
 xMax=-1
     do k= 1, datxmes, 1
        if (Arraymes(j,k) .gt.  xMax) then
        xMax=Arraymes(j,k)
        dian=(j-1)*dxmes+k/48
        end if
        Maxmes(j)=xMax
        Diamax(j)=dian+inicio
     end do
     Write (7,*) diamax(j), Maxmes(j)
 end do
Close (7)

!Datos Maximos por dia
 open (8, file="Maximos.dat")
 do j = 1, dias, 1
    xMax = -1
    do k= 1, datos, 1
       if (Array(j,k) .gt.  xMax) then
       xMax=Array(j,k)
       end if
       Maxdia(j)=xMax
       horamax(j) = (j+inicio-1)+(k/48)
    end do
    Write (8,*) horamax(j), Maxdia(j)
end do
Close (8)

!Datos Minimos por dia
open (9, file="Minimos.dat")
do j = 1, dias, 1
     xMin=0 
     do k= 1, datos, 1
        if (Array(j,k) .lt.  xMin) then
        xMin=Array(j,k)
        end if
        Mindia(j)=xMin
        horamin(j) = (j+inicio-1)+(k/48)
     end do
     Write (9,*) horamin(j), Mindia(j)
end do
Close (9)

!Obtenemos los Periodos entre máximos mensuales

Do j=2,meses,1
Periodomax(j)=diamax(j)-diamax(j-1)
end do

Do j=2,meses,1
Periodomin(j)=diamin(j)-diamin(j-1)
end do

!Periodos promedio
PromMax=sum(Periodomax)/4
PromMin=sum(Periodomin)/4
 
!Calculemos el minimo semidiurno
Open (10, file= "Minimosam.dat")

do j = 1, semana*3, 1
   xMin =0
   do k = 1, datos/2, 1
     if (Array(j,k) .lt. xMin) then
         xMin = Array(j,k) 
     end if      
       Minam(j)=xMin
       horaminam(j) = (j+inicio)
    end do
    Write (10,*) horaminam(j), Minam(j)
end do
close (10)

open (12, file= "Minimospm.dat")
do j = 1, semana*3, 1
xMin =0
   do k = 25, datos, 1
     if (Array(j,k) .lt. xMin) then
         xMin = Array(j,k) 
     end if      
     Minpm(j)=xMin
     horaminpm(j) = (j+inicio)
   end do
Write (12,*) horaminpm(j), Minpm(j)
end do
close (12)

Open (11, file="Maximosam.dat")
do j = 1, semana*3, 1
xMax =-1
   do k = 1, datos/2, 1
      if (Array(j,k) .gt. Xmax) then
      Xmax = Array(j,k)
      end if
    Maxam(j)=Xmax
    horamaxam(j) = (j+inicio)+(k/48)
   end do
Write (11,*) horamaxam(j), Maxam(j)
end do
Close (11)


open (13, file="Maximospm.dat")
do j = 1, semana*3, 1
xMax =-1
   do k = 25, datos, 1
      if (Array(j,k) .gt. Xmax) then
      Xmax = Array(j,k)
      end if
    Maxpm(j)=Xmax
    horamaxpm(j) = (j+inicio)+(k/48)
   end do
Write (13,*) horamaxpm(j), Maxpm(j)
end do
close (13)

open (14, file="Datos salida.dat")

!write (14 ,*) 'nivel de marea maxima por dia', Maxdia
!write (14 ,*) 'nivel de marea minima por dia', Mindia
write (14,*) "---------------------------------------"
write (14,*) 'nivel de marea minima por mes', MinMes
write (14 ,*) 'nivel de marea maxima por mes', MaxMes
write (14,*) "---------------------------------------"
write (14 ,*) 'Periodos entre maximos por mes', periodomax
write (14 ,*) 'Periodos entre minimos por mes', periodomin
write (14,*) "---------------------------------------"
write (14,*) "El periodo promedio de maximos es", PromMax
Write (14,*) "El periodo promedio de Minimos es", PromMin


End Program producto7
    
