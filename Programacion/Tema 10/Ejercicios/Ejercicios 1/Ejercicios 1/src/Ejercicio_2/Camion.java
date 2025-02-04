package Ejercicio_2;

public class Camion extends Vehiculo{
    @Override
    String describirVehiculo() {
        return super.describirVehiculo()+"Soy un camion ";
    }
}
