package Interfaz.Ver;

public class Equipo {
    private String Nombre;
    private int N_trofeos;
    private String DNI_Entrenador;
    private int ID_eq;

    public String getDNI_Entrenador() {
        return DNI_Entrenador;
    }

    public void setDNI_Entrenador(String DNI_Entrenador) {
        this.DNI_Entrenador = DNI_Entrenador;
    }

    public int getID_eq() {
        return ID_eq;
    }

    public void setID_eq(int ID_eq) {
        this.ID_eq = ID_eq;
    }

    public int getN_trofeos() {
        return N_trofeos;
    }

    public void setN_trofeos(int n_trofeos) {
        N_trofeos = n_trofeos;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

}
