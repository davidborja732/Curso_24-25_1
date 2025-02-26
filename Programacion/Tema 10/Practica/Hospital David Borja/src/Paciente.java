import java.util.ArrayList;

public class Paciente extends Medico{
    private int numero_historial_medico;
    public ArrayList<String> enfermedades=new ArrayList<>();
    private String nombre_medico_cabecera;

    public ArrayList<String> getEnfermedades() {
        return enfermedades;
    }

    public void setEnfermedades(ArrayList<String> enfermedades) {
        this.enfermedades = enfermedades;
    }

    public ArrayList<String> getEnfermedeades() {
        return enfermedades;
    }

    public void setEnfermedeades(ArrayList<String> enfermedeades) {
        this.enfermedades = enfermedeades;
    }

    public String getNombre_medico_cabecera() {
        return nombre_medico_cabecera;
    }

    public void setNombre_medico_cabecera(String nombre_medico_cabecera) {
        this.nombre_medico_cabecera = nombre_medico_cabecera;
    }

    public int getNumero_historial_medico() {
        return numero_historial_medico;
    }

    public void setNumero_historial_medico(int numero_historial_medico) {
        this.numero_historial_medico = numero_historial_medico;
    }

    public Paciente(String apellidos, String direccion, String DNI, int edad, String nombre, int telefono, String nombre_medico_cabecera, int numero_historial_medico) {
        super(apellidos, direccion, DNI, edad, nombre, telefono);
        this.nombre_medico_cabecera = nombre_medico_cabecera;
        this.numero_historial_medico = numero_historial_medico;
    }

    @Override
    public String imprimir() {
        return super.imprimir()+" Historial medico "+numero_historial_medico+" Nombre medico "+nombre_medico_cabecera;
    }

    @Override
    public int calcularbeneficios(int consultas) {
        return consultas;
    }
    public String actualizardatos(String apellidos, String direccion, String DNI, int edad, String nombre, int telefono, String nombre_medico_cabecera, int numero_historial_medico){
        setApellidos(apellidos);
        setDireccion(direccion);
        setDni(DNI);
        setEdad(edad);
        setNombre(nombre);
        setTelefono(telefono);
        setNombre_medico_cabecera(nombre_medico_cabecera);
        setNumero_historial_medico(numero_historial_medico);
        return "Datos cambiados";
    }
    public String añadir_diagnostico(String diagnostico){
        enfermedades.add(diagnostico);
        return "Diagnostico añadido correctamente";
    }
    public String cambiarmedico(String medico){
        nombre_medico_cabecera= medico;
        return "Medico cambiado correctamente";
    }
}
