package Interfaces;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Ej_3 {
    public static void main(String[] args) {
        JFrame frame=new JFrame("Ejercicio 3");
        frame.setSize(200,100);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLayout(new GridLayout(2,1));
        JTextField usuario=new JTextField();
        JButton boton=new JButton("Saludar");
        frame.add(new JLabel("Nombre"));
        frame.add(usuario);
        frame.add(boton);
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(frame, "Hola "+usuario.getText());
            }
        });
        frame.setVisible(true);
    }
}
