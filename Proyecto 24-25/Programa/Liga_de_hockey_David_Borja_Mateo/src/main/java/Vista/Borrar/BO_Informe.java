package Vista.Borrar;

import Controlador.Controlador_Informe.Eliminar;
import Modelo.Informe;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Informe {
    Eliminar eliminar;
    private static String mensaje_confirmacion;

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public BO_Informe() {

    }

    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Eliminar eliminar = new Eliminar();
        JFrame frame;
        frame = new JFrame("Eliminar informe");
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

        JButton botonBorrar = new JButton("Borrar");
        JPanel panelBotones = new JPanel();
        panelBotones.add(botonBorrar);
        frame.add(panelBotones, BorderLayout.SOUTH);

        // Llamo a cargarDatos() para rellenar el JTable con los datos de la Base de datos
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true);
        botonBorrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int filaSeleccionada = tablaInformes.getSelectedRow();
                if (filaSeleccionada != -1) {
                    int idInforme = (int) modeloTabla.getValueAt(filaSeleccionada, 0);
                    Informe informe = new Informe(idInforme);
                    eliminar.eliminarInforme(informe, modeloTabla);
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);

                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un informe para borrar.");
                }
            }
        });
    }
}

