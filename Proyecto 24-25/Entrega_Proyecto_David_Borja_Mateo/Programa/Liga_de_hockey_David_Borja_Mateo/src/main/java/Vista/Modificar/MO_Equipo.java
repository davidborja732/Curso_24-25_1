package Vista.Modificar;

import Controlador.Controlador_Equipos.Modificar;
import Modelo.Equipo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class MO_Equipo {

    /* Variables para almacenar las dimensiones de la pantalla */
    private final int ancho;
    private final int alto;

    /* Variable para almacenar el equipo seleccionado */
    private String equipo_elegido;

    /* Instancia de la clase Modificar para realizar los cambios en la base de datos */
    Modificar modificar = new Controlador.Controlador_Equipos.Modificar();

    /* Variable para almacenar mensajes de confirmacion */
    private static String mensaje_confirmacion;

    /* Lista desplegable para seleccionar un equipo */
    private JComboBox<String> equipos;

    /* Constructor de la clase */
    public MO_Equipo() {
        /* Se obtienen las dimensiones de la pantalla */
        ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        alto = Toolkit.getDefaultToolkit().getScreenSize().height;
    }

    /* Metodo para establecer un mensaje que sera mostrado */
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    /* Metodo para inicializar la modificacion de un equipo */
    public void Iniciar_Modificacion() {
        /* Se crea la ventana para seleccionar el equipo */
        JFrame frame = new JFrame("Seleccionar equipo");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(2, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        /* Se crean los elementos de la interfaz */
        equipos = new JComboBox<>();
        JButton botonModificar = new JButton("Modificar");
        JButton botonCancelar = new JButton("Cancelar");

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("Seleccione equipo"));
        frame.add(equipos);
        frame.add(botonModificar);
        frame.add(botonCancelar);

        frame.setVisible(true); /* Se muestra la ventana */

        /* Se carga la lista de equipos en el JComboBox */
        try {
            for (String nombre : modificar.obtenerEquipos()) {
                equipos.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(frame, "Error al cargar equipos: " + e.getMessage());
        }

        /* Se establece la accion del boton "Modificar" */
        botonModificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                /* Se verifica que se haya seleccionado un equipo */
                if (equipos.getSelectedItem() != null) {
                    String nombreEquipoSeleccionado = (String) equipos.getSelectedItem();
                    AbrirFormularioModificacion(nombreEquipoSeleccionado, modificar.obtener_ID_equipo(nombreEquipoSeleccionado));
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un equipo para modificar.");
                }
            }
        });

        /* Se establece la accion del boton "Cancelar" */
        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); /* Se cierra la ventana */
            }
        });
    }

    /* Metodo para abrir el formulario de modificacion de un equipo */
    private void AbrirFormularioModificacion(String nombreEquipo, int id_eq_seleccionado) {
        /* Se crea la ventana para modificar el equipo */
        JFrame frame = new JFrame("Modificar equipo");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(5, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        /* Se crean los elementos de la interfaz */
        JTextField nuevoNombre = new JTextField();
        JTextField numeroTitulos = new JTextField("0");
        JTextField estadio = new JTextField();
        JComboBox<String> nuevoentrenador = new JComboBox<>();

        /* Se carga la lista de entrenadores en el JComboBox */
        List<String> entrenadores = modificar.obtenerEntrenadores();
        for (String entrenador : entrenadores) {
            nuevoentrenador.addItem(entrenador);
        }

        JButton botonGuardar = new JButton("Guardar");
        JButton botonCancelar = new JButton("Cancelar");

        /* Se añaden los elementos a la ventana */
        frame.add(new JLabel("Nuevo Nombre"));
        frame.add(nuevoNombre);
        frame.add(new JLabel("Numero de Titulos"));
        frame.add(numeroTitulos);
        frame.add(new JLabel("Estadio"));
        frame.add(estadio);
        frame.add(new JLabel("Nuevo entrenador"));
        frame.add(nuevoentrenador);
        frame.add(botonGuardar);
        frame.add(botonCancelar);

        frame.setVisible(true); /* Se muestra la ventana */

        /* Se establece la accion del boton "Guardar" */
        botonGuardar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nombreEquipo = nuevoNombre.getText().trim();
                String Nombreestadio = estadio.getText().trim();
                String nTrofeos = numeroTitulos.getText().trim();
                String seleccionado = (String) nuevoentrenador.getSelectedItem();

                if (nombreEquipo.isEmpty() || Nombreestadio.isEmpty() || nTrofeos.isEmpty() || seleccionado == null || seleccionado.isEmpty()) {
                    JOptionPane.showMessageDialog(frame, "Todos los campos deben estar completos.");
                } else if (!nTrofeos.matches("\\d+")) {
                    JOptionPane.showMessageDialog(frame, "El numero de titulos debe ser un numero entero valido.");
                } else if (nombreEquipo.length() > 50 || Nombreestadio.length() > 50) {
                    JOptionPane.showMessageDialog(frame, "El nombre del equipo o el estadio no pueden tener mas de 50 caracteres.");
                } else {
                    String[] nombreApellido = seleccionado.split(" ");
                    int trofeos = Integer.parseInt(nTrofeos);

                    Equipo equipo = new Equipo(nombreApellido[0], Nombreestadio, trofeos, nombreEquipo);
                    modificar.modificarEquipo(equipo, id_eq_seleccionado);
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                }
            }
        });

        /* Se establece la accion del boton "Cancelar" */
        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); /* Se cierra la ventana */
            }
        });
    }
}


