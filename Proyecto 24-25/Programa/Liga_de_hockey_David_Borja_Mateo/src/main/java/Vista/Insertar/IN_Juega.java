package Vista.Insertar;

import Controlador.Controlador_Juega.Anadir;
import Controlador.Obtener_resolucion;
import Modelo.Juega;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class IN_Juega {
    private static String mensaje_confirmacion;
    public void recogermensaje(String mensaje){
        mensaje_confirmacion=mensaje;
    }
    public IN_Juega() {

    }
    public void Iniciar_insercion() {
        Anadir anadir = new Anadir(); // Instancia de la clase Anadir
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Asignar equipo a partido");
        frame.setSize(ancho/4, alto/2);
        frame.setLayout(new GridLayout(4, 2));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JComboBox<Integer> equipos = new JComboBox<>();
        JComboBox<Integer> partidos = new JComboBox<>();
        JComboBox<String> Rol = new JComboBox<>();
        JButton boton_Anadir = new JButton("Añadir");
        JButton boton_Cancelar = new JButton("Cancelar");

        frame.add(new JLabel("ID_eq "));
        frame.add(equipos);
        frame.add(new JLabel("Partido"));
        frame.add(partidos);
        frame.add(new JLabel("Rol "));
        frame.add(Rol);


        try {
            for (int id : anadir.obtenerEquipos()) {
                equipos.addItem(id);
            }
            for (int id : anadir.obtenerPartidos()) {
                partidos.addItem(id);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        Rol.addItem("Local");
        Rol.addItem("Visitante");

        frame.add(boton_Anadir);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        boton_Anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Juega juega = new Juega(Integer.parseInt(String.valueOf(equipos.getSelectedItem())), Integer.parseInt(String.valueOf(partidos.getSelectedItem())), String.valueOf(Rol.getSelectedItem()));
                anadir.Anadir_juega(juega);
                JOptionPane.showMessageDialog(frame,mensaje_confirmacion);
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
