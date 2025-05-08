package Interfaz;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_CRUD {
    public Interfaz_CRUD() {
    }
    public void Inicializar_CRUD(int opcion){
        Toolkit t = Toolkit.getDefaultToolkit();
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame=new JFrame("Seleccion tabla a ver");
        frame.setSize(ancho/6,alto/4);
        frame.setLayout(new GridLayout(2,2));
        frame.setLocationRelativeTo(null);
        JButton insertar =new JButton("Insertar");
        JButton borrar =new JButton("Borrar");
        JButton modificar=new JButton("Modificar");
        JButton ver=new JButton("Ver");
        frame.add(insertar);
        frame.add(borrar);
        frame.add(modificar);
        frame.add(ver);
        frame.setVisible(true);
        insertar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {

                } else if (opcion==2) {

                } else if (opcion==3) {

                } else if (opcion==4) {

                }
            }
        });
        borrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {

                } else if (opcion==2) {

                } else if (opcion==3) {

                } else if (opcion==4) {

                }
            }
        });
        modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {

                } else if (opcion==2) {

                } else if (opcion==3) {

                } else if (opcion==4) {

                }
            }
        });
        ver.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {

                } else if (opcion==2) {

                } else if (opcion==3) {

                } else if (opcion==4) {

                }
            }
        });
    }
}

