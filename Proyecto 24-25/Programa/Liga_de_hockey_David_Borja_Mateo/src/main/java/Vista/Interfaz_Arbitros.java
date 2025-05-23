package Vista;

import Vista.Ver.VR_Equipo;
import Vista.Ver.VR_Informe;
import Vista.Ver.VR_Juega;
import Vista.Ver.VR_Partido;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_Arbitros {
    public Interfaz_Arbitros() {
    }

    public void Inicializar_Interfaz_Arbitro() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame = new JFrame("Seleccion tabla a ver");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(2, 2));
        frame.setLocationRelativeTo(null);
        JButton equipos = new JButton("Ver Equipos");
        JButton juega = new JButton("Ver Juegan");
        JButton partidos = new JButton("Ver Partidos");
        JButton informe = new JButton("Ver Informe");
        frame.add(equipos);
        frame.add(juega);
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.add(partidos);
        frame.add(informe);
        frame.setVisible(true);
        equipos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Equipo vrEquipo = new VR_Equipo();
                vrEquipo.Iniciar_Vista();
            }
        });
        juega.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Juega vrJuega = new VR_Juega();
                vrJuega.Iniciar_Vista();
            }
        });
        partidos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Partido vrPartido = new VR_Partido();
                vrPartido.Iniciar_Vista();
            }
        });
        informe.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Informe vrInforme = new VR_Informe();
                vrInforme.Iniciar_Vista();
            }
        });
    }
}
