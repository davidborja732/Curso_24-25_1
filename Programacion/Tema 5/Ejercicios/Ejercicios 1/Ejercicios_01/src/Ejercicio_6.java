import java.util.Scanner;

public class Ejercicio_6 {
    public static void main(String[] args) {
        int contador=0;
        int lista[]={(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10)))};
        for (int i=0;i<lista.length;i++){
            System.out.print(lista[i]+" ");
            if (lista[i]<0){
                contador++;
            }
        }
        System.out.println("Hay un total de "+contador+" numeros negativos");
    }
}
