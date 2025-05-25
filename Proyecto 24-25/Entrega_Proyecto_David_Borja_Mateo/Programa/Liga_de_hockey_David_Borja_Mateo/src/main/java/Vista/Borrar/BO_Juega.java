package Vista.Borrar;

import Controlador.Controlador_Juega.Eliminar;
import Modelo.Juega;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Juega {
    private static String mensaje_confirmacion; // Variable estática para almacenar el mensaje de confirmación
    Eliminar eliminar; // Instancia de la clase Eliminar

    public BO_Juega() {
        // Constructor vacío
    }

    // Metodo para recoger y almacenar el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Metodo para iniciar el proceso de eliminación de equipos de un partido
    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width; // Obtiene el ancho de la pantalla
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height; // Obtiene el alto de la pantalla
        Eliminar eliminar = new Eliminar(); // Instancia de la clase Eliminar
        JFrame frame = new JFrame("Eliminar equipo de partido"); // Ventana con el título correspondiente
        frame.setSize(ancho / 4, alto / 2); // Define el tamaño de la ventana
        JTable tablaEquipos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout()); // Establece el diseño de la ventana
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); // Cierra la ventana sin terminar la aplicación
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Creación de la tabla con sus respectivas columnas
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("Nombre equipo"); // Nombre del equipo que participa en el partido
        modeloTabla.addColumn("Partido"); // Identificador del partido en el que juega el equipo
        modeloTabla.addColumn("Rol"); // Rol del equipo en el partido (ej: local o visitante)

        tablaEquipos = new JTable(modeloTabla); // Creación de la tabla con el modelo de datos
        JScrollPane scrollPane = new JScrollPane(tablaEquipos); // Agrega barra de desplazamiento a la tabla
        frame.add(scrollPane, BorderLayout.CENTER); // Añade la tabla a la ventana

        JButton botonBorrar = new JButton("Borrar"); // Botón para eliminar equipos del partido
        JPanel panelBotones = new JPanel(); // Panel que contendrá el botón de borrado
        panelBotones.add(botonBorrar); // Añade el botón al panel
        frame.add(panelBotones, BorderLayout.SOUTH); // Añade el panel de botones a la ventana

        // Llamo a cargarDatos() para rellenar el JTable con los datos de la Base de Datos
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true); // Muestra la ventana

        // Acción para eliminar un equipo del partido cuando se presiona el botón
        botonBorrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int filaSeleccionada = tablaEquipos.getSelectedRow(); // Obtiene la fila seleccionada
                if (filaSeleccionada != -1) { // Verifica si se ha seleccionado alguna fila
                    String Nombre = modeloTabla.getValueAt(filaSeleccionada, 0).toString(); // Obtiene el nombre del equipo
                    int idPartido = (int) modeloTabla.getValueAt(filaSeleccionada, 1); // Obtiene el identificador del partido
                    String rol = (String) modeloTabla.getValueAt(filaSeleccionada, 2); // Obtiene el rol del equipo en el partido

                    // Crea una instancia de Juega con los datos obtenidos
                    Juega juega = new Juega(eliminar.obtener_ID_equipo(Nombre), idPartido, rol);
                    eliminar.Eliminar_juega(juega, modeloTabla); // Llama al metodo para eliminar el equipo del partido
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion); // Muestra el mensaje de confirmación

                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un dato para borrar."); // Mensaje de advertencia si no se seleccionó ningún dato
                }
            }
        });
    }
}


