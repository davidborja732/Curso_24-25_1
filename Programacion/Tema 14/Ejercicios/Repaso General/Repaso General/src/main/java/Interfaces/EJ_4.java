package Interfaces;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class EJ_4 {
    private static final String URL="jdbc:mysql://localhost:3306/EJ4";
    private static final String USUARIO="root";
    private static final String CONTRASENA="1234";
    public static void main(String[] args) {
        JFrame frame=new JFrame("Ejercicio 4");
        frame.setSize(400,250);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLayout(new GridLayout(3,2));
        JTextField usuario=new JTextField();
        JTextField correo=new JTextField();
        JButton boton=new JButton("Insertar");
        frame.add(new JLabel("Nombre"));
        frame.add(usuario);
        frame.add(new JLabel("Correo electronico"));
        frame.add(correo);
        frame.add(boton);
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try(Connection connection= DriverManager.getConnection(URL,USUARIO,CONTRASENA)) {
                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO usuarios VALUES (?,?)");
                    preparedStatement.setString(1,usuario.getText());
                    preparedStatement.setString(2,correo.getText());
                    int filas=preparedStatement.executeUpdate();
                    if (filas>0){
                        JOptionPane.showMessageDialog(frame, "Usuario Añadido");
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
        frame.setVisible(true);
    }
}
