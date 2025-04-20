package Interfaz;

import Conexiones.Conexion;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Interfaz_login {
    public Interfaz_login() {
    }

    public void Inicializar_Login(){
        Conexion conexion=new Conexion();
        Toolkit t = Toolkit.getDefaultToolkit();
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame=new JFrame("Liga De Hockey");
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
        JFrame finalFrame = frame;
        boton_Iniciar_Sesion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ResultSet resultSet= conexion.resultSet("SELECT * FROM usuario");
                try {
                    while (resultSet.next()){
                        String usuario_base= resultSet.getString("usuario");
                        String contraseña_base= resultSet.getString("contraseña");
                        if (usuario_base.equals(usuario.getText()) && contraseña_base.equals(contrasena.getText())){
                            JOptionPane.showMessageDialog(frame, "Registro correcto");
                        }
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
    }
}
