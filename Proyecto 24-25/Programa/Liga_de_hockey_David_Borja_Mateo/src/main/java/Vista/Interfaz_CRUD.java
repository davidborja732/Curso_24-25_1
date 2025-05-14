package Vista;

import Vista.Borrar.BO_Juega;
import Vista.Insertar.IN_Equipo;
import Vista.Insertar.IN_Juega;
import Vista.Modificar.MO_Juega;
import Vista.Ver.VR_Juega;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_CRUD {
    public void cerrar_interfaz(Frame frame){
        frame.dispose();
    }
    public Interfaz_CRUD() {

    }
    public void Inicializar_CRUD(int opcion){
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame;
        frame=new JFrame("Seleccion tabla a ver");
        frame.setSize(ancho/4,alto/2);
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
                    cerrar_interfaz(frame);
                    IN_Equipo inEquipo=new IN_Equipo();
                    inEquipo.Iniciar_insercion();
                } else if (opcion==2) {
                    cerrar_interfaz(frame);
                    IN_Juega inJuega=new IN_Juega();
                    inJuega.Iniciar_insercion();
                } else if (opcion==3) {
                    cerrar_interfaz(frame);

                } else if (opcion==4) {
                    cerrar_interfaz(frame);
                }
            }
        });
        borrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {

                } else if (opcion==2) {
                    cerrar_interfaz(frame);
                    BO_Juega boJuega=new BO_Juega();
                    boJuega.Iniciar_Borrado();
                } else if (opcion==3) {

                } else if (opcion==4) {

                }
            }
        });
        modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {
                    cerrar_interfaz(frame);
                } else if (opcion==2) {
                    cerrar_interfaz(frame);
                    MO_Juega moJuega=new MO_Juega();
                    moJuega.Iniciar_Modificacion();

                } else if (opcion==3) {
                    cerrar_interfaz(frame);
                } else if (opcion==4) {
                    cerrar_interfaz(frame);
                }
            }
        });
        ver.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {
                    cerrar_interfaz(frame);
                } else if (opcion==2) {
                    cerrar_interfaz(frame);
                    VR_Juega vrJuega=new VR_Juega();
                    vrJuega.Iniciar_Vista();
                } else if (opcion==3) {
                    cerrar_interfaz(frame);
                } else if (opcion==4) {
                    cerrar_interfaz(frame);
                }
            }
        });
    }
}

