
public class Enjava {
    public static void main(String[] args) {
    
    System.out.println("Hola! Trataré de adivinar un número.");

    System.out.println("Piensa un número entre 1 y 10.");

 try {
    Thread.sleep(1000);
} catch (InterruptedException e) {

    System.out.println("Ahora multiplicalo por 9.");
}
 try {
    Thread.sleep(1000);
} catch (InterruptedException e)
{
    System.out.println("Si el número tiene 2 dígitos, súmalos entre si: Ej. 36->3+6=9. Si tu número tiene un solo dígito, súmale 0.");
}
 try {
    Thread.sleep(1000);
} catch (InterruptedException e)
{
    System.out.println("Al número resultante súmale 4.");
}
try {
    Thread.sleep(1000);
} catch (InterruptedException e)
{
    System.out.println("Muy bien. El resultado es 13. :)"); 
 }   }

}
