package Interfaz.Ver;

public class Informe {
    private int N_rojas;
    private  int N_amarillas;
    private int Id_informe;
    private int ID_partido;
    private int ID_arbitro;

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
}
