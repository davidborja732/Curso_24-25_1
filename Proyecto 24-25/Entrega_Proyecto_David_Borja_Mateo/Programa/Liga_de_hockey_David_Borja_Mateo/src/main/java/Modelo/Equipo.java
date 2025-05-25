package Modelo;
public class Equipo {
    private String nombre;
    private int n_trofeos;
    private String dni_Entrenador;
    private int id_eq;
    private String estadio;

    public Equipo() {
    }

    public Equipo(int id_eq) {
        this.id_eq = id_eq;
    }

    public Equipo(String dni_Entrenador, String estadio, int n_trofeos, String nombre) {
        this.dni_Entrenador = dni_Entrenador;
        this.estadio = estadio;
        this.n_trofeos = n_trofeos;
        this.nombre = nombre;
    }

    public Equipo(String nombre, int n_trofeos, String dni_Entrenador, int id_eq, String estadio) {
        this.nombre = nombre;
        this.n_trofeos = n_trofeos;
        this.dni_Entrenador = dni_Entrenador;
        this.id_eq = id_eq;
        this.estadio = estadio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getN_trofeos() {
        return n_trofeos;
    }

    public void setN_trofeos(int n_trofeos) {
        this.n_trofeos = n_trofeos;
    }

    public String getDni_Entrenador() {
        return dni_Entrenador;
    }

    public void setDni_Entrenador(String dni_Entrenador) {
        this.dni_Entrenador = dni_Entrenador;
    }

    public int getId_eq() {
        return id_eq;
    }

    public void setId_eq(int id_eq) {
        this.id_eq = id_eq;
    }

    public String getEstadio() {
        return estadio;
    }

    public void setEstadio(String estadio) {
        this.estadio = estadio;
    }
}
