package Vista.Ver;

import Controlador.Controlador_Informe.Eliminar;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class VR_Informe {

    /* Constructor vacio de la clase */
    public VR_Informe() {
    }

    /* Metodo para inicializar la vista de los informes */
    public void Iniciar_Vista() {
        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea una instancia de la clase Eliminar, que se usara para cargar los datos */
        Eliminar eliminar = new Eliminar();

        /* Se crea la ventana principal */
        JFrame frame;
        frame = new JFrame("Ver Informes"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new BorderLayout()); /* Se usa un diseño de BorderLayout */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crea la tabla que mostrara los datos de los informes */
        JTable tablaInformes;
        DefaultTableModel modeloTabla;

        /* Se define el modelo de la tabla con las columnas */
        modeloTabla = new DefaultTableModel();
        modeloTabla.addColumn("ID_informe"); /* Se añade columna para el identificador del informe */
        modeloTabla.addColumn("Nombre Arbitro"); /* Se añade columna para el nombre del arbitro */
        modeloTabla.addColumn("N_Rojas"); /* Se añade columna para el numero de tarjetas rojas */
        modeloTabla.addColumn("N_Amarillas"); /* Se añade columna para el numero de tarjetas amarillas */
        modeloTabla.addColumn("ID_partido"); /* Se añade columna para el identificador del partido asociado */

        /* Se crea la tabla con el modelo definido */
        tablaInformes = new JTable(modeloTabla);

        /* Se añade un scroll para permitir desplazamiento en caso de que haya muchos datos */
        JScrollPane scrollPane = new JScrollPane(tablaInformes);
        frame.add(scrollPane, BorderLayout.CENTER); /* Se añade la tabla en el centro de la ventana */

        /* Se llama al metodo cargarDatos() para obtener los datos de la base de datos y mostrarlos en la tabla */
        eliminar.cargarDatos(modeloTabla);

        frame.setVisible(true); /* Se muestra la ventana */
    }
}


