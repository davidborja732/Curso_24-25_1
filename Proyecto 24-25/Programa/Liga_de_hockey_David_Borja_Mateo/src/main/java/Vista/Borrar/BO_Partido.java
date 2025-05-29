package Vista.Borrar;

import Controlador.Controlador_Partidos.CO_Partidos; // Usamos CO_Partidos en lugar de Eliminar
import Modelo.Partidos;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class BO_Partido {
    private static String mensaje_confirmacion;
    private CO_Partidos coPartidos; // Ahora utilizamos CO_Partidos

    public BO_Partido() {
        coPartidos = new CO_Partidos(); // Inicializamos la instancia
    }

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Eliminar partido");
        frame.setSize(ancho / 4, alto / 2);
        JTable tablaPartidos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        // Creación de la tabla con columnas correctas
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Fecha");
        modeloTabla.addColumn("Equipo Local");
        modeloTabla.addColumn("Equipo Visitante");
        modeloTabla.addColumn("Ganador");
        modeloTabla.addColumn("Árbitro");

        tablaPartidos = new JTable(modeloTabla);
        JScrollPane scrollPane = new JScrollPane(tablaPartidos);
        frame.add(scrollPane, BorderLayout.CENTER);

        JButton botonBorrar = new JButton("Borrar");
        JPanel panelBotones = new JPanel();
        panelBotones.add(botonBorrar);
        frame.add(panelBotones, BorderLayout.SOUTH);

        // Cargar datos iniciales en la tabla
        cargarTabla(modeloTabla);

        frame.setVisible(true);

        // Acción para eliminar un partido y recargar la tabla
        botonBorrar.addActionListener(e -> {
            int filaSeleccionada = tablaPartidos.getSelectedRow();
            if (filaSeleccionada != -1) {
                int idPartido = coPartidos.obtenerIdPartido(modeloTabla.getValueAt(filaSeleccionada, 1).toString(),modeloTabla.getValueAt(filaSeleccionada, 2).toString());

                // Mostrar mensaje de confirmación antes de eliminar
                int opcion = JOptionPane.showConfirmDialog(frame, "¿Seguro que deseas eliminar este partido?", "Confirmar eliminación", JOptionPane.YES_NO_OPTION);

                if (opcion == JOptionPane.YES_OPTION) {
                    coPartidos.eliminarPartido(idPartido);
                    JOptionPane.showMessageDialog(frame, "Partido Borrado");

                    // Recargar la tabla después de eliminar
                    cargarTabla(modeloTabla);
                } else {
                    JOptionPane.showMessageDialog(frame, "Borrado cancelado");
                }
            } else {
                JOptionPane.showMessageDialog(frame, "Seleccione un partido para borrar.");
            }
        });
    }

    private void cargarTabla(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); // Limpiar tabla antes de actualizar
        coPartidos.cargarDatos(modeloTabla);

        // Verifica si la columna "Ganador" está vacía y asigna "Pendiente"
        for (int i = 0; i < modeloTabla.getRowCount(); i++) {
            Object valorGanador = modeloTabla.getValueAt(i, 4);
            if (valorGanador == null || valorGanador.toString().trim().isEmpty()) {
                modeloTabla.setValueAt("Pendiente", i, 4);
            }
        }
    }
}





