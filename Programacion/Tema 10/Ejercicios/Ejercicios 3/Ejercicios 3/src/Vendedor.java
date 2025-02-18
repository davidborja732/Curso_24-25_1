import java.util.ArrayList;

public class Vendedor extends Empleado{
    public String marca;
    public String modelo;
    public int matricula;
    public int movil;
    public String Area_venta;
    public ArrayList<String> clientes=new ArrayList<>();
    private int porcentaje_Ventas;
    private int incremento=10;

    public int getIncremento() {
        return incremento;
    }

    public void setIncremento(int incremento) {
        this.incremento = incremento;
    }

    public String getArea_venta() {
        return Area_venta;
    }

    public void setArea_venta(String area_venta) {
        Area_venta = area_venta;
    }

    public ArrayList getClientes() {
        return clientes;
    }

    public void setClientes(ArrayList clientes) {
        this.clientes = clientes;
    }

    public int getMovil() {
        return movil;
    }

    public void setMovil(int movil) {
        this.movil = movil;
    }

    public int getPorcentaje_Ventas() {
        return porcentaje_Ventas;
    }

    public void setPorcentaje_Ventas(int porcentaje_Ventas) {
        this.porcentaje_Ventas = porcentaje_Ventas;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Vendedor(String nombre, String apellidos, String DNI, String direccion, int telefono, int salario, String area_venta, int incremento, String marca, int matricula, String modelo, int movil, int porcentaje_Ventas) {
        super(nombre, apellidos, DNI, direccion, telefono, salario);
        Area_venta = area_venta;
        this.incremento = incremento;
        this.marca = marca;
        this.matricula = matricula;
        this.modelo = modelo;
        this.movil = movil;
        this.porcentaje_Ventas = porcentaje_Ventas;
    }

    @Override
    public String toString() {
        return super.toString()+ " Esta persona es un Vendedor/a";
    }
    public String nuevo_cliente(String DNI){
        clientes.add(DNI);
        return "Cliente añadido";
    }
    public String borrar_cliente(String DNI){
        if (clientes.contains(DNI)){
            clientes.remove(DNI);
            return "Cliente Borrado exitosamente";
        }else {
            return "El vendedor no gestiona a este cliente o el cliente no existe";
        }
    }
    public String Cambiar_coche(String marca,String modelo,int matricula){
        if (marca!=null && modelo !=null && matricula!=0){
            setMarca(marca);
            setModelo(modelo);
            setMatricula(matricula);
            return "vehiculo cambiado";
        }else {
            return "Introduce datos validos";
        }
    }


}
