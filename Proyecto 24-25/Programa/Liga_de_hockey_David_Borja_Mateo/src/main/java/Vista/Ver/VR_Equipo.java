package Vista.Ver;

import Controlador.Controlador_Equipos.Eliminar;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Equipo {
    public VR_Equipo() {
    }

    public void Iniciar_Vista() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Eliminar eliminar = new Eliminar();
        JFrame frame;
        frame = new JFrame("Ver Equipo");
        frame.setSize(ancho / 4, alto / 2);
        JTable tablaEquipos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Creo la tabla con las columnas que va a tener
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_eq");
        modeloTabla.addColumn("Nombre");
        modeloTabla.addColumn("N_Titulos");
        modeloTabla.addColumn("Estadio");
        modeloTabla.addColumn("DNI_entrenador");
        tablaEquipos = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
        frame.add(scrollPane, BorderLayout.CENTER);
        // Llamo a cargarDatos() para rellenar el JTable con los datos de la Base de datos
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true);
    }
}
