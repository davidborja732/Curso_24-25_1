package Vista.Ver;

import Controlador.Controlador_Partidos.Eliminar;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Partido {

    /* Constructor vacio de la clase */
    public VR_Partido() {
    }

    /* Metodo para inicializar la vista de partidos */
    public void Iniciar_Vista() {
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea una instancia de la clase Eliminar, que se usara para cargar los datos */
        Eliminar eliminar = new Eliminar();

        /* Se crea la ventana principal */
        JFrame frame;
        frame = new JFrame("Ver Partidos"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new BorderLayout()); /* Se establece el diseño con BorderLayout */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crea la tabla que mostrara los datos de los partidos */
        JTable tablaPartidos;
        DefaultTableModel modeloTabla;

        /* Se define el modelo de la tabla con las columnas */
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_partido"); /* Se añade columna para el identificador del partido */
        modeloTabla.addColumn("Ganador"); /* Se añade columna para el ganador del partido */
        modeloTabla.addColumn("Fecha"); /* Se añade columna para la fecha del partido */

        /* Se crea la tabla con el modelo definido */
        tablaPartidos = new JTable(modeloTabla);

        /* Se añade un scroll para permitir desplazamiento en caso de que haya muchos datos */
        JScrollPane scrollPane = new JScrollPane(tablaPartidos);
        frame.add(scrollPane, BorderLayout.CENTER); /* Se añade la tabla en el centro de la ventana */

        /* Se llama al metodo cargarDatos() para obtener los datos de la base de datos y mostrarlos en la tabla */
        eliminar.cargarDatos(modeloTabla);
        // Verifica si la columna "Ganador" está vacía y asigna "No establecido"
        for (int i = 0; i < modeloTabla.getRowCount(); i++) {
            Object valorGanador = modeloTabla.getValueAt(i, 1); // Segunda columna (Ganador)
            // Comprobación más robusta para evitar posibles errores
            if (valorGanador == null || valorGanador.toString().trim().isEmpty()) {
                modeloTabla.setValueAt("No establecido", i, 1);
            }
        }

        frame.setVisible(true); /* Se muestra la ventana */
    }
}
