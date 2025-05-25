package Vista.Borrar;

import Controlador.Controlador_Equipos.Eliminar;
import Modelo.Equipo;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Equipo {
    private static String mensaje_confirmacion; // Variable para almacenar el mensaje de confirmación
    Eliminar eliminar; // Instancia de la clase Eliminar

    public BO_Equipo() {
        // Constructor vacío
    }

    // Método para establecer el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Método para iniciar el proceso de borrado
    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width; // Obtiene el ancho de la pantalla
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height; // Obtiene el alto de la pantalla
        Eliminar eliminar = new Eliminar(); // Crea una instancia de la clase Eliminar
        JFrame frame;
        frame = new JFrame("Eliminar equipo"); // Crea una ventana con título
        frame.setSize(ancho / 4, alto / 2); // Define el tamaño de la ventana
        JTable tablaEquipos;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout()); // Establece el diseño de la ventana
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); // Define el comportamiento al cerrar la ventana
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Creo la tabla con las columnas que va a tener
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_eq");
        modeloTabla.addColumn("Nombre");
        modeloTabla.addColumn("N_Titulos");
        modeloTabla.addColumn("Estadio");
        modeloTabla.addColumn("DNI_entrenador");

        tablaEquipos = new JTable(modeloTabla); // Crea la tabla con el modelo de datos
        JScrollPane scrollPane = new JScrollPane(tablaEquipos); // Agrega barra de desplazamiento a la tabla
        frame.add(scrollPane, BorderLayout.CENTER); // Añade la tabla a la ventana

        JButton botonBorrar = new JButton("Borrar"); // Botón para borrar registros
        JPanel panelBotones = new JPanel(); // Panel para contener el botón
        panelBotones.add(botonBorrar); // Añade el botón al panel
        frame.add(panelBotones, BorderLayout.SOUTH); // Añade el panel a la ventana

        // Llamo a cargarDatos() para rellenar el JTable con los datos de la Base de datos
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true); // Muestra la ventana

        botonBorrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int filaSeleccionada = tablaEquipos.getSelectedRow(); // Obtiene la fila seleccionada
                if (filaSeleccionada != -1) { // Verifica si se ha seleccionado alguna fila
                    int idequipo = (int) modeloTabla.getValueAt(filaSeleccionada, 0); // Obtiene el ID del equipo seleccionado
                    Equipo equipo = new Equipo(idequipo); // Crea una instancia de Equipo con el ID obtenido
                    eliminar.Eliminar_juega(equipo, modeloTabla); // Llama al método para eliminar el equipo
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion); // Muestra el mensaje de confirmación

                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un dato para borrar."); // Mensaje si no se ha seleccionado nada
                }
            }
        });
    }
}
