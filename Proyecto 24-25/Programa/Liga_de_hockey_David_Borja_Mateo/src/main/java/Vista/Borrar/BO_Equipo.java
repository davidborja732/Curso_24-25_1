package Vista.Borrar;

import Controlador.Controlador_Equipos.CO_Equipos;
import Modelo.Equipo;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Equipo {
    private static String mensaje_confirmacion; // Variable para almacenar el mensaje de confirmación
    CO_Equipos coEquipos; // Instancia de la clase CO_Equipos

    public BO_Equipo() {
        // Inicializar la instancia de CO_Equipos
    }

    // Método para establecer el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Método para iniciar el proceso de borrado
    public void Iniciar_Borrado() {
        coEquipos = new CO_Equipos();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Eliminar equipo");
        frame.setSize(ancho / 4, alto / 2);
        JTable tablaEquipos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Creación de la tabla con las columnas correspondientes
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre");
        modeloTabla.addColumn("N_Titulos");
        modeloTabla.addColumn("Estadio");
        modeloTabla.addColumn("DNI_entrenador");

        tablaEquipos = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaEquipos);
        frame.add(scrollPane, BorderLayout.CENTER);

        JButton botonBorrar = new JButton("Borrar");
        JPanel panelBotones = new JPanel();
        panelBotones.add(botonBorrar);
        frame.add(panelBotones, BorderLayout.SOUTH);

        // Cargar los datos en la tabla desde la base de datos
        coEquipos.cargarDatos(modeloTabla);

        frame.setVisible(true);

        botonBorrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int filaSeleccionada = tablaEquipos.getSelectedRow();
                if (filaSeleccionada != -1) {
                    String nombre_Equipo = modeloTabla.getValueAt(filaSeleccionada, 0).toString();
                    System.out.println(nombre_Equipo);
                    System.out.println(coEquipos.obtenerIDEquipo(nombre_Equipo));
                    // Mostrar mensaje de confirmación antes de eliminar
                    int opcion = JOptionPane.showConfirmDialog(frame, "¿Seguro que deseas eliminar este equipo?", "Confirmar eliminación", JOptionPane.YES_NO_OPTION);

                    if (opcion == JOptionPane.YES_OPTION) {
                        coEquipos.eliminarEquipo(coEquipos.obtenerIDEquipo(nombre_Equipo), modeloTabla);
                        JOptionPane.showMessageDialog(frame, "Equipo Borrado"); // Mensaje de éxito
                    } else {
                        JOptionPane.showMessageDialog(frame, "Borrado cancelado"); // Mensaje de cancelación
                    }
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un dato para borrar.");
                }
            }
        });
    }
}

