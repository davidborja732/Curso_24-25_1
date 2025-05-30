package Vista.Informe;

import Controlador.Controlador_Informe.CO_Informe;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Informe {
    CO_Informe coInforme;

    public VR_Informe() {}

    public void Iniciar_Vista() {
        coInforme = new CO_Informe();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Ver informes");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        DefaultTableModel modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre Árbitro");
        modeloTabla.addColumn("N_Rojas");
        modeloTabla.addColumn("N_Amarillas");
        modeloTabla.addColumn("Local");
        modeloTabla.addColumn("Visitante");

        JTable tablaInformes = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaInformes);
        frame.add(scrollPane, BorderLayout.CENTER);

        coInforme.cargarDatos(modeloTabla); // ✅ Cargar datos en la tabla

        frame.setVisible(true);
    }
}



