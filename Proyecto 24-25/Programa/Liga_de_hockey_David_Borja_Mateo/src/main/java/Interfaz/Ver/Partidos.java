package Interfaz.Ver;

import java.util.Date;

public class Partidos {
    private Date fecha;
    private int Ganador;
    private int ID_partido;
    private int ID_arbitro;

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
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
