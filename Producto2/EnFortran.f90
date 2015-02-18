
program Adivina 
   

  write(*,*) 'Hola! Trataré de adivinar un número.';
     write(*,*) 'Piensa un número entre 1 y 10.\n';
     call sleep(5)	
     write(*,*) 'Ahora multiplicalo por 9.';
     call sleep(5)
    write(*,*) 'Si el número tiene 2 dígitos, súmalos entre si: Ej. 36->3+6=9. Si tu número tiene un solo dígito, súmale 0.';
     call sleep(5)
     write(*,*) 'Al número resultante súmale 4.';
     call sleep(10)	
     write(*,*) 'Muy bien. El resultado es 13 :)'; 
end program Adivina 
