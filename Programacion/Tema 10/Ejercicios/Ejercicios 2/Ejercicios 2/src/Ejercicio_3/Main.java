package Ejercicio_3;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        Vehiculo[] vehiculos = {
                new Motocicleta("Yamaha", "Ninja"),
                new Coche("Seat", "Ibiza"),
                new Motocicleta("Suzuki", "K1000"),
                new Coche("Citroen", "C3")
        };
        for (Vehiculo vehiculo : vehiculos) {
            /*if (vehiculos.getClass().equals("Coche")){
                //Coche coche=new Coche(vehiculo.getMarca(), vehiculo.getModelo());
                System.out.println(((Coche) vehiculo).abrirmaletero());
            } else if (vehiculos.getClass().equals("Motocicleta")) {
                //Motocicleta moto=new Motocicleta(vehiculo.getMarca(), vehiculo.getModelo());
                System.out.println(((Motocicleta) vehiculo).hacerCaballito());
            }*/
            if (vehiculo instanceof Coche) {
                System.out.println(((Coche) vehiculo).abrirmaletero());
            } else if (vehiculo instanceof Motocicleta) {
                System.out.println(((Motocicleta) vehiculo).hacerCaballito());
            }
        }
    }
}
