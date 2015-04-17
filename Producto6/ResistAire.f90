!Programa para obtener los valores cada décima de segundo
!para graficar un tiro parabólicode un objeto esféfico,
!considerando la fuerza de fricción del aire
!Código por Ana M. Sotomayor

program FArrastre
  implicit none
!Definamos variables
real, parameter :: pi = 4.0 * atan(1.0)
!Definimos el valor de la densidad de aire a un aprox de 20grados Centígrados con una presion atmosferica de 1
real, parameter :: dAire = 1.2
real, parameter :: gravedad = 9.8
!Definimos el Coeficiente de Arrastre para un objeto esférico
real, parameter :: CD = 0.47
real :: Fd, Vo, a_grados, a_rad, A, Fdx, Fdy,ad, adx, ady,r, m, u, t, hmax, xmax
real :: x(2500), y(2500), vx(2500), vy(2500), ax(2500), ay(2500)
integer :: i

!Donde Fd es la fuerza de Arrastre,
!Vo es la velocidad inicial de tiro
!a_grados es el ángulo de tiro en grados
!a_rad es el ángulo convertido a radianes
!A es el área transversal del objeto
!Fdx es la componente de la fuerza en el eje x
!Fdy es la componente de a fuerza de fricción en el eje y
!ad es la aceleración del objeto por la resistencia del aire
!adx es la componente de la aceleración o desaceleración en el eje x
!ady es la componente de la aceleración o desaceleración en el eje y
!m es la masa del objeto esférico
!r es el radio del objeto esférico
!u es la magnitud del vector velocidad del objeto
!t es el tiempo de análisis del tiro parabólico
!vx es la componente velocidad del objeto en el eje x a un tiempo t
!vy es la componente velocidad del objeto en el eje y a un tiempo t
!ax es la el componente de la aceleración del objeto en el eje x a un tiempo t
!ay es la el componente de la aceleración del objeto en el eje y a un tiempo t
!hmax es la altura máxima alcanzada por el objeto
!xmax es la distancia máxima alcanzada por el objeto

!Ahora obtenemos los datos de entrada
    write (*,*) "Escriba el ángulo de tiro en grados"
    read *,a_grados
    write (*,*) "Escriba la velocidad de tiro en m/s"
    read *,Vo
    write (*,*) "Escriba el radio del objeto esférico"
    read *,r
    write (*,*) "Escriba el masa del objeto en kilogramos"
    read *, m

!Se convierten grados a radianes
    a_rad = a_grados*pi/180

!Se convierte la velocidad a sus componentes en x y y
    vx = Vo*cos(a_rad)
    vy = Vo*sen(a_rad)

!Se obtiene el Area del objeto de estudio
    A = pi * r*r

!Damos el valor de u, que es la magnitud del Vector Velocidad
    u = Vo

!Se obtiene la fuerza de Arrastre segun las condiciones dadas segun la formula de fuerza de arrastre.

    Fd = 1/2*dAire*u*u*CD*A

!Generamos los datos para obtener la fuerza de arrastre en las componentes de x y y generada por la resistencia del aire
    Fdx = Fd*Cos(a_rad)
    Fdy = Fd*Sin(a_rad)

!Generamos archivos para almacenar los datos obtenidos
    open (2, file = "Simulacion.dat")

!Generamos las coordenadas para graficar la trayectoria
    do i = 1, 4500, 1
       t = (float (i)*0.01
       

       ax(i) = ax + v(i)*t+(1/2)*a(i)*t*t



