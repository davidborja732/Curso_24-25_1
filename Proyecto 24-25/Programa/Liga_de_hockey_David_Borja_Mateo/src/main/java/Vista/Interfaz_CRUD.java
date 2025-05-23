package Vista;

import Vista.Borrar.BO_Equipo;
import Vista.Borrar.BO_Informe;
import Vista.Borrar.BO_Juega;
import Vista.Borrar.BO_Partido;
import Vista.Insertar.IN_Equipo;
import Vista.Insertar.IN_Juega;
import Vista.Insertar.IN_Partido;
import Vista.Insertar.IN_informe;
import Vista.Modificar.MO_Equipo;
import Vista.Modificar.MO_Informe;
import Vista.Modificar.MO_Juega;
import Vista.Modificar.MO_Partido;
import Vista.Ver.VR_Equipo;
import Vista.Ver.VR_Informe;
import Vista.Ver.VR_Juega;
import Vista.Ver.VR_Partido;

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
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
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
                    IN_Partido inPartido=new IN_Partido();
                    inPartido.Iniciar_insercion();
                } else if (opcion==4) {
                    cerrar_interfaz(frame);
                    IN_informe inInforme=new IN_informe();
                    inInforme.Iniciar_insercion();
                }
            }
        });
        borrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {
                    cerrar_interfaz(frame);
                    BO_Equipo boEquipo=new BO_Equipo();
                    boEquipo.Iniciar_Borrado();
                } else if (opcion==2) {
                    cerrar_interfaz(frame);
                    BO_Juega boJuega=new BO_Juega();
                    boJuega.Iniciar_Borrado();
                } else if (opcion==3) {
                    cerrar_interfaz(frame);
                    BO_Partido boPartido=new BO_Partido();
                    boPartido.Iniciar_Borrado();
                } else if (opcion==4) {
                    cerrar_interfaz(frame);
                    BO_Informe boInforme=new BO_Informe();
                    boInforme.Iniciar_Borrado();
                }
            }
        });
        modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {
                    cerrar_interfaz(frame);
                    MO_Equipo moEquipo=new MO_Equipo();
                    moEquipo.Iniciar_Modificacion();
                } else if (opcion==2) {
                    cerrar_interfaz(frame);
                    MO_Juega moJuega=new MO_Juega();
                    moJuega.Iniciar_Modificacion();
                } else if (opcion==3) {
                    cerrar_interfaz(frame);
                    MO_Partido moPartido=new MO_Partido();
                    moPartido.Iniciar_Modificacion();
                } else if (opcion==4) {
                    cerrar_interfaz(frame);
                    MO_Informe moInforme=new MO_Informe();
                    moInforme.Iniciar_Modificacion();
                }
            }
        });
        ver.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (opcion == 1) {
                    cerrar_interfaz(frame);
                    VR_Equipo vrEquipo=new VR_Equipo();
                    vrEquipo.Iniciar_Vista();
                } else if (opcion==2) {
                    cerrar_interfaz(frame);
                    VR_Juega vrJuega=new VR_Juega();
                    vrJuega.Iniciar_Vista();
                } else if (opcion==3) {
                    cerrar_interfaz(frame);
                    VR_Partido vrPartido=new VR_Partido();
                    vrPartido.Iniciar_Vista();
                } else if (opcion==4) {
                    cerrar_interfaz(frame);
                    VR_Informe vrInforme=new VR_Informe();
                    vrInforme.Iniciar_Vista();
                }
            }
        });
    }
}

