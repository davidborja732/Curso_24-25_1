import java.util.Scanner;
public class Ejercicio_1_David_Borja {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        double temporal;//Inicio una variable que va a guardar el valor del numero de forma temporal
        boolean compar;//Inicio variable que devolvera true or false si el numero es impar
        boolean maymen;//Inicio variable que comprobara si el numero es mayor o igual a 5 y menor a 10
        boolean comintro=false;//Inicio variable que me dira si el numero sin contar el numero1 ha aparecido antes
        double media;
        System.out.print("Dime un numero ");
        int numero1= scanner.nextInt();
        temporal=numero1;//Ejemplo de asignacion de valor de numero a variable temporal
        compar=(temporal%2!=0);//Ejemplo de funcion compar
        System.out.println("El "+temporal+" es impar "+compar);
        maymen=(temporal>=5)&&(temporal<10);//Ejemplo de funcion maymen
        System.out.println("El "+temporal+" es mayor o igual a 5 o menor a 10 "+maymen);
        System.out.print("Dime un numero ");
        int numero2=scanner.nextInt();
        temporal=numero2;
        compar=(temporal%2!=0);
        System.out.println("El "+temporal+" es impar "+compar);
        maymen=(temporal>=5)&&(temporal<10);
        System.out.println("El "+temporal+" es mayor o igual a 5 o menor a 10 "+maymen);
        System.out.print("Dime un numero ");
        int numero3= scanner.nextInt();
        temporal= numero3;
        compar=(temporal%2!=0);
        System.out.println("El "+temporal+" es impar "+compar);
        maymen=(temporal>=5)&&(temporal<10);
        System.out.println("El "+temporal+" es mayor o igual a 5 o menor a 10 "+maymen);
        System.out.print("Dime un numero ");
        int numero4= scanner.nextInt();
        temporal=numero4;
        compar=(temporal%2!=0);
        System.out.println("El "+temporal+" es impar "+compar);
        maymen=(temporal>=5)&&(temporal<10);
        System.out.println("El "+temporal+" es mayor o igual a 5 o menor a 10 "+maymen);
        System.out.print("Dime un numero ");
        int numero5= scanner.nextInt();
        temporal=numero2;
        compar=(temporal%2!=0);
        System.out.println("El "+temporal+" es impar "+compar);
        maymen=(temporal>=5)&&(temporal<10);
        System.out.println("El "+temporal+" es mayor o igual a 5 o menor a 10 "+maymen);
        System.out.print("El "+numero2+" ha aparecido antes ");
        System.out.println(comintro=(numero2==numero1)||(numero2==numero3)||(numero2==numero4)||(numero2==numero5));//Ejemplo de funcion comintro aplicado al numero 2
        System.out.print("El "+numero3+" ha aparecido antes ");
        System.out.println(comintro=(numero3==numero1)||(numero3==numero2)||(numero3==numero4)||(numero3==numero5));
        System.out.print("El "+numero4+" ha aparecido antes ");
        System.out.println(comintro=(numero4==numero1)||(numero4==numero3)||(numero4==numero2)||(numero4==numero5));
        System.out.print("El "+numero5+" ha aparecido antes ");
        System.out.println(comintro=(numero5==numero1)||(numero5==numero3)||(numero5==numero4)||(numero5==numero2));
        media=Math.floor((numero1+numero2+numero3+numero4+numero5)/5);//Creo la media
        System.out.println("La media aritmetica es "+media);//Imprimo la media












    }
}
