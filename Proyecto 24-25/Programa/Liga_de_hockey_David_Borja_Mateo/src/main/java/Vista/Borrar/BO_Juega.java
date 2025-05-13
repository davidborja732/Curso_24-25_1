package Vista.Borrar;

import Controlador.Controlador_Juega.Eliminar;
import Modelo.Juega;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Juega {
    Eliminar eliminar;
    private static String mensaje_confirmacion;

    public void recogermensaje(String mensaje){
        mensaje_confirmacion=mensaje;
    }
    public BO_Juega() {

    }

    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Eliminar eliminar=new Eliminar();
        JFrame frame;
        frame = new JFrame("Eliminar equipo de partido");
        frame.setSize(ancho/4, alto/2);
        JTable tablaEquipos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Creo la tabla con las columnas que va a tener
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre equipo");
        modeloTabla.addColumn("Partido");
        modeloTabla.addColumn("Rol");

        tablaEquipos = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
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
                int filaSeleccionada = tablaEquipos.getSelectedRow();
                if (filaSeleccionada != -1) {
                    String Nombre = modeloTabla.getValueAt(filaSeleccionada, 0).toString();
                    int idPartido = (int) modeloTabla.getValueAt(filaSeleccionada, 1);
                    String rol = (String) modeloTabla.getValueAt(filaSeleccionada, 2);
                    Juega juega = new Juega(eliminar.obtener_ID_equipo(Nombre), idPartido, rol);
                    eliminar.Eliminar_juega(juega, modeloTabla);
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);

                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un dato para borrar.");
                }
            }
        });
    }
}

