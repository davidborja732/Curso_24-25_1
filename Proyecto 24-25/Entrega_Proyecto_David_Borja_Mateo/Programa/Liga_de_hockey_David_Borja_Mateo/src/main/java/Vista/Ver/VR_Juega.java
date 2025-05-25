package Vista.Ver;

import Controlador.Controlador_Juega.Eliminar;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Juega {

    /* Instancia de la clase Eliminar para cargar los datos */
    private final Eliminar eliminar;

    /* Variables para la interfaz grafica */
    private JFrame frame;
    private JTable tablaEquipos;
    private DefaultTableModel modeloTabla;

    /* Constructor de la clase */
    public VR_Juega() {
        eliminar = new Eliminar(); /* Se inicializa la instancia de Eliminar */
    }

    /* Metodo para inicializar la vista de los equipos en un partido */
    public void Iniciar_Vista() {
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        frame = new JFrame("Ver equipos de partido"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new BorderLayout()); /* Se usa un diseño de BorderLayout */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crea el modelo de la tabla con las columnas definidas */
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre Equipo"); /* Se añade la columna para el nombre del equipo */
        modeloTabla.addColumn("Partido"); /* Se añade la columna para el identificador del partido */
        modeloTabla.addColumn("Rol"); /* Se añade la columna para el rol del equipo en el partido */

        /* Se crea la tabla con el modelo definido */
        tablaEquipos = new JTable(modeloTabla);

        /* Se añade un scroll para permitir el desplazamiento si hay muchos datos */
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
        frame.add(scrollPane, BorderLayout.CENTER); /* Se añade la tabla en el centro de la ventana */

        /* Se llama al metodo cargarDatos() para poblar la tabla con los datos de la base de datos */
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true); /* Se muestra la ventana */
    }
}


