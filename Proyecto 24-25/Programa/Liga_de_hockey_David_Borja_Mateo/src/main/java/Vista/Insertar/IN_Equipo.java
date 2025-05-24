package Vista.Insertar;

import Controlador.Conexion;
import Controlador.Controlador_Equipos.Anadir;
import Modelo.Equipo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class IN_Equipo {
    private static String mensaje_confirmacion; // Variable estática para almacenar el mensaje de confirmación
    Anadir anadir; // Instancia de la clase Anadir, utilizada para agregar equipos a la base de datos

    public IN_Equipo() {
        // Constructor vacío
    }

    // Método para recoger y almacenar el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Método para iniciar la inserción de un nuevo equipo
    public void Iniciar_insercion() {
        anadir = new Anadir(); // Instancia de la clase Anadir
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width; // Obtiene el ancho de la pantalla
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height; // Obtiene el alto de la pantalla
        Conexion conexion = new Conexion(); // Instancia de la clase Conexion para gestionar la base de datos
        JFrame frame = new JFrame("Insertar equipo"); // Ventana con título correspondiente
        frame.setSize(ancho / 4, alto / 2); // Define el tamaño de la ventana
        frame.setLayout(new GridLayout(5, 2)); // Define el diseño de la ventana con una cuadrícula
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); // Define el comportamiento al cerrar la ventana
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Creación de los componentes de la interfaz
        JComboBox<String> DNI_entrenador = new JComboBox<>(); // Lista desplegable para seleccionar el entrenador
        JTextField Estadio = new JTextField(); // Campo de texto para ingresar el nombre del estadio
        JTextField N_trofeos = new JTextField(); // Campo de texto para ingresar el número de trofeos
        N_trofeos.setText("0"); // Se establece el valor predeterminado de trofeos en 0
        JTextField Nombre_equipo = new JTextField(); // Campo de texto para ingresar el nombre del equipo
        JButton boton_anadir = new JButton("Añadir"); // Botón para añadir el equipo
        JButton boton_Cancelar = new JButton("Cancelar"); // Botón para cancelar la operación

        // Agregando los componentes a la ventana
        frame.add(new JLabel("Nombre equipo "));
        frame.add(Nombre_equipo);
        frame.add(new JLabel("Número trofeos (Palmarés)"));
        frame.add(N_trofeos);
        frame.add(new JLabel("Estadio "));
        frame.add(Estadio);
        frame.add(new JLabel("Entrenador "));
        frame.add(DNI_entrenador);
        frame.add(boton_anadir);
        frame.add(boton_Cancelar);

        // Cargar datos en el JComboBox con los entrenadores disponibles
        List<String> entrenadores = anadir.obtenerEntrenadores();
        for (String entrenador : entrenadores) {
            DNI_entrenador.addItem(entrenador); // Agregar el nombre del entrenador a la lista desplegable
        }

        frame.setVisible(true); // Muestra la ventana

        // Acción para añadir un equipo cuando se presiona el botón
        boton_anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nombreEquipo = Nombre_equipo.getText().trim();
                String estadio = Estadio.getText().trim();
                String nTrofeos = N_trofeos.getText().trim();
                String seleccionado = (String) DNI_entrenador.getSelectedItem();

                if (nombreEquipo.isEmpty() || estadio.isEmpty() || nTrofeos.isEmpty() || seleccionado == null || seleccionado.isEmpty()) {
                    JOptionPane.showMessageDialog(frame, "Todos los campos deben estar completos.");
                } else if (!nTrofeos.matches("\\d+")) { // Verifica que el número de trofeos sea un número válido
                    JOptionPane.showMessageDialog(frame, "El número de trofeos debe ser un valor numérico válido.");
                } else if (nombreEquipo.endsWith(" ") || estadio.endsWith(" ")) {
                    JOptionPane.showMessageDialog(frame, "El nombre del equipo o el estadio no deben tener espacios al final.");
                } else if (nombreEquipo.length() > 50 || estadio.length() > 50) {
                    JOptionPane.showMessageDialog(frame, "El nombre del equipo o el estadio no pueden tener más de 50 caracteres.");
                } else {
                    // Separar nombre y apellido del entrenador
                    String[] nombreApellido = seleccionado.split(" ");
                    int trofeos = Integer.parseInt(nTrofeos);

                    // Crear instancia del equipo e insertarlo en la base de datos
                    Equipo equipo = new Equipo(nombreApellido[0], estadio, trofeos, nombreEquipo);
                    anadir.Anadir_equipo(equipo);
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                    DNI_entrenador.removeAllItems();
                    List<String> entrenadores = anadir.obtenerEntrenadores();
                    for (String entrenador : entrenadores) {
                        DNI_entrenador.addItem(entrenador); // Agregar el nombre del entrenador a la lista desplegable
                    }
                }
            }
        });


        // Acción para cancelar y cerrar la ventana
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); // Cierra la ventana sin realizar la inserción
            }
        });
    }
}


