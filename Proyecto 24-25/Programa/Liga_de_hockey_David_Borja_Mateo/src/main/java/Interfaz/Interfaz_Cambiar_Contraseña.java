package Interfaz;

import Conexiones.Conexion;

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
        Interfaz_login interfazLogin=new Interfaz_login();
        Conexion conexion=new Conexion();
        Toolkit t = Toolkit.getDefaultToolkit();
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame=new JFrame("Cambiar contraseña");
        frame.setSize(ancho/4,alto/4);
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
                try {
                    ResultSet resultSet= conexion.resultSet("SELECT contraseña FROM usuario");
                    while (resultSet.next()){
                        String contraseña_base= resultSet.getString("contraseña");
                        if (Contrasena_Actual.getText().isBlank() || Contrasena_Nueva.getText().isBlank()){
                            JOptionPane.showMessageDialog(frame, "Hay un campo vacio");
                            break;
                        } else if (contraseña_base.equals(Contrasena_Actual.getText())){
                            if (contraseña_base.equals(Contrasena_Nueva.getText())){
                                JOptionPane.showMessageDialog(frame, "No puedes cambiar la contraseña por la misma");
                                break;
                            }else {
                                PreparedStatement preparedStatement = conexion.prepared("UPDATE usuario SET contraseña=? WHERE usuario='Admin'");
                                preparedStatement.setString(1, Contrasena_Nueva.getText());
                                int filas = preparedStatement.executeUpdate();
                                if (filas > 0) {
                                    JOptionPane.showMessageDialog(frame, "Contraseña cambiada correctamanete");
                                    frame.dispose();
                                    interfazLogin.Inicializar_Login();
                                    break;
                                }
                            }
                        } else {
                            JOptionPane.showMessageDialog(frame, "Algo ha fallado");
                        }
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
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
