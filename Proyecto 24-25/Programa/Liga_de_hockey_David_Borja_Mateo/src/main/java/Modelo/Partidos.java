package Modelo;

public class Partidos {
    private String fecha;
    private String equipoLocal; // Nombre del equipo local
    private String equipoVisitante; // Nombre del equipo visitante
    private String ganador; // Nombre del equipo ganador
    private int ID_partido;
    private int ID_arbitro; // Cambiado a String para reflejar el tipo CHAR(9)

    // Constructor para crear un partido con solo el ID
    public Partidos(int ID_partido) {
        this.ID_partido = ID_partido;
    }

    // Constructor para crear un partido con ID, fecha y árbitro
    public Partidos(int ID_partido, String fecha, int ID_arbitro) {
        this.ID_partido = ID_partido;
        this.fecha = fecha;
        this.ID_arbitro = ID_arbitro;
    }

    // Constructor para crear un partido con todos los detalles
    public Partidos(int ID_partido, String fecha, String equipoLocal, String equipoVisitante, String ganador, int ID_arbitro) {
        this.ID_partido = ID_partido;
        this.fecha = fecha;
        this.equipoLocal = equipoLocal;
        this.equipoVisitante = equipoVisitante;
        this.ganador = ganador;
        this.ID_arbitro = ID_arbitro;
    }

    public Partidos(String fecha, String equipoLocal, String equipoVisitante, String ganador, int ID_arbitro) {
        this.fecha = fecha;
        this.equipoLocal = equipoLocal;
        this.equipoVisitante = equipoVisitante;
        this.ganador = ganador;
        this.ID_arbitro = ID_arbitro;
    }

    // Getters y Setters
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEquipoLocal() {
        return equipoLocal;
    }

    public void setEquipoLocal(String equipoLocal) {
        this.equipoLocal = equipoLocal;
    }

    public String getEquipoVisitante() {
        return equipoVisitante;
    }

    public void setEquipoVisitante(String equipoVisitante) {
        this.equipoVisitante = equipoVisitante;
    }

    public String getGanador() {
        return ganador;
    }

    public void setGanador(String ganador) {
        this.ganador = ganador;
    }

    public int getID_partido() {
        return ID_partido;
    }

    public void setID_partido(int ID_partido) {
        this.ID_partido = ID_partido;
    }

    public int getID_arbitro() {
        return ID_arbitro;
    }

    public void setID_arbitro(int ID_arbitro) {
        this.ID_arbitro = ID_arbitro;
    }
}

