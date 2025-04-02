package Interfaces;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Ej_2 {
    public static void main(String[] args) {
        JFrame frame=new JFrame("Ejercicio 2");
        frame.setSize(300,200);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLayout(new GridLayout(3,2));
        JTextField usuario=new JTextField();
        JPasswordField contrasena=new JPasswordField();
        JButton boton=new JButton("Iniciar Sesion");
        frame.add(new JLabel("Usuario ="));
        frame.add(usuario);
        frame.add(new JLabel("Contraseña ="));
        frame.add(contrasena);
        frame.add(boton);
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (usuario.getText().toLowerCase().equals("admin") && contrasena.getText().equals("1234")){
                    JOptionPane.showMessageDialog(frame, "Registro correcto");
                }else {
                    JOptionPane.showMessageDialog(frame, "ERROR 404");
                }
            }
        });

        frame.setVisible(true);



    }

}
