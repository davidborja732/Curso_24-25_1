package Modelo;

public class Informe {
    private int N_rojas;
    private int N_amarillas;
    private int Id_informe;
    private int ID_partido;
    private int ID_arbitro;
    private String equipoLocal;  // Nuevo campo
    private String equipoVisitante;  // Nuevo campo

    // Constructor para eliminar por ID
    public Informe(int id_informe) {
        Id_informe = id_informe;
    }

    // Constructor para modificar informe
    public Informe(int id_informe, int n_rojas, int n_amarillas) {
        Id_informe = id_informe;
        N_rojas = n_rojas;
        N_amarillas = n_amarillas;
    }

    // Constructor para añadir informe
    public Informe(int ID_arbitro, int ID_partido, int n_amarillas, int n_rojas, String equipoLocal, String equipoVisitante) {
        this.ID_arbitro = ID_arbitro;
        this.ID_partido = ID_partido;
        this.N_amarillas = n_amarillas;
        this.N_rojas = n_rojas;
        this.equipoLocal = equipoLocal;
        this.equipoVisitante = equipoVisitante;
    }

    public int getID_arbitro() {
        return ID_arbitro;
    }

    public void setID_arbitro(int ID_arbitro) {
        this.ID_arbitro = ID_arbitro;
    }

    public int getId_informe() {
        return Id_informe;
    }

    public void setId_informe(int id_informe) {
        Id_informe = id_informe;
    }

    public int getID_partido() {
        return ID_partido;
    }

    public void setID_partido(int ID_partido) {
        this.ID_partido = ID_partido;
    }

    public int getN_amarillas() {
        return N_amarillas;
    }

    public void setN_amarillas(int n_amarillas) {
        N_amarillas = n_amarillas;
    }

    public int getN_rojas() {
        return N_rojas;
    }

    public void setN_rojas(int n_rojas) {
        N_rojas = n_rojas;
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
}

