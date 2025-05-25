package Vista.Modificar;

import Controlador.Controlador_Juega.Modificar;
import Modelo.Juega;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MO_Juega {

    /* Variables para almacenar las dimensiones de la pantalla */
    private final int ancho;
    private final int alto;

    /* Instancia de la clase Modificar para realizar los cambios en la base de datos */
    Modificar modificar = new Modificar();

    /* Variable para almacenar mensajes de confirmacion */
    private static String mensaje_confirmacion;

    /* Ventana principal para seleccionar partido */
    private JFrame frameSeleccion;

    /* Lista desplegable para seleccionar un partido */
    private JComboBox<Integer> partidos;

    /* Constructor de la clase */
    public MO_Juega() {
        /* Se obtienen las dimensiones de la pantalla */
        ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        alto = Toolkit.getDefaultToolkit().getScreenSize().height;
    }

    /* Metodo para establecer un mensaje que sera mostrado */
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    /* Metodo para inicializar la modificacion de un partido */
    public void Iniciar_Modificacion() {
        /* Se crea la ventana para seleccionar el partido */
        frameSeleccion = new JFrame("Seleccionar partido");
        frameSeleccion.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frameSeleccion.setLayout(new GridLayout(2, 2)); /* Se usa un diseño de cuadrícula */
        frameSeleccion.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frameSeleccion.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crean los elementos de la interfaz */
        partidos = new JComboBox<>(); /* Lista desplegable para seleccionar un partido */
        JButton botonModificar = new JButton("Modificar"); /* Boton para modificar el partido */
        JButton botonCancelar = new JButton("Cancelar"); /* Boton para cancelar la operacion */

        /* Se añaden los elementos a la ventana */
        frameSeleccion.add(new JLabel("Seleccione partido"));
        frameSeleccion.add(partidos);
        frameSeleccion.add(botonModificar);
        frameSeleccion.add(botonCancelar);

        /* Se carga la lista de partidos en el JComboBox */
        try {
            for (int id : modificar.obtenerPartidos()) {
                partidos.addItem(id);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar partidos: " + e.getMessage());
        }

        frameSeleccion.setVisible(true); /* Se muestra la ventana */

        /* Se establece la accion del boton "Modificar" */
        botonModificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se verifica que se haya seleccionado un partido */
                if (partidos.getSelectedItem() != null) {
                    int idPartidoSeleccionado = (int) partidos.getSelectedItem();
                    AbrirFormularioModificacion(idPartidoSeleccionado); /* Se abre el formulario para modificar */
                } else {
                    JOptionPane.showMessageDialog(frameSeleccion, "Seleccione un partido para modificar.");
                }
            }
        });

        /* Se establece la accion del boton "Cancelar" */
        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frameSeleccion.dispose(); /* Se cierra la ventana */
            }
        });
    }

    /* Metodo para abrir el formulario de modificacion de un equipo en el partido */
    private void AbrirFormularioModificacion(int idPartido) {
        /* Se crea la ventana para modificar el equipo */
        JFrame frameModificar = new JFrame("Modificar equipo de partido");
        frameModificar.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frameModificar.setLayout(new GridLayout(3, 2)); /* Se usa un diseño de cuadrícula */
        frameModificar.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE); /* Se establece el cierre de solo esta ventana */
        frameModificar.setLocationRelativeTo(null); /* Se centra la ventana */

        /* Se crean los elementos de la interfaz */
        JComboBox<String> equipos = new JComboBox<>(); /* Lista desplegable para seleccionar el equipo */
        JComboBox<String> Rol = new JComboBox<>(); /* Lista desplegable para seleccionar el rol */
        JButton botonGuardar = new JButton("Guardar"); /* Boton para guardar los cambios */
        JButton botonCancelar = new JButton("Cancelar"); /* Boton para cancelar la operacion */

        /* Se añaden los elementos a la ventana */
        frameModificar.add(new JLabel("Nuevo equipo"));
        frameModificar.add(equipos);
        frameModificar.add(new JLabel("Nuevo Rol"));
        frameModificar.add(Rol);

        /* Se carga la lista de equipos en el JComboBox */
        try {
            for (String id : modificar.obtenerEquipos()) {
                equipos.addItem(id);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar equipos: " + e.getMessage());
        }

        /* Se añaden opciones de rol */
        Rol.addItem("Local");
        Rol.addItem("Visitante");

        frameModificar.add(botonGuardar);
        frameModificar.add(botonCancelar);
        frameModificar.setVisible(true); /* Se muestra la ventana */

        /* Se establece la accion del boton "Guardar" */
        botonGuardar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se verifica que se haya seleccionado un equipo y un rol */
                if (equipos.getSelectedItem() != null && Rol.getSelectedItem() != null) {
                    Juega juega = new Juega(
                            modificar.obtener_ID_equipo(String.valueOf(equipos.getSelectedItem())),
                            idPartido,
                            Rol.getSelectedItem().toString()
                    );

                    /* Se realiza la modificacion en la base de datos */
                    modificar.Modificar_juega(juega);

                    /* Se muestra un mensaje de confirmacion */
                    JOptionPane.showMessageDialog(frameModificar, mensaje_confirmacion);
                } else {
                    JOptionPane.showMessageDialog(frameModificar, "Seleccione un equipo y un rol.");
                }
            }
        });

        /* Se establece la accion del boton "Cancelar" */
        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frameModificar.dispose(); /* Se cierra la ventana */
            }
        });
    }
}

