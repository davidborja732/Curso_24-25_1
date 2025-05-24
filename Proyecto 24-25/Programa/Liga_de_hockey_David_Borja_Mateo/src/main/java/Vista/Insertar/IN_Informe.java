package Vista.Insertar;

import Controlador.Conexion;
import Controlador.Controlador_Informe.Anadir;
import Modelo.Informe;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class IN_informe {
    private static String mensaje_confirmacion; // Variable para almacenar el mensaje de confirmación
    Anadir anadir; // Instancia de la clase Anadir para gestionar la inserción en la base de datos
    JTextPane ID_arbitro; // Campo de texto para mostrar el árbitro del partido seleccionado

    public IN_informe() {
        // Constructor vacío
    }

    // Método para establecer el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Método para iniciar la inserción de un nuevo informe
    public void Iniciar_insercion() {
        anadir = new Anadir(); // Instancia de Anadir para gestionar la inserción
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width; // Obtiene el ancho de la pantalla
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height; // Obtiene el alto de la pantalla
        Conexion conexion = new Conexion(); // Instancia de Conexion para manejar la base de datos
        JFrame frame = new JFrame("Insertar informe"); // Creación de la ventana con título
        frame.setSize(ancho / 4, alto / 2); // Define el tamaño de la ventana
        frame.setLayout(new GridLayout(5, 2)); // Establece el diseño en cuadrícula de 5 filas y 2 columnas
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); // Cierra la ventana sin terminar la aplicación
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Creación de los componentes de la interfaz
        JComboBox<String> ID_partido = new JComboBox<>(); // Lista desplegable para seleccionar el partido
        ID_arbitro = new JTextPane(); // Campo de texto para mostrar el nombre del árbitro del partido seleccionado
        ID_arbitro.setEditable(false); // Se establece como no editable

        JTextField N_Rojas = new JTextField(); // Campo de texto para ingresar el número de tarjetas rojas
        JTextField N_Amarillas = new JTextField(); // Campo de texto para ingresar el número de tarjetas amarillas
        JButton boton_anadir = new JButton("Añadir"); // Botón para agregar el informe
        JButton boton_Cancelar = new JButton("Cancelar"); // Botón para cancelar la operación

        // Agregando los componentes a la ventana
        frame.add(new JLabel("Partido "));
        frame.add(ID_partido);
        frame.add(new JLabel("Árbitro "));
        frame.add(ID_arbitro);
        frame.add(new JLabel("Número de tarjetas rojas"));
        frame.add(N_Rojas);
        frame.add(new JLabel("Número de tarjetas amarillas"));
        frame.add(N_Amarillas);
        frame.add(boton_anadir);
        frame.add(boton_Cancelar);

        // Cargar datos en el JComboBox de partidos
        List<String> partidos = anadir.obtenerPartidos();
        for (String partido : partidos) {
            ID_partido.addItem(partido); // Añadir partido a la lista desplegable
        }

        frame.setVisible(true); // Muestra la ventana

        // Cuando el usuario seleccione un partido, actualizar automáticamente el árbitro correspondiente
        ID_partido.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String partidoSeleccionado = (String) ID_partido.getSelectedItem();
                int idPartido = anadir.obtenerIDPartido(partidoSeleccionado);
                String arbitroNombre = anadir.obtenerNombreArbitroPorPartido(idPartido);
                ID_arbitro.setText(arbitroNombre); // Muestra el árbitro sin permitir edición
            }
        });

        // Acción para añadir un informe cuando se presiona el botón
        boton_anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String partidoSeleccionado = (String) ID_partido.getSelectedItem();
                int idPartido = anadir.obtenerIDPartido(partidoSeleccionado);
                int idArbitro = anadir.obtenerIDArbitro(ID_arbitro.getText());

                // Eliminación de espacios y verificación de que los valores de tarjetas sean números enteros
                String rojasStr = N_Rojas.getText().trim();
                String amarillasStr = N_Amarillas.getText().trim();

                if (!rojasStr.matches("\\d+") || !amarillasStr.matches("\\d+")) {
                    JOptionPane.showMessageDialog(frame, "Los valores de tarjetas deben ser números enteros.");
                    return;
                }

                int nRojas = Integer.parseInt(rojasStr);
                int nAmarillas = Integer.parseInt(amarillasStr);

                // Creación del objeto Informe con los datos obtenidos
                Informe informe = new Informe(idPartido, idArbitro, nRojas, nAmarillas);
                anadir.anadirInforme(informe); // Inserción del informe en la base de datos
                JOptionPane.showMessageDialog(frame, mensaje_confirmacion); // Muestra mensaje de confirmación
            }
        });

        // Acción para cancelar y cerrar la ventana sin agregar el informe
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); // Cierra la ventana sin realizar la inserción
            }
        });
    }
}

