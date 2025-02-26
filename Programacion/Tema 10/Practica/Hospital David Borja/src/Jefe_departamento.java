import java.util.ArrayList;

public class Jefe_departamento extends Persona{
    private int oficina;
    public ArrayList<Medico> medicos=new ArrayList<>();
    private int salario_base;
    private int aumento=12;
    public ArrayList<Medico> setMedicos() {
        return medicos;
    }
    public ArrayList<Medico> getMedicos() {
        return medicos;
    }

    public void setMedicos(ArrayList<Medico> medicos) {
        this.medicos = medicos;
    }

    public int getAumento() {
        return aumento;
    }

    public void setAumento(int aumento) {
        this.aumento = aumento;
    }

    public int getOficina() {
        return oficina;
    }

    public void setOficina(int oficina) {
        this.oficina = oficina;
    }

    public int getSalario_base() {
        return salario_base;
    }

    public void setSalario_base(int salario_base) {
        this.salario_base = salario_base;
    }

    public Jefe_departamento(String apellidos, String direccion, String DNI, int edad, String nombre, int telefono, int salario_base, int oficina) {
        super(apellidos, direccion, DNI, edad, nombre, telefono);
        this.salario_base = salario_base;
        this.oficina = oficina;
    }

    @Override
    public int calcularbeneficios(int antiguedad) {
        aumento=getAumento();
        int incre=((salario_base*aumento)/100)*antiguedad;
        setSalario_base(salario_base+incre);
        return salario_base+incre;
    }
    public String actualizardatos(String direccion, int telefono, int oficina){
        setDireccion(direccion);
        setTelefono(telefono);
        setOficina(oficina);
        return "Datos cambiados";
    }

    @Override
    public String imprimir() {
        return super.imprimir()+" Oficina "+oficina+" Salario base "+salario_base;
    }
    public String añadir_medico(Medico medico){
        medicos.add(medico);
        return "Medico añadido";
    }
    public String eliminar_medico(Medico medico){
        medicos.remove(medico);
        return "Medico eliminado";
    }
}
