package Vista.Insertar;

import Controlador.Controlador_Partidos.CO_Partidos; // Usamos CO_Partidos en lugar de Anadir
import Modelo.Partidos;
import com.toedter.calendar.JDateChooser;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Date;

public class IN_Partido {

    /* Variable para almacenar mensajes de confirmacion */
    private static String mensaje_confirmacion;
    private CO_Partidos coPartidos; // Instancia de CO_Partidos

    /* Constructor de la clase */
    public IN_Partido() {
        coPartidos = new CO_Partidos(); // Inicializamos la instancia
    }

    /* Metodo para establecer un mensaje que sera mostrado */
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    /* Metodo para inicializar la insercion de un partido */
    public void Iniciar_insercion() {
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        JFrame frame = new JFrame("Añadir partido");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(7, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        /* Se crean los elementos de la interfaz gráfica */
        JDateChooser fecha_partido = new JDateChooser();
        fecha_partido.setDateFormatString("yyyy-MM-dd");
        JComboBox<String> equipoLocal = new JComboBox<>();
        JComboBox<String> equipoVisitante = new JComboBox<>();
        JComboBox<String> ganador = new JComboBox<>();
        JComboBox<String> arbitro = new JComboBox<>();
        JButton boton_Anadir = new JButton("Añadir");
        JButton boton_Cancelar = new JButton("Cancelar");

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("Fecha= "));
        frame.add(fecha_partido);
        frame.add(new JLabel("Equipo Local"));
        frame.add(equipoLocal);
        frame.add(new JLabel("Equipo Visitante"));
        frame.add(equipoVisitante);
        frame.add(new JLabel("Ganador"));
        frame.add(ganador);
        frame.add(new JLabel("Árbitro"));
        frame.add(arbitro);

        /* Se carga la lista de equipos en los JComboBox */
        try {
            for (String nombre : coPartidos.obtenerEquipos()) {
                equipoLocal.addItem(nombre);
                equipoVisitante.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        /* Se carga la lista de árbitros en el JComboBox */
        try {
            for (String nombre : coPartidos.obtenerArbitros()) {
                arbitro.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar árbitros: " + e.getMessage());
        }

        /* Se establece la acción para actualizar el JComboBox del ganador */
        ActionListener updateGanador = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ganador.removeAllItems();
                String local = (String) equipoLocal.getSelectedItem();
                String visitante = (String) equipoVisitante.getSelectedItem();
                if (local != null) {
                    ganador.addItem(local);
                }
                if (visitante != null) {
                    ganador.addItem(visitante);
                }
            }
        };

        equipoLocal.addActionListener(updateGanador);
        equipoVisitante.addActionListener(updateGanador);

        frame.add(boton_Anadir);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        /* Se establece la acción del botón "Añadir" */
        boton_Anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Date fecha = fecha_partido.getDate();
                SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");

                if (fecha != null) {
                    if (fecha.after(new Date())) {
                        JOptionPane.showMessageDialog(frame, "La fecha debe ser la actual o fechas anteriores");
                        return;
                    }

                    String fecha_sola = formato_fecha.format(fecha);

                    String equipoLocalSeleccionado = (String) equipoLocal.getSelectedItem();
                    String equipoVisitanteSeleccionado = (String) equipoVisitante.getSelectedItem();
                    String ganadorSeleccionado = (String) ganador.getSelectedItem();
                    String arbitroSeleccionado = (String) arbitro.getSelectedItem();

                    if (equipoLocalSeleccionado.equals(equipoVisitanteSeleccionado)) {
                        JOptionPane.showMessageDialog(frame, "El equipo local y visitante no pueden ser el mismo");
                        return;
                    }

                    String[] arbitroId = arbitroSeleccionado.split(" ");
                    Partidos partido = new Partidos(fecha_sola, equipoLocalSeleccionado, equipoVisitanteSeleccionado, ganadorSeleccionado, Integer.parseInt(arbitroId[0]));

                    /* Se añade el partido a la base de datos */
                    coPartidos.añadirPartido(partido);

                    JOptionPane.showMessageDialog(frame, "Partido añadido correctamente");
                } else {
                    JOptionPane.showMessageDialog(frame, "La fecha no puede estar vacía");
                }
            }
        });

        /* Se establece la acción del botón "Cancelar" */
        boton_Cancelar.addActionListener(e -> frame.dispose());
    }
}







