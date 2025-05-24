package Vista.Modificar;

import Controlador.Controlador_Informe.Modificar;
import Modelo.Informe;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MO_Informe {
    private JFrame frame;
    private Modificar modificar;
    private static String mensaje_confirmacion;

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public MO_Informe() {
    }

    public void Iniciar_Modificacion() {
        modificar = new Modificar();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        frame = new JFrame("Modificar informe");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(5, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JComboBox<Integer> informes = new JComboBox<>();
        JTextField N_Rojas = new JTextField();
        JTextField N_Amarillas = new JTextField();
        JTextPane ID_arbitro = new JTextPane();
        ID_arbitro.setEditable(false); // Campo no editable por el usuario

        JButton boton_Modificar = new JButton("Modificar");
        JButton boton_Cancelar = new JButton("Cancelar");

        frame.add(new JLabel("Seleccione informe"));
        frame.add(informes);
        frame.add(new JLabel("Árbitro"));
        frame.add(ID_arbitro);
        frame.add(new JLabel("Número de tarjetas rojas"));
        frame.add(N_Rojas);
        frame.add(new JLabel("Número de tarjetas amarillas"));
        frame.add(N_Amarillas);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        // Cargar informes en el JComboBox
        try {
            for (int id_informe : modificar.obtenerInformes()) {
                informes.addItem(id_informe);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        // Acción para actualizar automáticamente el árbitro cuando se seleccione un informe
        informes.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int informeSeleccionado = (int) informes.getSelectedItem();
                String arbitroNombre = modificar.obtenerNombreArbitroPorInforme(informeSeleccionado);
                ID_arbitro.setText(arbitroNombre); // Mostrar árbitro sin permitir edición
            }
        });

        // Acción al presionar "Modificar"
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (informes.getSelectedItem() != null) {
                    int informeSeleccionado = (int) informes.getSelectedItem();

                    // Eliminar espacios y verificar que son números
                    String rojasStr = N_Rojas.getText().trim();
                    String amarillasStr = N_Amarillas.getText().trim();

                    if (!rojasStr.matches("\\d+") || !amarillasStr.matches("\\d+")) {
                        JOptionPane.showMessageDialog(frame, "Los valores de tarjetas deben ser números enteros.");
                        return;
                    }

                    int nRojas = Integer.parseInt(rojasStr);
                    int nAmarillas = Integer.parseInt(amarillasStr);

                    Informe informe = new Informe(informeSeleccionado,nRojas, nAmarillas);
                    modificar.modificarInforme(informe);

                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                    frame.dispose();
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un informe para modificar.");
                }
            }
        });

        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
            }
        });
    }
}

