import Vista.Interfaz_Inicial;
import Vista.Modificar.MO_Equipo;
import Vista.Modificar.MO_Partido;


public class Main {
    public static void main(String[] args) {
        MO_Equipo moEquipo=new MO_Equipo();
        moEquipo.Iniciar_Modificacion();
        /*MO_Partido moPartido=new MO_Partido();
        moPartido.Iniciar_Modificacion();*/
    }
}
