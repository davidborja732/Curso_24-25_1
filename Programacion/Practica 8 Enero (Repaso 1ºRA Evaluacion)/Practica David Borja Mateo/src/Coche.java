public class Coche extends Vehiculo{
    private int Numero_puertas;
    private String combustible;
    public Coche(){
        Numero_puertas = Numero_puertas;
        this.combustible = combustible;
    }
    public Coche(String marca, String modelo, int año_Fabricacion, String matricula, double precio, int numero_puertas, String combustible) {
        super(marca, modelo, año_Fabricacion, matricula, precio);
        Numero_puertas = numero_puertas;
        this.combustible = combustible;
    }

    public Coche(String marca, String modelo, int numero_puertas, String combustible) {
        super(marca, modelo);
        Numero_puertas = numero_puertas;
        this.combustible = combustible;
    }

    public Coche(String matricula, int numero_puertas, String combustible) {
        super(matricula);
        Numero_puertas = numero_puertas;
        this.combustible = combustible;
    }

    public Coche(int numero_puertas, String combustible) {
        Numero_puertas = numero_puertas;
        this.combustible = combustible;
    }

    public int getNumero_puertas() {
        return Numero_puertas;
    }

    public void setNumero_puertas(int numero_puertas) {
        Numero_puertas = numero_puertas;
    }

    public String getCombustible() {
        return combustible;
    }

    public void setCombustible(String combustible) {
        this.combustible = combustible;
    }

    @Override
    public String descripcion() {
        return super.descripcion()+" Numero de puertas" + Numero_puertas + " combustible" + combustible;
    }
}
