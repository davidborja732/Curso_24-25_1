public class Ejercicio_7 {
    public static void main(String[] args) {
        int lista[]={(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10))),(int) ((Math.floor(Math.random()*(-10-10)+10)))};
        for (int i=0;i<lista.length;i++){
            System.out.print(lista[i]+" ");
        }
        System.out.println(" ");
        for (int i=0;i<lista.length;i++){
            if (lista[i]<0) {
                lista[i]=lista[i]*-1;
                System.out.print(lista[i]+" ");
            } else {
                System.out.print(lista[i]+" ");
            }

        }
    }
}
