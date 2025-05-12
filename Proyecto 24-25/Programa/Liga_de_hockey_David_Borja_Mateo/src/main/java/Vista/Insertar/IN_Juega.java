package Vista.Insertar;

import Controlador.Controlador_Juega.Anadir;
import Controlador.Conexion;
import Modelo.Juega;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IN_Juega {
    public IN_Juega() {
    }
    public void Iniciar_insercion() {
        Conexion conexion = new Conexion();
        Anadir anadir = new Anadir(); // Instancia de la clase Anadir
        JFrame frame = new JFrame("Asignar equipo a partido");
        frame.setSize(400, 250);
        frame.setLayout(new GridLayout(4, 2));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JComboBox<Integer> equipos = new JComboBox<>();
        JComboBox<Integer> partidos = new JComboBox<>();
        JComboBox<String> Rol = new JComboBox<>();
        JButton boton_Añadir = new JButton("Añadir");
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

        frame.add(boton_Añadir);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        boton_Añadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Juega juega = new Juega(Integer.valueOf(equipos.getSelectedItem().toString()), Integer.valueOf(partidos.getSelectedItem().toString()), String.valueOf(Rol.getSelectedItem()));
                anadir.Anadir_juega(juega,frame);
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
