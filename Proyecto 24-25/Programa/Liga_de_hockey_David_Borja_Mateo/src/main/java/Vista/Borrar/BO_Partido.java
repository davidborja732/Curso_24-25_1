package Vista.Borrar;

import Controlador.Controlador_Partidos.Eliminar;
import Modelo.Partidos;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Partido {
    private static String mensaje_confirmacion; // Variable estática para almacenar el mensaje de confirmación
    Eliminar eliminar; // Instancia de la clase Eliminar

    public BO_Partido() {
        // Constructor vacío
    }

    // Método para recoger y almacenar el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Método para iniciar el proceso de eliminación de partidos
    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width; // Obtiene el ancho de la pantalla
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height; // Obtiene el alto de la pantalla
        Eliminar eliminar = new Eliminar(); // Instancia de la clase Eliminar
        JFrame frame = new JFrame("Eliminar partido"); // Ventana con el título correspondiente
        frame.setSize(ancho / 4, alto / 2); // Define el tamaño de la ventana
        JTable tablaPartidos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout()); // Establece el diseño de la ventana
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); // Define el comportamiento al cerrar la ventana
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Creación de la tabla con sus respectivas columnas
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_partido"); // Identificador del partido
        modeloTabla.addColumn("Ganador"); // Nombre del equipo ganador del partido
        modeloTabla.addColumn("Fecha"); // Fecha en la que se celebró el partido

        tablaPartidos = new JTable(modeloTabla); // Creación de la tabla con el modelo de datos
        JScrollPane scrollPane = new JScrollPane(tablaPartidos); // Agrega barra de desplazamiento a la tabla
        frame.add(scrollPane, BorderLayout.CENTER); // Añade la tabla a la ventana

        JButton botonBorrar = new JButton("Borrar"); // Botón para eliminar partidos
        JPanel panelBotones = new JPanel(); // Panel que contendrá el botón de borrado
        panelBotones.add(botonBorrar); // Añade el botón al panel
        frame.add(panelBotones, BorderLayout.SOUTH); // Añade el panel de botones a la ventana

        // Llamo a cargarDatos() para rellenar el JTable con los datos de la Base de Datos
        eliminar.cargarDatos(modeloTabla);
        for (int i = 0; i < modeloTabla.getRowCount(); i++) {
            int columnaGanador = 1; // Segunda columna (Ganador)
            Object valorGanador = modeloTabla.getValueAt(i, columnaGanador);

            if (valorGanador == null || valorGanador.toString().trim().isEmpty()) {
                modeloTabla.setValueAt("No establecido", i, columnaGanador);
            }
        }


        frame.setVisible(true); // Muestra la ventana

        // Acción para eliminar un partido cuando se presiona el botón
        botonBorrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int filaSeleccionada = tablaPartidos.getSelectedRow(); // Obtiene la fila seleccionada
                if (filaSeleccionada != -1) { // Verifica si se ha seleccionado alguna fila
                    int idPartido = (int) modeloTabla.getValueAt(filaSeleccionada, 0); // Obtiene el ID del partido seleccionado
                    Partidos partido = new Partidos(idPartido); // Crea una instancia de Partidos con el ID obtenido
                    eliminar.eliminarPartido(partido, modeloTabla); // Llama al método para eliminar el partido
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion); // Muestra el mensaje de confirmación

                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un partido para borrar."); // Mensaje de advertencia si no se seleccionó ningún partido
                }
            }
        });
    }
}

