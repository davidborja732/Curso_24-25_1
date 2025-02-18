public class Secretario extends  Empleado {
    public int despacho;
    public int numerofax;
    private int incremento=5;

    public int getIncremento() {
        return incremento;
    }

    public void setIncremento(int incremento) {
        this.incremento = incremento;
    }

    public Secretario(String nombre, String apellidos, String DNI, String direccion, int telefono, int salario, int despacho, int numerofax) {
        super(nombre, apellidos, DNI, direccion, telefono, salario);
        this.despacho = despacho;
        this.numerofax = numerofax;
    }

    public int getDespacho() {
        return despacho;
    }

    public void setDespacho(int despacho) {
        this.despacho = despacho;
    }

    public int getNumerofax() {
        return numerofax;
    }

    public void setNumerofax(int numerofax) {
        this.numerofax = numerofax;
    }

    @Override
    public int incrementarsalariosalario(int antiguedad, int incremento) {
        return super.incrementarsalariosalario(antiguedad, incremento);
    }

    @Override
    public String toString() {
        return super.toString()+ " Esta persona es secretario/a";
    }
}
