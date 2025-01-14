import java.time.LocalDate;

public class DemoConcesionarios {
    public static void main(String[] args) {
        Concesionario concesionario=new Concesionario();
        Coche coche=new Coche("Seat","panda", 2008,"7890LÑJ",4500,5,"Diesel");
        Coche coche2=new Coche("Seat","Arona", 2018,"7643ÑÑJ",45600,5,"Gasolina");
        Coche coche3=new Coche("Fiat","Multipla", 2007,"8548PLO",6500,2,"Diesel");
        Motocicleta motocicleta=new Motocicleta("Yamaha","Modelo1",2006,"9000PLÑ",23000,150,"SCooter");
        Motocicleta motocicleta2=new Motocicleta("Suzuki","Modelo2",200,"campo");
        Camion camion=new Camion("Renault","Semitruck",4500.00,18);
        Camion camion1=new Camion("Renault","trucks",45000.00,24);
        //añado los vehiculos
        concesionario.añadir(coche);
        concesionario.añadir(coche2);
        concesionario.añadir(coche3);
        concesionario.añadir(motocicleta);
        concesionario.añadir(motocicleta2);
        concesionario.añadir(camion1);
        concesionario.añadir(camion);
        System.out.println("Muestro vehiculos");
        concesionario.mostrarVehiculos();
        System.out.println("Termino de mostrar vehiculos");
        System.out.println("Miro cual es el vehiculo mas antiguo ");
        System.out.println(concesionario.VehiculoMasAntiguo().descripcion());
        System.out.println("El precio promedio es ");
        System.out.println(concesionario.Precio_Promedio());
        System.out.println("Buscamos ");
        System.out.println(concesionario.buscar().descripcion());



    }
}
