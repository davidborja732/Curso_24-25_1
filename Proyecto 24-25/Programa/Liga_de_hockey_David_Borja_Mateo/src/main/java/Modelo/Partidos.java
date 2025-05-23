package Modelo;

public class Partidos {
    private String fecha;
    private int Ganador;
    private int ID_partido;
    private int ID_arbitro;

    public Partidos(int ID_partido) {
        this.ID_partido = ID_partido;
    }

    public Partidos(int ID_partido, String fecha, int ID_arbitro) {
        this.ID_partido=ID_partido;
        this.fecha = fecha;
        this.ID_arbitro = ID_arbitro;
    }

    public Partidos(String fecha, int ganador, int ID_arbitro, int ID_partido) {
        this.fecha = fecha;
        Ganador = ganador;
        this.ID_arbitro = ID_arbitro;
        this.ID_partido = ID_partido;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getGanador() {
        return Ganador;
    }

    public void setGanador(int ganador) {
        Ganador = ganador;
    }

    public int getID_arbitro() {
        return ID_arbitro;
    }

    public void setID_arbitro(int ID_arbitro) {
        this.ID_arbitro = ID_arbitro;
    }

    public int getID_partido() {
        return ID_partido;
    }

    public void setID_partido(int ID_partido) {
        this.ID_partido = ID_partido;
    }
}
