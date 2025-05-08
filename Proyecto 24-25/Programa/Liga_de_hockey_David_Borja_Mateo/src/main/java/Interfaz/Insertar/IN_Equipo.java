package Interfaz.Insertar;

import Conexiones.Conexion;


import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IN_Equipo {
    public IN_Equipo() {
    }
    public void Iniciar_insercion(){
        Conexion conexion=new Conexion();
        Toolkit t = Toolkit.getDefaultToolkit();
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame=new JFrame("Cambiar contraseña");
        frame.setSize(ancho/4,alto/4);
        frame.setLayout(new GridLayout(5,2));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        JTextField DNI_entrenador=new JTextField();
        JTextField Estadio=new JTextField();
        JTextField N_trofeos=new JTextField();
        JTextField Nombre_equipo=new JTextField();
        JButton boton_Modificar =new JButton("Modificar");
        JButton boton_Cancelar=new JButton("Cancelar");
        frame.add(new JLabel("Nombre equipo "));
        frame.add(Nombre_equipo);
        frame.add(new JLabel("Numero trofeos (Palmares)"));
        frame.add(N_trofeos);
        frame.add(new JLabel("Estadio "));
        frame.add(Estadio);
        frame.add(new JLabel("Entrenador "));
        frame.add(DNI_entrenador);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true);
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
    }
}
