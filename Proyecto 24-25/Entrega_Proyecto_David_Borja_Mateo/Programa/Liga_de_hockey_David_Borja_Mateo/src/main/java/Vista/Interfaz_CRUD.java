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

    /* Constructor vacio de la clase */
    public Interfaz_CRUD() {
    }

    /* Metodo para cerrar una ventana especifica */
    public void cerrar_interfaz(Frame frame) {
        frame.dispose(); /* Se cierra la ventana pasada como parametro */
    }

    /* Metodo para inicializar la interfaz CRUD segun la opcion seleccionada */
    public void Inicializar_CRUD(int opcion) {
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        JFrame frame;
        frame = new JFrame("Seleccion tabla a ver"); /* Se establece el titulo de la ventana */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece que se cierre solo esta ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new GridLayout(2, 2)); /* Se define un diseño de cuadrícula */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crean los botones para realizar diferentes acciones */
        JButton insertar = new JButton("Insertar"); /* Boton para insertar nuevos registros */
        JButton borrar = new JButton("Borrar"); /* Boton para eliminar registros */
        JButton modificar = new JButton("Modificar"); /* Boton para modificar registros existentes */
        JButton ver = new JButton("Ver"); /* Boton para visualizar registros */

        /* Se añaden los botones a la ventana */
        frame.add(insertar);
        frame.add(borrar);
        frame.add(modificar);
        frame.add(ver);

        frame.setVisible(true); /* Se muestra la ventana */

        /* Se asignan acciones al boton de insertar */
        insertar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cerrar_interfaz(frame); /* Se cierra la ventana actual */
                if (opcion == 1) {
                    IN_Equipo inEquipo = new IN_Equipo();
                    inEquipo.Iniciar_insercion(); /* Se inicia la insercion en la tabla Equipos */
                } else if (opcion == 2) {
                    IN_Juega inJuega = new IN_Juega();
                    inJuega.Iniciar_insercion(); /* Se inicia la insercion en la tabla Juegan */
                } else if (opcion == 3) {
                    IN_Partido inPartido = new IN_Partido();
                    inPartido.Iniciar_insercion(); /* Se inicia la insercion en la tabla Partidos */
                } else if (opcion == 4) {
                    IN_informe inInforme = new IN_informe();
                    inInforme.Iniciar_insercion(); /* Se inicia la insercion en la tabla Informe */
                }
            }
        });

        /* Se asignan acciones al boton de borrar */
        borrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cerrar_interfaz(frame); /* Se cierra la ventana actual */
                if (opcion == 1) {
                    BO_Equipo boEquipo = new BO_Equipo();
                    boEquipo.Iniciar_Borrado(); /* Se inicia el borrado en la tabla Equipos */
                } else if (opcion == 2) {
                    BO_Juega boJuega = new BO_Juega();
                    boJuega.Iniciar_Borrado(); /* Se inicia el borrado en la tabla Juegan */
                } else if (opcion == 3) {
                    BO_Partido boPartido = new BO_Partido();
                    boPartido.Iniciar_Borrado(); /* Se inicia el borrado en la tabla Partidos */
                } else if (opcion == 4) {
                    BO_Informe boInforme = new BO_Informe();
                    boInforme.Iniciar_Borrado(); /* Se inicia el borrado en la tabla Informe */
                }
            }
        });

        /* Se asignan acciones al boton de modificar */
        modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cerrar_interfaz(frame); /* Se cierra la ventana actual */
                if (opcion == 1) {
                    MO_Equipo moEquipo = new MO_Equipo();
                    moEquipo.Iniciar_Modificacion(); /* Se inicia la modificacion en la tabla Equipos */
                } else if (opcion == 2) {
                    MO_Juega moJuega = new MO_Juega();
                    moJuega.Iniciar_Modificacion(); /* Se inicia la modificacion en la tabla Juegan */
                } else if (opcion == 3) {
                    MO_Partido moPartido = new MO_Partido();
                    moPartido.Iniciar_Modificacion(); /* Se inicia la modificacion en la tabla Partidos */
                } else if (opcion == 4) {
                    MO_Informe moInforme = new MO_Informe();
                    moInforme.Iniciar_Modificacion(); /* Se inicia la modificacion en la tabla Informe */
                }
            }
        });

        /* Se asignan acciones al boton de ver */
        ver.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cerrar_interfaz(frame); /* Se cierra la ventana actual */
                if (opcion == 1) {
                    VR_Equipo vrEquipo = new VR_Equipo();
                    vrEquipo.Iniciar_Vista(); /* Se inicia la visualizacion de la tabla Equipos */
                } else if (opcion == 2) {
                    VR_Juega vrJuega = new VR_Juega();
                    vrJuega.Iniciar_Vista(); /* Se inicia la visualizacion de la tabla Juegan */
                } else if (opcion == 3) {
                    VR_Partido vrPartido = new VR_Partido();
                    vrPartido.Iniciar_Vista(); /* Se inicia la visualizacion de la tabla Partidos */
                } else if (opcion == 4) {
                    VR_Informe vrInforme = new VR_Informe();
                    vrInforme.Iniciar_Vista(); /* Se inicia la visualizacion de la tabla Informe */
                }
            }
        });
    }
}
