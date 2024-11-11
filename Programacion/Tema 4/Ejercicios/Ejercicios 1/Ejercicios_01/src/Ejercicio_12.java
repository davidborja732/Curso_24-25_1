public class Ejercicio_12 {
    static void fibonacci(){
        int numero1 = 0;
        int numero2 = 1;
        int fibonacci = 0;
        System.out.print(numero1 + " ");
        System.out.print(numero2 + " ");
        for (int i = 2; i < 11; i++) {
            fibonacci = numero1 + numero2;
            System.out.print(fibonacci+" ");
            numero1 = numero2;
            numero2 = fibonacci;
        }
    }
    public static void main(String[] args) {
        fibonacci();

    }
}

