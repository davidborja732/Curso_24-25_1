import java.util.ArrayList;

public class Vendedor_de_zona extends Empleado{
    public int despacho;
    public Secretario secretario;
    public ArrayList<Vendedor> listavendedores=new ArrayList<>();
    public String marca;
    public String modelo;
    public int matricula;
    private int incremento=20;

    public Vendedor_de_zona(String nombre, String apellidos, String DNI, String direccion, int telefono, int salario, int despacho,Secretario secretario, String modelo, String marca, int matricula, int incremento) {
        super(nombre, apellidos, DNI, direccion, telefono, salario);
        this.despacho = despacho;
        this.secretario = secretario;
        this.modelo = modelo;
        this.marca = marca;
        this.matricula = matricula;
        this.incremento = incremento;
    }

    public ArrayList<Vendedor> getListavendedores() {
        return listavendedores;
    }

    public void setListavendedores(ArrayList<Vendedor> listavendedores) {
        this.listavendedores = listavendedores;
    }

    public int getDespacho() {
        return despacho;
    }

    public void setDespacho(int despacho) {
        this.despacho = despacho;
    }

    public Secretario getSecretario() {
        return secretario;
    }

    public void setSecretario(Secretario secretario) {
        this.secretario = secretario;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }
    public String Cambiar_secretario(Secretario secretario){
        setSecretario(secretario);
        return "Secretario cambiado";
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
    public String añadir_vendedor(Vendedor vendedor){
        listavendedores.add(vendedor);
        return "Vendedor añadido";
    }
    public String eliminar_vendedor(Vendedor vendedor){
        if (listavendedores.contains(vendedor)){
            listavendedores.remove(vendedor);
            return "Vendedor Borrado";
        }else {
            return "El vendedor no se encuentra en la lista";
        }
    }
}
