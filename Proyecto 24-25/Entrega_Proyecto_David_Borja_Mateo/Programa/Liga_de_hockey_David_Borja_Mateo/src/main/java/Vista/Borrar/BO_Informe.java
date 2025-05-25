package Vista.Borrar;

import Controlador.Controlador_Informe.Eliminar;
import Modelo.Informe;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BO_Informe {
    private static String mensaje_confirmacion; // Variable estática para almacenar el mensaje de confirmación
    Eliminar eliminar; // Instancia de la clase Eliminar

    public BO_Informe() {
        // Constructor vacío
    }

    // Método para recoger y almacenar el mensaje de confirmación
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Método para iniciar el proceso de borrado de informes
    public void Iniciar_Borrado() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width; // Obtiene el ancho de la pantalla
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height; // Obtiene el alto de la pantalla
        Eliminar eliminar = new Eliminar(); // Instancia de la clase Eliminar
        JFrame frame = new JFrame("Eliminar informe"); // Ventana con título "Eliminar informe"
        frame.setSize(ancho / 4, alto / 2); // Define el tamaño de la ventana
        JTable tablaInformes;
        DefaultTableModel modeloTabla;
        frame.setLayout(new BorderLayout()); // Establece el diseño de la ventana
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); // Define el comportamiento al cerrar la ventana
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Creación de la tabla con sus respectivas columnas
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_informe"); // Identificador del informe
        modeloTabla.addColumn("Nombre Árbitro"); // Nombre del árbitro que realizó el informe
        modeloTabla.addColumn("N_Rojas"); // Número de tarjetas rojas en el partido
        modeloTabla.addColumn("N_Amarillas"); // Número de tarjetas amarillas en el partido
        modeloTabla.addColumn("ID_partido"); // Identificador del partido relacionado con el informe

        tablaInformes = new JTable(modeloTabla); // Creación de la tabla con el modelo de datos
        JScrollPane scrollPane = new JScrollPane(tablaInformes); // Agrega barra de desplazamiento a la tabla
        frame.add(scrollPane, BorderLayout.CENTER); // Añade la tabla a la ventana

        JButton botonBorrar = new JButton("Borrar"); // Botón para borrar informes
        JPanel panelBotones = new JPanel(); // Panel que contendrá el botón de borrado
        panelBotones.add(botonBorrar); // Añade el botón al panel
        frame.add(panelBotones, BorderLayout.SOUTH); // Añade el panel de botones a la ventana

        // Llamo a cargarDatos() para rellenar el JTable con los datos de la Base de Datos
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true); // Muestra la ventana

        // Acción para borrar un informe cuando se presiona el botón
        botonBorrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int filaSeleccionada = tablaInformes.getSelectedRow(); // Obtiene la fila seleccionada
                if (filaSeleccionada != -1) { // Verifica si se ha seleccionado alguna fila
                    int idInforme = (int) modeloTabla.getValueAt(filaSeleccionada, 0); // Obtiene el ID del informe seleccionado
                    Informe informe = new Informe(idInforme); // Crea una instancia de Informe con el ID obtenido
                    eliminar.eliminarInforme(informe, modeloTabla); // Llama al método para eliminar el informe
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion); // Muestra el mensaje de confirmación

                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un informe para borrar."); // Mensaje de advertencia si no se seleccionó ningún informe
                }
            }
        });
    }
}


