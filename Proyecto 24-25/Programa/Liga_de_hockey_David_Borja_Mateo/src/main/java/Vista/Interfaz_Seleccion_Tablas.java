package Vista;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_Seleccion_Tablas {
    public Interfaz_Seleccion_Tablas() {
    }

    public void Inicializar_Seleccion() {
        Interfaz_CRUD interfazCrud = new Interfaz_CRUD();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame = new JFrame("Seleccion tabla a trabajar");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(2, 2));
        frame.setLocationRelativeTo(null);
        JButton equipos = new JButton("Equipos");
        JButton juega = new JButton("Juegan");
        JButton partidos = new JButton("Partidos");
        JButton informe = new JButton("Informe");
        frame.add(equipos);
        frame.add(juega);
        frame.add(partidos);
        frame.add(informe);
        frame.setVisible(true);
        equipos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(1);
            }
        });
        juega.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(2);
            }
        });
        partidos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(3);
            }
        });
        informe.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(4);
            }
        });
    }
}
