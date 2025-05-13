package Controlador;

import java.awt.*;

public class Obtener_resolucion {
    public Obtener_resolucion() {
    }

    public Dimension obtener_resolucion_pantalla() {
        Toolkit t = Toolkit.getDefaultToolkit();
        return t.getScreenSize();  // Devuelve el ancho y alto de la pantalla en un objeto Dimension
    }
}
