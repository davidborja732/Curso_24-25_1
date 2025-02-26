public abstract class Persona {
    private String nombre;
    private String apellidos;
    private String dni;
    private String direccion;
    private int edad;
    private int telefono;

    public Persona(String apellidos, String direccion, String DNI, int edad, String nombre, int telefono) {
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.dni = DNI;
        this.edad = edad;
        this.nombre = nombre;
        this.telefono = telefono;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    public String imprimir(){
        return "Nombre "+nombre+" Apellidos "+apellidos+" dni "+ dni +" direccion "+ direccion +" Edad "+edad+" telefono "+telefono;
    }
    public String actualizardatos(String nuevadireccion, int nuevotelefono){
        setDireccion(nuevadireccion);
        setTelefono(nuevotelefono);
        return "Datos cambiados";
    }

    public abstract int calcularbeneficios(int consultas);
}
