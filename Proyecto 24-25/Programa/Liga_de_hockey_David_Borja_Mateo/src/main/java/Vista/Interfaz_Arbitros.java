package Vista;

import Controlador.Ficheros;
import Vista.Ver.VR_Equipo;
import Vista.Ver.VR_Informe;
import Vista.Ver.VR_Juega;
import Vista.Ver.VR_Partido;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Interfaz_Arbitros {

    /* Constructor vacio de la clase */
    public Interfaz_Arbitros() {
    }

    /* Metodo para cerrar la interfaz con confirmación */
    public void cerrar_interfaz(JFrame frame) {
        int respuesta = JOptionPane.showConfirmDialog(
                frame,
                "¿Está seguro de que desea cerrar sesión?",
                "Confirmar cierre de sesión",
                JOptionPane.YES_NO_OPTION);

        if (respuesta == JOptionPane.YES_OPTION) {
            frame.dispose(); /* Se cierra la ventana */

            /* Se abre la interfaz de login */
            Interfaz_login login = new Interfaz_login();
            login.Inicializar_Login();

            /* Se registra el cierre en el log */
            Ficheros ficheros=new Ficheros();
            String fechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            ficheros.escritura(new File("Ficheros/log.txt"), "Sesión cerrada por árbitro " + fechaHora);
        }
    }

    /* Metodo para inicializar la interfaz de seleccion de tabla */
    public void Inicializar_Interfaz_Arbitro() {
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        JFrame frame;
        frame = new JFrame("Seleccion tabla a ver"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new GridLayout(2, 2)); /* Se usa un diseño de cuadrícula de 2 filas y 2 columnas */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */
        frame.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE); /* Evita cierre sin confirmación */

        /* Se crean los botones para seleccionar las distintas tablas */
        JButton equipos = new JButton("Ver Equipos"); /* Boton para visualizar la tabla de Equipos */
        JButton juega = new JButton("Ver Juegan"); /* Boton para visualizar la tabla de Juegan */
        JButton partidos = new JButton("Ver Partidos"); /* Boton para visualizar la tabla de Partidos */
        JButton informe = new JButton("Ver Informe"); /* Boton para visualizar la tabla de Informe */

        /* Se añaden los botones a la ventana */
        frame.add(equipos);
        frame.add(juega);
        frame.add(partidos);
        frame.add(informe);

        frame.setVisible(true); /* Se muestra la ventana */

        /* Se asignan acciones a los botones, cada uno llama a Iniciar_Vista() segun la tabla seleccionada */
        equipos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Equipo vrEquipo = new VR_Equipo();
                vrEquipo.Iniciar_Vista(); /* Se muestra la vista de la tabla Equipos */
            }
        });

        juega.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Juega vrJuega = new VR_Juega();
                vrJuega.Iniciar_Vista(); /* Se muestra la vista de la tabla Juegan */
            }
        });

        partidos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Partido vrPartido = new VR_Partido();
                vrPartido.Iniciar_Vista(); /* Se muestra la vista de la tabla Partidos */
            }
        });

        informe.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                VR_Informe vrInforme = new VR_Informe();
                vrInforme.Iniciar_Vista(); /* Se muestra la vista de la tabla Informe */
            }
        });

        /* Manejar el cierre de la ventana con confirmación */
        frame.addWindowListener(new java.awt.event.WindowAdapter() {
            @Override
            public void windowClosing(java.awt.event.WindowEvent e) {
                cerrar_interfaz(frame);
            }
        });
    }
}

