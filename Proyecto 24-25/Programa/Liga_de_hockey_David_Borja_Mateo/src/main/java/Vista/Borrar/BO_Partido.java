package Vista.Borrar;

import Controlador.Controlador_Partidos.Eliminar;
import Modelo.Partidos;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Partido {
    Eliminar eliminar;
    private static String mensaje_confirmacion;

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public BO_Partido() {

    }

    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Eliminar eliminar = new Eliminar();
        JFrame frame;
        frame = new JFrame("Eliminar partido");
        frame.setSize(ancho / 4, alto / 2);
        JTable tablaPartidos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Creo la tabla con las columnas que va a tener
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_partido");
        modeloTabla.addColumn("Ganador");
        modeloTabla.addColumn("Fecha");

        tablaPartidos = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaPartidos);
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
                int filaSeleccionada = tablaPartidos.getSelectedRow();
                if (filaSeleccionada != -1) {
                    int idPartido = (int) modeloTabla.getValueAt(filaSeleccionada, 0);
                    Partidos partido = new Partidos(idPartido);
                    eliminar.eliminarPartido(partido, modeloTabla);
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);

                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un partido para borrar.");
                }
            }
        });
    }
}

