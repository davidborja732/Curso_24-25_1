package Vista.Modificar;

import Controlador.Controlador_Informe.Modificar;
import Modelo.Informe;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MO_Informe {

    /* Variable para la ventana principal */
    private JFrame frame;

    /* Instancia de la clase Modificar para realizar cambios en la base de datos */
    private Modificar modificar;

    /* Variable para almacenar mensajes de confirmacion */
    private static String mensaje_confirmacion;

    /* Metodo para establecer un mensaje que sera mostrado */
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    /* Constructor de la clase */
    public MO_Informe() {
    }

    /* Metodo para inicializar la modificacion de un informe */
    public void Iniciar_Modificacion() {
        modificar = new Modificar(); /* Se inicializa la instancia de Modificar */

        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        /* Se crea la ventana principal */
        frame = new JFrame("Modificar informe"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new GridLayout(5, 2)); /* Se usa un diseño de cuadrícula */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crean los elementos de la interfaz grafica */
        JComboBox<Integer> informes = new JComboBox<>(); /* Lista desplegable para seleccionar un informe */
        JTextField N_Rojas = new JTextField(); /* Campo de entrada para tarjetas rojas */
        JTextField N_Amarillas = new JTextField(); /* Campo de entrada para tarjetas amarillas */
        JTextPane ID_arbitro = new JTextPane(); /* Campo de texto para mostrar el arbitro del informe */
        ID_arbitro.setEditable(false); /* Se establece como no editable */

        /* Se crean los botones */
        JButton boton_Modificar = new JButton("Modificar");
        JButton boton_Cancelar = new JButton("Cancelar");

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("Seleccione informe"));
        frame.add(informes);
        frame.add(new JLabel("Arbitro"));
        frame.add(ID_arbitro);
        frame.add(new JLabel("Numero de tarjetas rojas"));
        frame.add(N_Rojas);
        frame.add(new JLabel("Numero de tarjetas amarillas"));
        frame.add(N_Amarillas);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true); /* Se muestra la ventana */

        /* Se carga la lista de informes en el JComboBox */
        try {
            for (int id_informe : modificar.obtenerInformes()) {
                informes.addItem(id_informe);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        /* Se establece la accion al seleccionar un informe para actualizar el arbitro */
        informes.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int informeSeleccionado = (int) informes.getSelectedItem();
                String arbitroNombre = modificar.obtenerNombreArbitroPorInforme(informeSeleccionado);
                ID_arbitro.setText(arbitroNombre); /* Se actualiza el arbitro sin permitir edicion */
            }
        });

        /* Se establece la accion del boton "Modificar" */
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se verifica que se haya seleccionado un informe */
                if (informes.getSelectedItem() != null) {
                    int informeSeleccionado = (int) informes.getSelectedItem();

                    /* Se eliminan espacios y se verifica que sean numeros */
                    String rojasStr = N_Rojas.getText().trim();
                    String amarillasStr = N_Amarillas.getText().trim();

                    if (!rojasStr.matches("\\d+") || !amarillasStr.matches("\\d+")) {
                        JOptionPane.showMessageDialog(frame, "Los valores de tarjetas deben ser numeros enteros.");
                        return;
                    }

                    /* Se convierte los valores a enteros */
                    int nRojas = Integer.parseInt(rojasStr);
                    int nAmarillas = Integer.parseInt(amarillasStr);

                    /* Se crea el objeto Informe con los datos seleccionados */
                    Informe informe = new Informe(informeSeleccionado, nRojas, nAmarillas);

                    /* Se realiza la modificacion en la base de datos */
                    modificar.modificarInforme(informe);

                    /* Se muestra un mensaje de confirmacion */
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                    frame.dispose();
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un informe para modificar.");
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


