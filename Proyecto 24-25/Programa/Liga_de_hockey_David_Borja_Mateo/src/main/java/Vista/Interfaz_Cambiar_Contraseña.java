package Vista;

import Controlador.Conexion;
import Controlador.Controlador_Cambio_Contraseña.Cambio_Contraseña;
import Controlador.Obtener_resolucion;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Interfaz_Cambiar_Contraseña {
    public Interfaz_Cambiar_Contraseña() {
    }
    public void Inicializar_Cambio(){
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Interfaz_login interfazLogin=new Interfaz_login();
        Conexion conexion=new Conexion();
        JFrame frame;
        frame=new JFrame("Cambiar contraseña");
        frame.setSize(ancho/4,alto/2);
        frame.setLayout(new GridLayout(3,2));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        JTextField Contrasena_Nueva=new JTextField();
        JPasswordField Contrasena_Actual=new JPasswordField();
        JButton boton_Cambiar_Contrasena=new JButton("Cambiar Contraseña");
        JButton boton_Cancelar=new JButton("Cancelar Cambio");
        frame.add(new JLabel("Contraseña actual ="));
        frame.add(Contrasena_Actual);
        frame.add(new JLabel("Contraseña nueva="));
        frame.add(Contrasena_Nueva);
        frame.add(boton_Cambiar_Contrasena);
        frame.add(boton_Cancelar);
        boton_Cambiar_Contrasena.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Cambio_Contraseña cambioContraseña=new Cambio_Contraseña();
                cambioContraseña.Inicializar_cambio(Contrasena_Actual.getText(),Contrasena_Nueva.getText(),frame);
            }
        });
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                interfazLogin.Inicializar_Login();
            }
        });
        frame.setVisible(true);
    }
}
