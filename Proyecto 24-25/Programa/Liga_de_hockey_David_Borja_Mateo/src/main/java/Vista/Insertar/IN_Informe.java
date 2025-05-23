package Vista.Insertar;

import Controlador.Conexion;
import Controlador.Controlador_Informe.Anadir;
import Modelo.Informe;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class IN_informe {
    private static String mensaje_confirmacion;
    Anadir anadir;
    JTextPane ID_arbitro;

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public IN_informe() {
    }

    public void Iniciar_insercion() {
        anadir = new Anadir();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Conexion conexion = new Conexion();
        JFrame frame;
        frame = new JFrame("Insertar informe");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(5, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JComboBox<String> ID_partido = new JComboBox<>();
        ID_arbitro = new JTextPane();
        ID_arbitro.setEditable(false); // Hacer que el usuario no pueda editarlo

        JTextField N_Rojas = new JTextField();
        JTextField N_Amarillas = new JTextField();
        JButton boton_anadir = new JButton("Añadir");
        JButton boton_Cancelar = new JButton("Cancelar");

        frame.add(new JLabel("Partido "));
        frame.add(ID_partido);
        frame.add(new JLabel("Árbitro "));
        frame.add(ID_arbitro);
        frame.add(new JLabel("Número de tarjetas rojas"));
        frame.add(N_Rojas);
        frame.add(new JLabel("Número de tarjetas amarillas"));
        frame.add(N_Amarillas);
        frame.add(boton_anadir);
        frame.add(boton_Cancelar);

        // Cargar datos en el JComboBox de partidos
        List<String> partidos = anadir.obtenerPartidos();
        for (String partido : partidos) {
            ID_partido.addItem(partido); // Añadir partido
        }

        frame.setVisible(true);

        // Cuando el usuario seleccione un partido, actualizar automáticamente el árbitro correspondiente
        ID_partido.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String partidoSeleccionado = (String) ID_partido.getSelectedItem();
                int idPartido = anadir.obtenerIDPartido(partidoSeleccionado);
                String arbitroNombre = anadir.obtenerNombreArbitroPorPartido(idPartido);
                ID_arbitro.setText(arbitroNombre); // Mostrar el árbitro sin permitir edición
            }
        });

        boton_anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String partidoSeleccionado = (String) ID_partido.getSelectedItem();
                int idPartido = anadir.obtenerIDPartido(partidoSeleccionado);
                int idArbitro = anadir.obtenerIDArbitro(ID_arbitro.getText());
                System.out.println(ID_arbitro.getText());
                System.out.println(idArbitro);
                // Eliminar espacios y verificar que son números
                String rojasStr = N_Rojas.getText().trim();
                String amarillasStr = N_Amarillas.getText().trim();

                if (!rojasStr.matches("\\d+") || !amarillasStr.matches("\\d+")) {
                    JOptionPane.showMessageDialog(frame, "Los valores de tarjetas deben ser números enteros.");
                    return;
                }

                int nRojas = Integer.parseInt(rojasStr);
                int nAmarillas = Integer.parseInt(amarillasStr);

                Informe informe = new Informe(idPartido, idArbitro, nRojas, nAmarillas);
                anadir.anadirInforme(informe);
                JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
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
