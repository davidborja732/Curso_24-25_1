package Vista.Modificar;

import Controlador.Controlador_Partidos.Modificar;
import Modelo.Partidos;
import com.toedter.calendar.JDateChooser;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;

public class MO_Partido {

    /* Variable para la ventana principal */
    private JFrame frame;

    /* Instancia de la clase Modificar para realizar las modificaciones */
    private Modificar modificar;

    /* Variable para almacenar mensajes de confirmacion */
    private static String mensaje_confirmacion;

    /* Metodo para establecer un mensaje que sera mostrado */
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    /* Constructor de la clase */
    public MO_Partido() {
    }

    /* Metodo para inicializar la modificacion de un partido */
    public void Iniciar_Modificacion() {
        modificar = new Modificar(); /* Se inicializa la instancia de Modificar */

        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        frame = new JFrame("Modificar partido"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new GridLayout(4, 2)); /* Se usa un diseño de cuadrícula */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crean los elementos de la interfaz grafica */
        JComboBox<Integer> partidos = new JComboBox<>(); /* Lista desplegable para seleccionar un partido */
        JDateChooser fecha_partido = new JDateChooser(); /* Selector de fecha */
        fecha_partido.setDateFormatString("yyyy-MM-dd"); /* Se establece el formato de fecha */
        JComboBox<String> arbitros = new JComboBox<>(); /* Lista desplegable para seleccionar un arbitro */
        JButton boton_Modificar = new JButton("Modificar"); /* Boton para modificar el partido */
        JButton boton_Cancelar = new JButton("Cancelar"); /* Boton para cancelar la operacion */

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("Seleccione partido"));
        frame.add(partidos);
        frame.add(new JLabel("Nueva Fecha"));
        frame.add(fecha_partido);
        frame.add(new JLabel("Nuevo Arbitro"));
        frame.add(arbitros);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true); /* Se muestra la ventana */

        /* Se carga la lista de partidos en el JComboBox */
        try {
            for (int id_partido : modificar.obtenerPartidos()) {
                partidos.addItem(id_partido);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        /* Se carga la lista de arbitros en el JComboBox */
        try {
            for (String nombre : modificar.obtenerarbitros()) {
                arbitros.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        /* Se establece la accion del boton "Modificar" */
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se verifica que se haya seleccionado un partido y una fecha */
                if (partidos.getSelectedItem() != null && fecha_partido.getDate() != null) {
                    int partidoSeleccionado = (int) partidos.getSelectedItem();
                    String seleccionado = (String) arbitros.getSelectedItem();
                    String[] id_arbitro = seleccionado.split(" ");
                    SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");
                    String fecha_sola = formato_fecha.format(fecha_partido.getDate());

                    /* Se crea el objeto Partidos con los datos seleccionados */
                    Partidos partido = new Partidos(partidoSeleccionado, fecha_sola, Integer.parseInt(id_arbitro[0]));

                    /* Se realiza la modificacion en la base de datos */
                    modificar.modificarPartido(partido);

                    /* Se muestra un mensaje de confirmacion */
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                    frame.dispose();

                    /* Se verifica si el equipo juega como local y visitante para modificar el ganador */
                    if (modificar.equipoEsLocalYVisitante(partidoSeleccionado)) {
                        Modificar_ganador(partidoSeleccionado);
                    }
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un partido y una fecha para modificar.");
                }
            }
        });

        /* Se establece la accion del boton "Cancelar" */
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); /* Se cierra la ventana */
            }
        });
    }

    /* Metodo para modificar el ganador del partido */
    public void Modificar_ganador(int id_partido) {
        modificar = new Modificar(); /* Se inicializa la instancia de Modificar */

        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana para modificar el ganador */
        frame = new JFrame("Modificar partido");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(2, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        /* Se crean los botones y el JComboBox */
        JButton boton_Modificar = new JButton("Modificar");
        JButton boton_Cancelar = new JButton("Cancelar");
        JComboBox<String> equipos_juegan = new JComboBox<>();

        /* Se cargan los equipos que participaron en el partido */
        for (String equipos : modificar.obtener_local_y_visitante(id_partido)) {
            equipos_juegan.addItem(equipos);
        }

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("Seleccione el ganador"));
        frame.add(equipos_juegan);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        /* Se establece la accion del boton "Modificar" */
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se obtiene el equipo seleccionado */
                String[] id_equipo_seleccionado = equipos_juegan.getSelectedItem().toString().split(" ");

                /* Se actualiza el ganador en la base de datos */
                modificar.modificarganador(Integer.parseInt(id_equipo_seleccionado[0]), id_partido);

                /* Se muestra un mensaje de confirmacion */
                JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                frame.dispose();
            }
        });

        /* Se establece la accion del boton "Cancelar" */
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                JOptionPane.showMessageDialog(frame, "No se modificara el ganador");
            }
        });
    }
}


