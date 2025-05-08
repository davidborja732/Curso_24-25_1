import Conexiones.Conexion;
import Interfaz.Insertar.IN_Juega;
import Interfaz.Interfaz_Inicial;

public class Main {
    public static void main(String[] args) {
        /*Interfaz_Inicial interfaz=new Interfaz_Inicial();
        interfaz.Inicializar_Interfaz_inicial();
        Conexion conexion=new Conexion();
        System.out.printf(conexion.toString());*/
        IN_Juega inJuega=new IN_Juega();
        inJuega.Iniciar_insercion();
    }
}
