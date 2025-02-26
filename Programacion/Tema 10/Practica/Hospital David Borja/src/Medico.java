import java.util.ArrayList;

public class Medico extends Persona{
    private int numero_colegiado;
    private String especialidad;
    public ArrayList<Paciente> pacientes=new ArrayList<>();
    private int salario_base;
    private int aumento=8;

    public Medico(String apellidos, String direccion, String DNI, int edad, String nombre, int telefono) {
        super(apellidos, direccion, DNI, edad, nombre, telefono);
    }

    public void setAumento(int aumento) {
        this.aumento = aumento;
    }

    public int getAumento() {
        return aumento;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getNumero_colegiado() {
        return numero_colegiado;
    }

    public void setNumero_colegiado(int numero_colegiado) {
        this.numero_colegiado = numero_colegiado;
    }

    public ArrayList<Paciente> getPacientes() {
        return pacientes;
    }

    public void setPacientes(ArrayList<Paciente> pacientes) {
        this.pacientes = pacientes;
    }

    public int getSalario_base() {
        return salario_base;
    }

    public void setSalario_base(int salario_base) {
        this.salario_base = salario_base;
    }

    public Medico(String apellidos, String direccion, String DNI, int edad, String nombre, int telefono, String especialidad, int numero_colegiado, int salario_base) {
        super(apellidos, direccion, DNI, edad, nombre, telefono);
        this.especialidad = especialidad;
        this.numero_colegiado = numero_colegiado;
        this.salario_base = salario_base;
    }



    public String añadir_paciente(Paciente paciente){
        pacientes.add(paciente);
        return "Paciente añadido";
    }
    public String eliminar_paciente(Paciente paciente){
        pacientes.remove(paciente);
        return "Paciente eliminado";
    }
    public String actualizardatos(String direccion, int telefono, String especialidad){
        setDireccion(direccion);
        setTelefono(telefono);
        setEspecialidad(especialidad);
        return "Datos cambiados";
    }

    @Override
    public String imprimir() {
        return super.imprimir()+" Numero colegiado "+numero_colegiado+" Especialidad "+especialidad+" Salario base "+salario_base;
    }

    @Override
    public int calcularbeneficios(int antiguedad) {
        aumento=getAumento();
        int incre=((salario_base*aumento)/100)*antiguedad;
        setSalario_base(salario_base+incre);
        return salario_base+incre;
    }
}
