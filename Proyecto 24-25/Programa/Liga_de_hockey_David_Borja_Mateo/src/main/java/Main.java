import Controlador.Conexion;
import Controlador.Controlador_Partidos.Modificar;
import Vista.Borrar.BO_Equipo;
import Vista.Borrar.BO_Informe;
import Vista.Borrar.BO_Juega;

import Vista.Borrar.BO_Partido;
import Vista.Insertar.IN_Equipo;
import Vista.Insertar.IN_Juega;
import Vista.Insertar.IN_Partido;
import Vista.Insertar.IN_informe;
import Vista.Interfaz_Inicial;
import Vista.Modificar.MO_Equipo;
import Vista.Modificar.MO_Informe;
import Vista.Modificar.MO_Juega;
import Vista.Modificar.MO_Partido;
import Vista.Ver.VR_Equipo;
import Vista.Ver.VR_Informe;
import Vista.Ver.VR_Juega;
import Vista.Ver.VR_Partido;

public class Main {
    public static void main(String[] args) {
        Interfaz_Inicial interfaz=new Interfaz_Inicial();
        interfaz.Inicializar_Interfaz_inicial();
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
        /*IN_Partido inPartido=new IN_Partido();
        inPartido.Iniciar_insercion();*/
        /*BO_Equipo boPartido=new BO_Equipo();
        boPartido.Iniciar_Borrado();*/
        /*MO_Partido moPartido=new MO_Partido();
        moPartido.Iniciar_Modificacion();*/
        /*BO_Partido boPartido=new BO_Partido();
        boPartido.Iniciar_Borrado();
        VR_Partido vrPartido=new VR_Partido();
        vrPartido.Iniciar_Vista();*/
        /*IN_informe inInforme=new IN_informe();
        inInforme.Iniciar_insercion();*/
        /*VR_Informe moInforme=new VR_Informe();
        moInforme.Iniciar_Vista();*/
    }
}
