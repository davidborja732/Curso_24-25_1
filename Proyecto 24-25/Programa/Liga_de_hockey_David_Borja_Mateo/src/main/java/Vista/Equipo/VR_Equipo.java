package Vista.Equipo;

import Controlador.Controlador_Equipos.CO_Equipos;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Equipo {

    /* Instancia de la clase CO_Equipos */
    CO_Equipos coEquipos;

    /* Constructor de la clase */
    public VR_Equipo() {}

    /* Metodo para inicializar la vista de los equipos */
    public void Iniciar_Vista() {
        coEquipos = new CO_Equipos();

        /* Obtiene las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Crea la ventana principal */
        JFrame frame = new JFrame("Ver Equipo");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        /* Define el modelo de la tabla con las columnas */
        DefaultTableModel modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre"); /* Columna para el nombre del equipo */
        modeloTabla.addColumn("N_Titulos"); /* Columna para el numero de titulos ganados */
        modeloTabla.addColumn("Estadio"); /* Columna para el nombre del estadio */
        modeloTabla.addColumn("DNI_entrenador"); /* Columna para el DNI del entrenador */

        /* Crea la tabla con el modelo definido */
        JTable tablaEquipos = new JTable(modeloTabla);

        /* Agrega un scroll para permitir desplazamiento */
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
        frame.add(scrollPane, BorderLayout.CENTER);

        /* Carga los datos de los equipos en la tabla */
        coEquipos.cargarDatos(modeloTabla);

        frame.setVisible(true); /* Muestra la ventana */
    }
}

