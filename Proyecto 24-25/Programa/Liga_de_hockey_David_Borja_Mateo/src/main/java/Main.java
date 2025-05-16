import Controlador.Conexion;
import Vista.Borrar.BO_Equipo;
import Vista.Borrar.BO_Juega;
import Vista.Insertar.IN_Equipo;
import Vista.Insertar.IN_Juega;
import Vista.Insertar.IN_Partido;
import Vista.Interfaz_Inicial;
import Vista.Modificar.MO_Equipo;
import Vista.Modificar.MO_Juega;
import Vista.Ver.VR_Equipo;
import Vista.Ver.VR_Juega;

public class Main {
    public static void main(String[] args) {
        /*Interfaz_Inicial interfaz=new Interfaz_Inicial();
        interfaz.Inicializar_Interfaz_inicial();*/
        /*Conexion conexion=new Conexion();
        System.out.printf(conexion.toString());*/
        /*IN_Juega inJuega=new IN_Juega();
        inJuega.Iniciar_insercion();*/
        /*VR_Juega moJuega=new VR_Juega();
        moJuega.Iniciar_Vista();*/
        //IN_Equipo inEquipo=new IN_Equipo();
        //inEquipo.Iniciar_insercion();
        /*MO_Equipo moEquipo=new MO_Equipo();
        moEquipo.Iniciar_Modificacion();*/
        /*VR_Equipo boEquipo=new VR_Equipo();
        boEquipo.Iniciar_Vista();*/
        IN_Partido inPartido=new IN_Partido();
        inPartido.Iniciar_insercion();
    }
}
