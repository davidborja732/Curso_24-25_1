package Vista.Ver;

import Controlador.Controlador_Juega.Eliminar; // Se mantiene para cargar los datos

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Juega {
    private Eliminar eliminar; // Instancia de la clase que carga los datos
    private JFrame frame;
    private JTable tablaEquipos;
    private DefaultTableModel modeloTabla;
    public VR_Juega() {
        eliminar = new Eliminar();

    }

    public void Iniciar_Vista() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        frame = new JFrame("Ver equipos de partido");
        frame.setSize(ancho/4,alto/2);
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Crear la tabla y su modelo
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre Equipo");
        modeloTabla.addColumn("Partido");
        modeloTabla.addColumn("Rol");

        tablaEquipos = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
        frame.add(scrollPane, BorderLayout.CENTER);

        // Llamar a cargarDatos() para poblar el JTable con los datos de la BD
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true);
    }
}

