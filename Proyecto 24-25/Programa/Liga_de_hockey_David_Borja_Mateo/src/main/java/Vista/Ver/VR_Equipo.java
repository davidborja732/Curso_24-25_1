package Vista.Ver;

import Controlador.Controlador_Equipos.CO_Equipos;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Equipo {

    /* Instancia de la clase CO_Equipos */
    CO_Equipos coEquipos;

    /* Constructor de la clase */
    public VR_Equipo() {
        // Inicializa la instancia de CO_Equipos
    }

    /* Método para inicializar la vista de los equipos */
    public void Iniciar_Vista() {
        coEquipos = new CO_Equipos();
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        JFrame frame = new JFrame("Ver Equipo"); /* Se establece el título de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new BorderLayout()); /* Se usa un diseño de BorderLayout */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre solo de esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se define el modelo de la tabla con las columnas */
        DefaultTableModel modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre"); /* Se añade columna para el nombre del equipo */
        modeloTabla.addColumn("N_Titulos"); /* Se añade columna para el número de títulos ganados */
        modeloTabla.addColumn("Estadio"); /* Se añade columna para el nombre del estadio */
        modeloTabla.addColumn("DNI_entrenador"); /* Se añade columna para el DNI del entrenador */

        /* Se crea la tabla con el modelo definido */
        JTable tablaEquipos = new JTable(modeloTabla);

        /* Se añade un scroll para permitir desplazamiento en caso de que haya muchos datos */
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
        frame.add(scrollPane, BorderLayout.CENTER); /* Se añade la tabla en el centro de la ventana */

        /* Se llama al método cargarDatos() para obtener los datos de la base de datos y mostrarlos en la tabla */
        coEquipos.cargarDatos(modeloTabla);

        frame.setVisible(true); /* Se muestra la ventana */
    }
}
