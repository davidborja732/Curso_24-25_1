public class Motocicleta extends Vehiculo{
    private int Cilindrada;
    private String Tipo_Moto;

    public Motocicleta(String marca, String modelo, int año_Fabricacion, String matricula, double precio, int cilindrada, String tipo_Moto) {
        super(marca, modelo, año_Fabricacion, matricula, precio);
        Cilindrada = cilindrada;
        Tipo_Moto = tipo_Moto;
    }

    public Motocicleta(String marca, String modelo, int cilindrada, String tipo_Moto) {
        super(marca, modelo);
        Cilindrada = cilindrada;
        Tipo_Moto = tipo_Moto;
    }

    public Motocicleta(String matricula, int cilindrada, String tipo_Moto) {
        super(matricula);
        Cilindrada = cilindrada;
        Tipo_Moto = tipo_Moto;
    }

    public Motocicleta(int cilindrada, String tipo_Moto) {
        Cilindrada = cilindrada;
        Tipo_Moto = tipo_Moto;
    }

    public int getCilindrada() {
        return Cilindrada;
    }

    public void setCilindrada(int cilindrada) {
        Cilindrada = cilindrada;
    }

    public String getTipo_Moto() {
        return Tipo_Moto;
    }

    public void setTipo_Moto(String tipo_Moto) {
        Tipo_Moto = tipo_Moto;
    }

    @Override
    public String descripcion() {
        return super.descripcion()+" cilindrada " + Cilindrada + " Tipo moto " + Tipo_Moto;
    }


}
