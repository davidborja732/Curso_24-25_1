package Vista.Modificar;

import Controlador.Controlador_Equipos.Modificar;
import Modelo.Equipo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class MO_Equipo {
    private final int ancho;
    private final int alto;
    private String equipo_elegido;
    Modificar modificar=new Controlador.Controlador_Equipos.Modificar();
    private static String mensaje_confirmacion;
    private JComboBox<String> equipos;

    public MO_Equipo() {
        ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        alto = Toolkit.getDefaultToolkit().getScreenSize().height;
    }

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public void Iniciar_Modificacion() {
        JFrame frame = new JFrame("Seleccionar equipo");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(2, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        equipos = new JComboBox<>();
        JButton botonModificar = new JButton("Modificar");
        JButton botonCancelar = new JButton("Cancelar");

        frame.add(new JLabel("Seleccione equipo"));
        frame.add(equipos);
        frame.add(botonModificar);
        frame.add(botonCancelar);
        frame.setVisible(true);

        // Cargar los equipos en el JComboBox
        try {
            for (String nombre : modificar.obtenerEquipos()) {
                equipos.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(frame, "Error al cargar equipos: " + e.getMessage());
        }


        // Acción al presionar "Modificar"
        botonModificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (equipos.getSelectedItem() != null) {
                    String nombreEquipoSeleccionado = (String) equipos.getSelectedItem();
                    AbrirFormularioModificacion(nombreEquipoSeleccionado,modificar.obtener_ID_equipo(nombreEquipoSeleccionado));
                    System.out.println(nombreEquipoSeleccionado);
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un equipo para modificar.");
                }
            }
        });

        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
            }
        });
    }

    private void AbrirFormularioModificacion(String nombreEquipo,int id_eq_seleccionado) {
        JFrame frame = new JFrame("Modificar equipo");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(5, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JTextField nuevoNombre = new JTextField();
        JTextField numeroTitulos = new JTextField();
        numeroTitulos.setText("0");
        JTextField estadio = new JTextField();
        JComboBox<String> nuevoentrenador=new JComboBox<>();
        List<String> entrenadores = modificar.obtenerEntrenadores();
        for (String entrenador : entrenadores) {
            nuevoentrenador.addItem(entrenador);
        }
        JButton botonGuardar = new JButton("Guardar");
        JButton botonCancelar = new JButton("Cancelar");

        frame.add(new JLabel("Nuevo Nombre"));
        frame.add(nuevoNombre);
        frame.add(new JLabel("Número de Títulos"));
        frame.add(numeroTitulos);
        frame.add(new JLabel("Estadio"));
        frame.add(estadio);
        frame.add(new JLabel("Nuevo entrenador"));
        frame.add(nuevoentrenador);
        frame.add(botonGuardar);
        frame.add(botonCancelar);

        frame.setVisible(true);

        botonGuardar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nombreEquipo = nuevoNombre.getText().trim();
                String Nombreestadio = estadio.getText().trim();
                String nTrofeos = numeroTitulos.getText().trim();
                String seleccionado = (String) nuevoentrenador.getSelectedItem();

                if (nombreEquipo.isEmpty() || Nombreestadio.isEmpty() || nTrofeos.isEmpty() || seleccionado == null || seleccionado.isEmpty()) {
                    JOptionPane.showMessageDialog(frame, "Todos los campos deben estar completos.");
                } else if (!nTrofeos.matches("\\d+")) { // Verifica que el número de trofeos sea un número válido
                    JOptionPane.showMessageDialog(frame, "El número de títulos debe ser un número entero válido.");
                } else if (nombreEquipo.length() > 50 || Nombreestadio.length() > 50) {
                    JOptionPane.showMessageDialog(frame, "El nombre del equipo o el estadio no pueden tener más de 50 caracteres.");
                } else {
                    // Separo nombre y apellido del entrenador
                    String[] nombreApellido = seleccionado.split(" ");
                    int trofeos = Integer.parseInt(nTrofeos);

                    // Creo instancia del equipo e insertarlo en la base de datos
                    Equipo equipo = new Equipo(nombreApellido[0], Nombreestadio, trofeos, nombreEquipo);
                    modificar.modificarEquipo(equipo, id_eq_seleccionado);
                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);

                    // Actualizar la lista de entrenadores en el JComboBox
                    nuevoentrenador.removeAllItems();
                    List<String> entrenadores = modificar.obtenerEntrenadores();
                    for (String entrenador : entrenadores) {
                        nuevoentrenador.addItem(entrenador);
                    }
                }
            }
        });


        botonCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
            }
        });
    }
}

