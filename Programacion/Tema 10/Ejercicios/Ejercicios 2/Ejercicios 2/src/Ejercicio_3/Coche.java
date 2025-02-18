package Ejercicio_3;

public class Coche extends Vehiculo{
    public Coche(String marca, String modelo) {
        super(marca, modelo);
    }
    public String abrirmaletero(){
        return "Maletero abierto";
    }
}
