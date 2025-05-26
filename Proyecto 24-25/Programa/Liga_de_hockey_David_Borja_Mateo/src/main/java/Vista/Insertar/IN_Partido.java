package Vista.Insertar;

import Controlador.Controlador_Partidos.Anadir;
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

    /* Constructor de la clase */
    public IN_Partido() {
    }

    /* Metodo para establecer un mensaje que sera mostrado */
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    /* Metodo para inicializar la insercion de un partido */
    public void Iniciar_insercion() {
        /* Se crea la instancia de la clase Anadir */
        Anadir anadir = new Anadir();

        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        JFrame frame = new JFrame("Añadir partido");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(4, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        /* Se crean los elementos de la interfaz grafica */
        JTextPane ID_eq = new JTextPane(); /* Campo de texto para mostrar el ID del partido */
        JDateChooser fecha_partido = new JDateChooser(); /* Selector de fecha */
        fecha_partido.setDateFormatString("yyyy-MM-dd"); /* Se establece el formato de fecha */
        JComboBox<String> arbitros = new JComboBox<>(); /* Lista desplegable para seleccionar un arbitro */
        JButton boton_Anadir = new JButton("Añadir"); /* Boton para añadir el partido */
        JButton boton_Cancelar = new JButton("Cancelar"); /* Boton para cancelar la operacion */

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("ID del partido (Solo informativo)"));
        frame.add(ID_eq);
        frame.add(new JLabel("Fecha= "));
        frame.add(fecha_partido);
        frame.add(new JLabel("ID_arbitro"));
        frame.add(arbitros);

        /* Se obtiene y muestra el ID del partido */
        ID_eq.setText(String.valueOf(anadir.obtener_id_partido()));
        ID_eq.setEditable(false);

        /* Se carga la lista de arbitros en el JComboBox */
        try {
            for (String nombre : anadir.obtenerarbitros()) {
                arbitros.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        frame.add(boton_Anadir);
        frame.add(boton_Cancelar);
        frame.setVisible(true); /* Se muestra la ventana */

        /* Se establece la accion del boton "Añadir" */
        boton_Anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se obtiene el arbitro seleccionado */
                String seleccionado = (String) arbitros.getSelectedItem();
                assert seleccionado != null;
                String[] id_arbitro = seleccionado.split(" ");

                /* Se obtiene la fecha seleccionada */
                Date fecha = fecha_partido.getDate();
                SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");

                /* Se verifica que la fecha no esté vacía */
                if (fecha != null) {
                    /* Se verifica que la fecha no sea superior a la actual */
                    if (fecha.after(new Date())) {
                        JOptionPane.showMessageDialog(frame, "La fecha debe ser la actual o fechas anteriores");
                        return;
                    }

                    String fecha_sola = formato_fecha.format(fecha);

                    /* Se crea el objeto Partidos con los datos seleccionados */
                    Partidos partido = new Partidos(Integer.parseInt(ID_eq.getText()), fecha_sola, Integer.parseInt(id_arbitro[0]));

                    /* Se añade el partido a la base de datos */
                    anadir.Anadir_Partido(partido);

                    /* Se muestra un mensaje de confirmacion */
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);

                    /* Se actualiza el ID del partido en el campo de texto */
                    ID_eq.setText(String.valueOf(anadir.obtener_id_partido()));
                } else {
                    JOptionPane.showMessageDialog(frame, "La fecha no puede estar vacía");
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
}

