import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Scanner;

public class Concesionario {
    private ArrayList<Vehiculo> listavehiculos;

    public Concesionario() {
        listavehiculos = new ArrayList<>();
    }

    public Concesionario(ArrayList<Vehiculo> listavehiculos) {
        this.listavehiculos = listavehiculos;
    }

    public ArrayList<Vehiculo> getListavehiculos() {
        return listavehiculos;
    }

    public void mostrarVehiculos() {
        for (Vehiculo vehiculo : listavehiculos) {
            System.out.println(vehiculo.descripcion());
        }
    }

    public Vehiculo VehiculoMasAntiguo() {
        if (listavehiculos.isEmpty()) {
            return null;
        }
        Vehiculo vehiculoMasAntiguo = listavehiculos.get(0);
        for (Vehiculo vehiculo : listavehiculos) {
            if (vehiculo.getAño_Fabricacion() != 0) {

                if (vehiculoMasAntiguo.calcularAntiguedad() < vehiculo.calcularAntiguedad()) {
                    vehiculoMasAntiguo = vehiculo;

                }
            }
        }
        return vehiculoMasAntiguo;
    }

    public Vehiculo buscar() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime que quieres Buscar ");
        String buscado = scanner.nextLine();
        for (Vehiculo vehiculo : listavehiculos) {
            while (!(vehiculo.getMarca() == null) && vehiculo.getMarca().equals(buscado)) {
                return vehiculo;
            }
        }
        return null;
    }
    public double Precio_Promedio(){
        double suma=0;
        for (Vehiculo vehiculo:listavehiculos){
            if (vehiculo.getPrecio()!=0){
                suma+= vehiculo.getPrecio();
            }
        }
        return suma/this.listavehiculos.size();
    }
    public void añadir(Vehiculo vehiculo){
        listavehiculos.add(vehiculo);
    }

}

