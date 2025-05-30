package Vista.Equipo;

import Controlador.Controlador_Equipos.CO_Equipos;
import Modelo.Equipo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class IN_Equipo {
    private static String mensaje_confirmacion;
    CO_Equipos coEquipos; // Instancia de la clase CO_Equipos

    public IN_Equipo() {
        // Inicializar la instancia de CO_Equipos
    }

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public void Iniciar_insercion() {
        coEquipos = new CO_Equipos();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Insertar equipo");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(5, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JComboBox<String> DNI_entrenador = new JComboBox<>();
        JTextField Estadio = new JTextField();
        JTextField N_trofeos = new JTextField();
        N_trofeos.setText("0");
        JTextField Nombre_equipo = new JTextField();
        JButton boton_anadir = new JButton("Añadir");
        JButton boton_Cancelar = new JButton("Cancelar");

        frame.add(new JLabel("Nombre equipo "));
        frame.add(Nombre_equipo);
        frame.add(new JLabel("Número trofeos (Palmarés)"));
        frame.add(N_trofeos);
        frame.add(new JLabel("Estadio "));
        frame.add(Estadio);
        frame.add(new JLabel("Entrenador "));
        frame.add(DNI_entrenador);
        frame.add(boton_anadir);
        frame.add(boton_Cancelar);

        // Cargar datos en el JComboBox con los entrenadores disponibles
        List<String> entrenadores = coEquipos.obtenerEntrenadores();
        for (String entrenador : entrenadores) {
            DNI_entrenador.addItem(entrenador);
        }

        frame.setVisible(true);

        boton_anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nombreEquipo = Nombre_equipo.getText().trim();
                String estadio = Estadio.getText().trim();
                String nTrofeos = N_trofeos.getText().trim();
                String seleccionado = (String) DNI_entrenador.getSelectedItem();

                if (nombreEquipo.isEmpty() || estadio.isEmpty() || nTrofeos.isEmpty() || seleccionado == null || seleccionado.isEmpty()) {
                    JOptionPane.showMessageDialog(frame, "Todos los campos deben estar completos.");
                } else if (!nTrofeos.matches("\\d+")) {
                    JOptionPane.showMessageDialog(frame, "El número de trofeos debe ser un valor numérico válido.");
                } else if (nombreEquipo.endsWith(" ") || estadio.endsWith(" ")) {
                    JOptionPane.showMessageDialog(frame, "El nombre del equipo o el estadio no deben tener espacios al final.");
                } else if (nombreEquipo.length() > 50 || estadio.length() > 50) {
                    JOptionPane.showMessageDialog(frame, "El nombre del equipo o el estadio no pueden tener más de 50 caracteres.");
                } else {
                    // Verificar si el equipo ya existe en la base de datos
                    if (coEquipos.existeEquipo(nombreEquipo)) {
                        JOptionPane.showMessageDialog(frame, "Dos equipos no pueden tener el mismo nombre.");
                    } else {
                        String[] nombreApellido = seleccionado.split(" ");
                        System.out.println(nombreApellido[0]);
                        int trofeos = Integer.parseInt(nTrofeos);

                        Equipo equipo = new Equipo(nombreApellido[0].trim(), estadio, trofeos, nombreEquipo);
                        System.out.println(equipo.getDni_Entrenador());
                        coEquipos.anadirEquipo(equipo);

                        JOptionPane.showMessageDialog(frame, mensaje_confirmacion);

                        DNI_entrenador.removeAllItems();
                        List<String> entrenadores = coEquipos.obtenerEntrenadores();
                        for (String entrenador : entrenadores) {
                            DNI_entrenador.addItem(entrenador);
                        }
                    }
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



