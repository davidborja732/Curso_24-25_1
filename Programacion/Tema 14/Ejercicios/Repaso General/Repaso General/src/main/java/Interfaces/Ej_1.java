package Interfaces;

import javax.swing.*;

public class Ej_1 {
    public static void main(String[] args) {
        JFrame frame=new JFrame("Ejercicio 1");
        frame.setSize(200,100);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        JLabel jLabel=new JLabel("Hola mundo");
        frame.add(jLabel);
        frame.setVisible(true);
    }
}
