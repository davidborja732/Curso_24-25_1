package Vista.Modificar;

import Controlador.Controlador_Partidos.Modificar;
import Modelo.Partidos;
import com.toedter.calendar.JDateChooser;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MO_Partido {

    /* Variable para la ventana principal */
    private JFrame frame;

    /* Instancia de la clase Modificar para realizar las modificaciones */
    private Modificar modificar;

    /* Variable para almacenar mensajes de confirmación */
    private static String mensaje_confirmacion;

    /* Método para establecer un mensaje que será mostrado */
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    /* Constructor de la clase */
    public MO_Partido() {
    }

    /* Método para inicializar la modificación de un partido */
    public void Iniciar_Modificacion() {
        modificar = new Modificar(); /* Se inicializa la instancia de Modificar */

        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        frame = new JFrame("Modificar partido"); /* Se establece el título de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new GridLayout(4, 2)); /* Se usa un diseño de cuadrícula */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crean los elementos de la interfaz gráfica */
        JComboBox<Integer> partidos = new JComboBox<>(); /* Lista desplegable para seleccionar un partido */
        JDateChooser fecha_partido = new JDateChooser(); /* Selector de fecha */
        fecha_partido.setDateFormatString("yyyy-MM-dd"); /* Se establece el formato de fecha */
        JComboBox<String> arbitros = new JComboBox<>(); /* Lista desplegable para seleccionar un árbitro */
        JButton boton_Modificar = new JButton("Modificar"); /* Botón para modificar el partido */
        JButton boton_Cancelar = new JButton("Cancelar"); /* Botón para cancelar la operación */

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("Seleccione partido"));
        frame.add(partidos);
        frame.add(new JLabel("Nueva Fecha"));
        frame.add(fecha_partido);
        frame.add(new JLabel("Nuevo Árbitro"));
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

        /* Se carga la lista de árbitros en el JComboBox */
        try {
            for (String nombre : modificar.obtenerarbitros()) {
                arbitros.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        /* Se establece la acción del botón "Modificar" */
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se verifica que se haya seleccionado un partido y una fecha */
                if (partidos.getSelectedItem() != null && fecha_partido.getDate() != null) {
                    Date fechaSeleccionada = fecha_partido.getDate();
                    Date fechaActual = new Date();

                    /* Se verifica si la fecha seleccionada es mayor a la actual */
                    if (fechaSeleccionada.after(fechaActual)) {
                        JOptionPane.showMessageDialog(frame, "La fecha debe ser la actual o fecha pasada.");
                        return;
                    }

                    int partidoSeleccionado = (int) partidos.getSelectedItem();
                    String seleccionado = (String) arbitros.getSelectedItem();
                    String[] id_arbitro = seleccionado.split(" ");
                    SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");
                    String fecha_sola = formato_fecha.format(fechaSeleccionada);

                    /* Se crea el objeto Partidos con los datos seleccionados */
                    Partidos partido = new Partidos(partidoSeleccionado, fecha_sola, Integer.parseInt(id_arbitro[0]));

                    /* Se realiza la modificación en la base de datos */
                    modificar.modificarPartido(partido);

                    /* Se muestra un mensaje de confirmación */
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

        /* Se establece la acción del botón "Cancelar" */
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); /* Se cierra la ventana */
            }
        });
    }

    /* Método para modificar el ganador del partido */
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

        /* Se establece la acción del botón "Modificar" */
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se obtiene el equipo seleccionado */
                String[] id_equipo_seleccionado = equipos_juegan.getSelectedItem().toString().split(" ");

                /* Se actualiza el ganador en la base de datos */
                modificar.modificarganador(Integer.parseInt(id_equipo_seleccionado[0]), id_partido);

                /* Se muestra un mensaje de confirmación */
                JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                frame.dispose();
            }
        });

        /* Se establece la acción del botón "Cancelar" */
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
                JOptionPane.showMessageDialog(frame, "No se modificará el ganador.");
            }
        });
    }
}




