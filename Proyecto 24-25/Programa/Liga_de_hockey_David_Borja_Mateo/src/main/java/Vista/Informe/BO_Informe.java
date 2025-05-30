package Vista.Informe;

import Controlador.Controlador_Informe.CO_Informe;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class BO_Informe {
    private static String mensaje_confirmacion;
    CO_Informe coInforme;

    public BO_Informe() {
    }

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public void Iniciar_Borrado() {
        coInforme = new CO_Informe();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Eliminar informe");
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

        JButton botonBorrar = new JButton("Borrar");
        JPanel panelBotones = new JPanel();
        panelBotones.add(botonBorrar);
        frame.add(panelBotones, BorderLayout.SOUTH);

        coInforme.cargarDatos(modeloTabla); // ✅ Cargar datos en la tabla

        frame.setVisible(true);

        // Acción para borrar un informe con confirmación
        botonBorrar.addActionListener(e -> {
            int filaSeleccionada = tablaInformes.getSelectedRow();

            if (filaSeleccionada != -1) {
                String equipoLocal = (String) tablaInformes.getValueAt(filaSeleccionada, 3);
                String equipoVisitante = (String) tablaInformes.getValueAt(filaSeleccionada, 4);

                int idInforme = coInforme.obtenerIdInforme(equipoLocal, equipoVisitante);

                if (idInforme != -1) {
                    int confirmacion = JOptionPane.showConfirmDialog(
                            frame,
                            "¿Estás seguro de que quieres eliminar este informe?",
                            "Confirmación",
                            JOptionPane.YES_NO_OPTION
                    );

                    if (confirmacion == JOptionPane.YES_OPTION) {
                        coInforme.eliminarInforme(idInforme, modeloTabla);
                        JOptionPane.showMessageDialog(frame, "Eliminado correctamente.");
                        coInforme.cargarDatos(modeloTabla);
                    } else {
                        JOptionPane.showMessageDialog(frame, "Eliminación cancelada.");
                    }
                } else {
                    JOptionPane.showMessageDialog(frame, "Error: No se encontró el informe.");
                }
            } else {
                JOptionPane.showMessageDialog(frame, "Seleccione un informe para borrar.");
            }
        });
    }
}





