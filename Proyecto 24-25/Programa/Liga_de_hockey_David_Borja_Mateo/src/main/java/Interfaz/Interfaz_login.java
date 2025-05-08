package Interfaz;

import Conexiones.Conexion;
import Conexiones.Ficheros;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class Interfaz_login {
    public Interfaz_login() {
    }

    public void Inicializar_Login(){
        Conexion conexion=new Conexion();
        Ficheros ficheros=new Ficheros();
        Interfaz_Seleccion_Tablas interfazSeleccionTablas=new Interfaz_Seleccion_Tablas();
        Interfaz_Arbitros interfazArbitros=new Interfaz_Arbitros();
        Toolkit t = Toolkit.getDefaultToolkit();
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame=new JFrame("Login Programa");
        frame.setSize(ancho/4,alto/4);
        frame.setLayout(new GridLayout(3,2));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        JTextField usuario=new JTextField();
        JPasswordField contrasena=new JPasswordField();
        JButton boton_Iniciar_Sesion=new JButton("Iniciar Sesion");
        JButton boton_Cambiar_Contraseña=new JButton("Cambiar Contraseña");
        frame.add(new JLabel("Usuario ="));
        frame.add(usuario);
        frame.add(new JLabel("Contraseña ="));
        frame.add(contrasena);
        frame.add(boton_Iniciar_Sesion);
        frame.add(boton_Cambiar_Contraseña);
        frame.setVisible(true);
        boton_Iniciar_Sesion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ResultSet resultSet= conexion.resultSet("SELECT * FROM usuario");
                Boolean registrado_correctamente = null;
                try {
                    while (resultSet.next()){
                        String usuario_base= resultSet.getString("usuario");
                        String contraseña_base= resultSet.getString("contraseña");
                        if (usuario_base.equals(usuario.getText()) && contraseña_base.equals(contrasena.getText())){
                            JOptionPane.showMessageDialog(frame, "Registro correcto");
                            if (usuario.getText().equals("Arbitro")){
                                ficheros.escritura(new File("Ficheros/log.txt"),"Registro Arbitro "+ LocalDateTime.now());
                                frame.dispose();
                                interfazArbitros.Inicializar_Interfaz_Arbitro();
                            } else if (usuario.getText().equals("Admin")) {
                                ficheros.escritura(new File("Ficheros/log.txt"),"Registro Administrador "+ LocalDateTime.now());
                                frame.dispose();
                                interfazSeleccionTablas.Inicializar_Seleccion();
                            }
                            registrado_correctamente =true;
                            break;
                        }else{
                            registrado_correctamente =false;
                        }
                    }
                    if (!registrado_correctamente){
                        JOptionPane.showMessageDialog(frame, "Contraseña o usuario incorrectos");
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
        boton_Cambiar_Contraseña.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Interfaz_Cambiar_Contraseña interfazCambiarContraseña=new Interfaz_Cambiar_Contraseña();
                frame.dispose();
                interfazCambiarContraseña.Inicializar_Cambio();
            }
        });
    }
}
