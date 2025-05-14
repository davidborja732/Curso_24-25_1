package Vista.Modificar;

import Controlador.Controlador_Equipos.Anadir;
import Modelo.Equipo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class MO_Equipo {
    private final int ancho;
    private final int alto;
    Controlador.Controlador_Equipos.Modificar modificar=new Controlador.Controlador_Equipos.Modificar();
    private static String mensaje_confirmacion;
    private JFrame frameSeleccion;
    private JComboBox<String> equipos;

    public MO_Equipo() {
        ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        alto = Toolkit.getDefaultToolkit().getScreenSize().height;
    }

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public void Iniciar_Modificacion() {
        frameSeleccion = new JFrame("Seleccionar equipo");
        frameSeleccion.setSize(ancho / 4, alto / 2);
        frameSeleccion.setLayout(new GridLayout(2, 2));
        frameSeleccion.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frameSeleccion.setLocationRelativeTo(null);

        equipos = new JComboBox<>();
        JButton botonModificar = new JButton("Modificar");
        JButton botonCancelar = new JButton("Cancelar");

        frameSeleccion.add(new JLabel("Seleccione equipo"));
        frameSeleccion.add(equipos);
        frameSeleccion.add(botonModificar);
        frameSeleccion.add(botonCancelar);

        // Cargar los equipos en el JComboBox
        try {
            for (String nombre : modificar.obtenerEquipos()) {
                equipos.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(frameSeleccion, "Error al cargar equipos: " + e.getMessage());
        }

        frameSeleccion.setVisible(true);

        // Acción al presionar "Modificar"
        botonModificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (equipos.getSelectedItem() != null) {
                    String nombreEquipoSeleccionado = (String) equipos.getSelectedItem();
                    AbrirFormularioModificacion(nombreEquipoSeleccionado);
                } else {
                    JOptionPane.showMessageDialog(frameSeleccion, "Seleccione un equipo para modificar.");
                }
            }
        });

        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frameSeleccion.dispose();
            }
        });
    }

    private void AbrirFormularioModificacion(String nombreEquipo) {
        Anadir anadir=new Anadir();
        JFrame frameModificar = new JFrame("Modificar equipo");
        frameModificar.setSize(ancho / 4, alto / 2);
        frameModificar.setLayout(new GridLayout(5, 2));
        frameModificar.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frameModificar.setLocationRelativeTo(null);

        JTextField nuevoNombre = new JTextField();
        JTextField numeroTitulos = new JTextField();
        JTextField estadio = new JTextField();
        JComboBox<String> nuevoentrenador=new JComboBox<>();
        List<String> entrenadores = anadir.obtenerEntrenadores();
        for (String entrenador : entrenadores) {
            nuevoentrenador.addItem(entrenador); // Añadir el nombre del entrenador
        }
        JButton botonGuardar = new JButton("Guardar");
        JButton botonCancelar = new JButton("Cancelar");

        frameModificar.add(new JLabel("Nuevo Nombre"));
        frameModificar.add(nuevoNombre);
        frameModificar.add(new JLabel("Número de Títulos"));
        frameModificar.add(numeroTitulos);
        frameModificar.add(new JLabel("Estadio"));
        frameModificar.add(estadio);
        frameModificar.add(new JLabel("Nuevo entrenador"));
        frameModificar.add(nuevoentrenador);
        frameModificar.add(botonGuardar);
        frameModificar.add(botonCancelar);

        frameModificar.setVisible(true);

        botonGuardar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (!nuevoNombre.getText().isEmpty() && !numeroTitulos.getText().isEmpty() && !estadio.getText().isEmpty()) {
                    String seleccionado = (String) nuevoentrenador.getSelectedItem(); // Obtiene el valor seleccionado
                    String[] nombre_apellido = seleccionado.split(" ");
                    Equipo equipo=new Equipo(nombre_apellido[0],estadio.getText(),Integer.parseInt(numeroTitulos.getText().replace(" ","_")),nuevoNombre.getText().replace(" ","_"));
                    modificar.modificarEquipo(equipo);
                    JOptionPane.showMessageDialog(frameModificar, mensaje_confirmacion);
                } else {
                    JOptionPane.showMessageDialog(frameModificar, "Complete todos los campos.");
                }
            }
        });

        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frameModificar.dispose();
            }
        });
    }
}

