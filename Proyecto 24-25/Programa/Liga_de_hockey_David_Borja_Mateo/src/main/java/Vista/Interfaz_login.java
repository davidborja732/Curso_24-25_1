package Vista;

import Controlador.Conexion;
import Controlador.Controlador_Login.Revisar_Contraseña;
import Controlador.Ficheros;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_login {
    public Interfaz_login() {
    }

    public void Inicializar_Login(){
        Conexion conexion = new Conexion();
        Ficheros ficheros = new Ficheros();
        Interfaz_Seleccion_Tablas interfazSeleccionTablas = new Interfaz_Seleccion_Tablas();
        Interfaz_Arbitros interfazArbitros = new Interfaz_Arbitros();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Login Programa");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(3, 2));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        // ComboBox para selección de usuario
        String[] opcionesUsuario = {"Admin", "Arbitro"};
        JComboBox<String> usuario = new JComboBox<>(opcionesUsuario);
        JPasswordField contrasena = new JPasswordField();
        JButton boton_Iniciar_Sesion = new JButton("Iniciar Sesión");
        JButton boton_Cambiar_Contraseña = new JButton("Cambiar Contraseña");
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
                Revisar_Contraseña revisarContraseña = new Revisar_Contraseña();
                revisarContraseña.Inicializar_Revision(String.valueOf(usuario.getSelectedItem()),contrasena.getText(),frame);
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
