public class Camion extends Vehiculo{
    private double Capacidad_carga;
    private int Numero_ejes;

    public Camion(String marca, String modelo, int año_Fabricacion, String matricula, double precio, double capacidad_carga, int numero_ejes) {
        super(marca, modelo, año_Fabricacion, matricula, precio);
        Capacidad_carga = capacidad_carga;
        Numero_ejes = numero_ejes;
    }

    public Camion(String marca, String modelo, double capacidad_carga, int numero_ejes) {
        super(marca, modelo);
        Capacidad_carga = capacidad_carga;
        Numero_ejes = numero_ejes;
    }

    public Camion(double capacidad_carga, int numero_ejes) {
        Capacidad_carga = capacidad_carga;
        Numero_ejes = numero_ejes;
    }

    public Camion(String matricula, double capacidad_carga, int numero_ejes) {
        super(matricula);
        Capacidad_carga = capacidad_carga;
        Numero_ejes = numero_ejes;
    }

    public double getCapacidad_carga() {
        return Capacidad_carga;
    }

    public void setCapacidad_carga(double capacidad_carga) {
        Capacidad_carga = capacidad_carga;
    }

    public int getNumero_ejes() {
        return Numero_ejes;
    }

    public void setNumero_ejes(int numero_ejes) {
        Numero_ejes = numero_ejes;
    }

    @Override
    public String descripcion() {
        return super.descripcion()+" Capacidad de carga: " + Capacidad_carga + " Número de ejes: " + Numero_ejes;
    }
}
