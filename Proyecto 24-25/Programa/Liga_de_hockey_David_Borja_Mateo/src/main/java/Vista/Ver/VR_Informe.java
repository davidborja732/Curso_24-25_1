package Vista.Ver;

import Controlador.Controlador_Informe.Eliminar;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Informe {
    public VR_Informe() {
    }

    public void Iniciar_Vista() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Eliminar eliminar = new Eliminar();
        JFrame frame;
        frame = new JFrame("Ver Informes");
        frame.setSize(ancho / 4, alto / 2);
        JTable tablaInformes;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Creo la tabla con las columnas que va a tener
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_informe");
        modeloTabla.addColumn("Nombre Árbitro");
        modeloTabla.addColumn("N_Rojas");
        modeloTabla.addColumn("N_Amarillas");
        modeloTabla.addColumn("ID_partido");

        tablaInformes = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaInformes);
        frame.add(scrollPane, BorderLayout.CENTER);

        // Llamo a cargarDatos() para rellenar el JTable con los datos de la Base de datos
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true);
    }
}

