public class Ejercicio_8 {
    public static void main(String[] args) {
        int operacion;
        int lista[] = {(int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10)))};
        int lista2[] = {(int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10)))};
        int lista3[] = {0,0,0,0,0,0,0,0,0,0};
        for (int i = 0; i < lista.length - 1; i++) {
            System.out.print(lista[i] + " ");
        }
        System.out.println(" ");
        for (int i = 0; i < lista2.length - 1; i++) {
            System.out.print(lista2[i] + " ");
        }
        System.out.println(" ");
        for (int i = 0; i <=10-1; i++){
            lista3[i]=lista[i]+lista2[i];
            System.out.print(lista3[i]+" ");
        }
    }
}