package Vista.Insertar;

import Controlador.Controlador_Juega.Anadir;
import Modelo.Juega;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class IN_Juega {
    private static String mensaje_confirmacion; // Variable estática para almacenar el mensaje de confirmación

    public IN_Juega() {
        // Constructor vacío
    }

    // Método para establecer el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Método para iniciar la inserción de un equipo en un partido
    public void Iniciar_insercion() {
        Anadir anadir = new Anadir(); // Instancia de la clase Anadir para gestionar la inserción de datos
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width; // Obtiene el ancho de la pantalla
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height; // Obtiene el alto de la pantalla
        JFrame frame = new JFrame("Asignar equipo a partido"); // Creación de la ventana con título
        frame.setSize(ancho / 4, alto / 2); // Define el tamaño de la ventana
        frame.setLayout(new GridLayout(4, 2)); // Establece el diseño en cuadrícula de 4 filas y 2 columnas
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); // Cierra la ventana sin terminar la aplicación
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Creación de los componentes de la interfaz
        JComboBox<String> equipos = new JComboBox<>(); // Lista desplegable para seleccionar el equipo
        JComboBox<Integer> partidos = new JComboBox<>(); // Lista desplegable para seleccionar el partido
        JComboBox<String> Rol = new JComboBox<>(); // Lista desplegable para seleccionar el rol del equipo en el partido
        JButton boton_Anadir = new JButton("Añadir"); // Botón para agregar el equipo al partido
        JButton boton_Cancelar = new JButton("Cancelar"); // Botón para cancelar la operación

        // Agregar etiquetas y componentes a la ventana
        frame.add(new JLabel("ID_eq "));
        frame.add(equipos);
        frame.add(new JLabel("Partido"));
        frame.add(partidos);
        frame.add(new JLabel("Rol "));
        frame.add(Rol);

        try {
            // Cargar los equipos en la lista desplegable
            for (String nombre : anadir.obtenerEquipos()) {
                equipos.addItem(nombre);
            }
            // Cargar los partidos en la lista desplegable
            for (int id : anadir.obtenerPartidos()) {
                partidos.addItem(id);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage()); // Mensaje en caso de error
        }

        // Agregar opciones de rol a la lista desplegable
        Rol.addItem("Local");
        Rol.addItem("Visitante");

        // Agregar botones a la ventana
        frame.add(boton_Anadir);
        frame.add(boton_Cancelar);
        frame.setVisible(true); // Mostrar la ventana

        // Acción para añadir un equipo al partido cuando se presiona el botón
        boton_Anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.print(anadir.obtener_ID_equipo(String.valueOf(equipos.getSelectedItem()))); // Muestra el ID del equipo seleccionado en consola

                // Crear instancia de Juega con los datos seleccionados
                Juega juega = new Juega(anadir.obtener_ID_equipo(String.valueOf(equipos.getSelectedItem())),
                        Integer.parseInt(String.valueOf(partidos.getSelectedItem())),
                        String.valueOf(Rol.getSelectedItem()));

                anadir.Anadir_juega(juega); // Inserta el equipo en el partido en la base de datos
                JOptionPane.showMessageDialog(frame, mensaje_confirmacion); // Muestra mensaje de confirmación
            }
        });

        // Acción para cancelar y cerrar la ventana sin realizar la inserción
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); // Cierra la ventana sin realizar la inserción
            }
        });
    }
}
