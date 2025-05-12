package Vista.Borrar;

import Controlador.Controlador_Juega.Eliminar;
import Modelo.Juega;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Juega {
    private Eliminar eliminar; // Instancia de la clase Eliminar
    private JFrame frame;
    private JTable tablaEquipos;
    private DefaultTableModel modeloTabla;

    public BO_Juega() {
        eliminar = new Eliminar();
    }

    public void Iniciar_Borrado() {
        frame = new JFrame("Eliminar equipo de partido");
        frame.setSize(500, 300);
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Crear la tabla y su modelo
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID Equipo");
        modeloTabla.addColumn("Partido");
        modeloTabla.addColumn("Rol");

        tablaEquipos = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
        frame.add(scrollPane, BorderLayout.CENTER);

        JButton botonBorrar = new JButton("Borrar");
        JPanel panelBotones = new JPanel();
        panelBotones.add(botonBorrar);
        frame.add(panelBotones, BorderLayout.SOUTH);

        // Llamar a cargarDatos() para poblar el JTable con los datos de la BD
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true);

        botonBorrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int filaSeleccionada = tablaEquipos.getSelectedRow();
                if (filaSeleccionada != -1) {
                    int idEquipo = (int) modeloTabla.getValueAt(filaSeleccionada, 0);
                    int idPartido = (int) modeloTabla.getValueAt(filaSeleccionada, 1);
                    String rol = (String) modeloTabla.getValueAt(filaSeleccionada, 2);

                    Juega juega = new Juega(idEquipo, idPartido, rol);
                    eliminar.Eliminar_juega(juega, frame, modeloTabla);
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un equipo para borrar.");
                }
            }
        });
    }
}

