public class Empleado {
    private String nombre;
    private String apellidos;
    private String DNI;
    private String Direccion;
    private int años_antiguedad;
    private int telefono;
    private int salario;
    private String supervisor;
    public int incremento;

    public void setIncremento(int incremento) {
        this.incremento = incremento;
    }

    public int getIncremento() {
        return incremento;
    }

    public Empleado(String nombre, String apellidos, String DNI, String direccion, int telefono, int salario) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.DNI = DNI;
        Direccion = direccion;
        this.telefono = telefono;
        this.salario = salario;
    }

    public int getAños_antiguedad() {
        return años_antiguedad;
    }

    public void setAños_antiguedad(int años_antiguedad) {
        this.años_antiguedad = años_antiguedad;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String direccion) {
        Direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }
    @Override
    public String toString() {
        return "Empleado{" +
                "nombre='" + nombre + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", DNI='" + DNI + '\'' +
                ", Direccion='" + Direccion + '\'' +
                ", años_antiguedad=" + años_antiguedad +
                ", telefono=" + telefono +
                ", salario=" + salario +
                ", supervisor='" + supervisor + '\'' +
                '}';
    }
    private String cambiar_supervisor(String supervisornuevo){
        if (supervisornuevo.isEmpty()){
            return "No has introducido ningun supervisor";
        }else {
            setSupervisor(supervisornuevo);
            return "Supervisor cambiado tu nuevo supervisor es "+supervisornuevo;
        }
    }
    public int incrementarsalariosalario(int antiguedad,int incremento) {
        int incre=((salario*incremento)/100)*antiguedad;
        return salario+incre;
    }
}
