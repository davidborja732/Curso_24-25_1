package Vista;

import Controlador.Ficheros;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Interfaz_Seleccion_Tablas {

    /* Constructor de la clase, vacio porque no se necesita inicializacion especial */
    public Interfaz_Seleccion_Tablas() {
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
            ficheros.escritura(new File("Ficheros/log.txt"), "Sesión cerrada por administrador " + fechaHora);
        }
    }

    /* Metodo para inicializar la interfaz grafica de seleccion de tabla */
    public void Inicializar_Seleccion() {
        Interfaz_CRUD interfazCrud = new Interfaz_CRUD(); /* Se crea una instancia de la clase Interfaz_CRUD */

        /* Se obtienen las dimensiones de la pantalla para calcular el tamaño de la ventana */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal para la seleccion de tablas */
        JFrame frame;
        frame = new JFrame("Seleccion tabla a trabajar"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new GridLayout(2, 2)); /* Se usa un diseño de cuadrícula de 2 filas y 2 columnas */
        frame.setLocationRelativeTo(null); /* Se centra la ventana en la pantalla */
        frame.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE); /* Evita cierre sin confirmación */

        /* Se crean los botones para seleccionar diferentes tablas */
        JButton equipos = new JButton("Equipos"); /* Boton para trabajar con la tabla Equipos */
        JButton juega = new JButton("Juegan"); /* Boton para trabajar con la tabla Juegan */
        JButton partidos = new JButton("Partidos"); /* Boton para trabajar con la tabla Partidos */
        JButton informe = new JButton("Informe"); /* Boton para trabajar con la tabla Informe */

        /* Se añaden los botones a la ventana */
        frame.add(equipos);
        frame.add(juega);
        frame.add(partidos);
        frame.add(informe);

        frame.setVisible(true); /* Se muestra la ventana */

        /* Se asignan acciones a los botones, cada uno llama a Inicializar_CRUD() con un identificador diferente */
        equipos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(1); /* Se inicializa la gestion de la tabla Equipos */
            }
        });

        juega.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(2); /* Se inicializa la gestion de la tabla Juegan */
            }
        });

        partidos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(3); /* Se inicializa la gestion de la tabla Partidos */
            }
        });

        informe.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                interfazCrud.Inicializar_CRUD(4); /* Se inicializa la gestion de la tabla Informe */
            }
        });

        /* Manejo el cierre de la ventana con confirmación */
        frame.addWindowListener(new java.awt.event.WindowAdapter() {
            @Override
            public void windowClosing(java.awt.event.WindowEvent e) {
                cerrar_interfaz(frame);
            }
        });
    }
}

