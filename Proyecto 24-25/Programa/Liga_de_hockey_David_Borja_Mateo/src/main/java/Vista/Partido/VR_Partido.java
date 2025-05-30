package Vista.Partido;

import Controlador.Controlador_Partidos.CO_Partidos; // Usamos CO_Partidos en lugar de Eliminar
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Partido {

    /* Instancia de la clase CO_Partidos */
    private CO_Partidos coPartidos;

    /* Constructor de la clase */
    public VR_Partido() {
        coPartidos = new CO_Partidos(); // Inicializa la instancia de CO_Partidos
    }

    /* Método para inicializar la vista de los partidos */
    public void Iniciar_Vista() {
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        JFrame frame = new JFrame("Ver Partidos"); /* Se establece el título de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new BorderLayout()); /* Se usa un diseño de BorderLayout */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre solo de esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se define el modelo de la tabla con las columnas */
        DefaultTableModel modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Fecha");
        modeloTabla.addColumn("Equipo Local");
        modeloTabla.addColumn("Equipo Visitante");
        modeloTabla.addColumn("Ganador");
        modeloTabla.addColumn("Árbitro");

        /* Se crea la tabla con el modelo definido */
        JTable tablaPartidos = new JTable(modeloTabla);

        /* Se añade un scroll para permitir desplazamiento en caso de que haya muchos datos */
        JScrollPane scrollPane = new JScrollPane(tablaPartidos);
        frame.add(scrollPane, BorderLayout.CENTER); /* Se añade la tabla en el centro de la ventana */

        /* Se llama al método cargarDatos() de CO_Partidos para obtener los datos de la base de datos */
        coPartidos.cargarDatos(modeloTabla);

        /* Verifica si la columna "Ganador" está vacía y asigna "Pendiente" */
        for (int i = 0; i < modeloTabla.getRowCount(); i++) {
            Object valorGanador = modeloTabla.getValueAt(i, 4);
            if (valorGanador == null || valorGanador.toString().trim().isEmpty()) {
                modeloTabla.setValueAt("Pendiente", i, 4);
            }
        }

        frame.setVisible(true); /* Se muestra la ventana */
    }
}


