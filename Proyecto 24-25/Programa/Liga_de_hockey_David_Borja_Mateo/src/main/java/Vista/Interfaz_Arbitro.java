package Vista;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_Arbitro {
    public Interfaz_Arbitro() {
    }
    public void Inicializar_interfaz_arbitro(){
        Toolkit t = Toolkit.getDefaultToolkit();
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame=new JFrame("Seleccion tabla a trabajar");
        frame.setSize(ancho/6,alto/4);
        frame.setLayout(new GridLayout(2,2));
        frame.setLocationRelativeTo(null);
        JButton equipos=new JButton(" Ver equipos");
        JButton juega=new JButton("Ver juegan");
        JButton partidos=new JButton("Ver partidos");
        JButton informe=new JButton("Ver Informe");
        frame.add(equipos);
        frame.add(juega);
        frame.add(partidos);
        frame.add(informe);
        frame.setVisible(true);
        equipos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        juega.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        partidos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        informe.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
    }
}
