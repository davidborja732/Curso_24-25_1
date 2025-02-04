package Ejercicio_2;

public class Main {
    public static void main(String[] args) {
        Auto auto=new Auto();
        Motocicleta moto=new Motocicleta();
        Camion camion=new Camion();
        System.out.println(auto.describirVehiculo());
        System.out.println(moto.describirVehiculo());
        System.out.println(camion.describirVehiculo());
    }
}
