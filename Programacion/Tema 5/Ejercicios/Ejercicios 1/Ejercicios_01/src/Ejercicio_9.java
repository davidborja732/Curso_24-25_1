public class Ejercicio_9 {
    public static void main(String[] args) {
        int lista[] = {(int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10))), (int) ((Math.floor(Math.random() * (-10 - 10) + 10)))};
        for (int i = 0; i < lista.length - 1; i++) {
            System.out.print(lista[i] + " ");
        }
        System.out.println(" ");
        int aux;
        for (int i = 1; i < lista.length-1; i++) {
            for (int j = 0; j < lista.length - 1; j++) {
                aux=lista[i];
                if (lista[j]==aux){
                    System.out.print(lista[j]+" ");
                }
            }
        }
    }
}

