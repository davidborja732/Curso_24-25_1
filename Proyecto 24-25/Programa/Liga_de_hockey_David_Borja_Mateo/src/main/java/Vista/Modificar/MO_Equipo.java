package Vista.Modificar;

import Controlador.Controlador_Equipos.CO_Equipos;
import Modelo.Equipo;

import javax.swing.*;
import java.awt.*;
import java.util.List;

public class MO_Equipo {

    private final int ancho;
    private final int alto;
    private CO_Equipos coEquipos;
    private static String mensaje_confirmacion;
    private JComboBox<String> equipos;
    private JComboBox<String> ganador;

    public MO_Equipo() {
        ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        alto = Toolkit.getDefaultToolkit().getScreenSize().height;
    }

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public void Iniciar_Modificacion() {
        coEquipos = new CO_Equipos();

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

        try {
            for (String nombre : coEquipos.obtenerEquipos()) {
                equipos.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(frame, "Error al cargar equipos: " + e.getMessage());
        }

        botonModificar.addActionListener(e -> {
            if (equipos.getSelectedItem() != null) {
                String nombreEquipoSeleccionado = (String) equipos.getSelectedItem();
                int idEquipo = coEquipos.obtenerIDEquipo(nombreEquipoSeleccionado);
                frame.dispose();
                AbrirFormularioModificacion(nombreEquipoSeleccionado, idEquipo);
            } else {
                JOptionPane.showMessageDialog(frame, "Seleccione un equipo para modificar.");
            }
        });

        botonCancelar.addActionListener(e -> frame.dispose());
    }

    private void AbrirFormularioModificacion(String nombreEquipo, int id_eq_seleccionado) {
        JFrame frame = new JFrame("Modificar equipo");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(5, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        Equipo equipo = coEquipos.obtenerDatosEquipo(id_eq_seleccionado);
        JTextField nuevoNombre = new JTextField(nombreEquipo);
        JTextField numeroTitulos = new JTextField(String.valueOf(equipo.getN_trofeos()));
        JTextField estadio = new JTextField(equipo.getEstadio());
        JComboBox<String> nuevoEntrenador = new JComboBox<>();
        ganador = new JComboBox<>();


        List<String> entrenadores = coEquipos.obtener_Entrenadores_modificar(equipo.getNombre());
        List<String> entrenador_actual = coEquipos.obtenerEntrenadorActual(equipo.getNombre());

        for (String entrenador : entrenadores) {
            if (nuevoEntrenador.getItemCount() < 2) {
                nuevoEntrenador.addItem(entrenador);
            }
        }
        for (String entrenadorActual : entrenador_actual) {
            if (nuevoEntrenador.getItemCount() < 2) {
                nuevoEntrenador.addItem(entrenadorActual);
            }
        }

        String entrenadorActual = equipo.getDni_Entrenador();
        if (entrenadorActual != null && !entrenadorActual.isEmpty()) {
            for (int i = 0; i < nuevoEntrenador.getItemCount(); i++) {
                if (nuevoEntrenador.getItemAt(i).startsWith(entrenadorActual)) {
                    nuevoEntrenador.setSelectedIndex(i);
                    break;
                }
            }
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
        frame.add(nuevoEntrenador);
        frame.add(botonGuardar);
        frame.add(botonCancelar);
        frame.setVisible(true);

        botonGuardar.addActionListener(e -> {
            String nombreNuevoEquipo = nuevoNombre.getText().trim();
            String nombreEstadio = estadio.getText().trim();
            String numTrofeos = numeroTitulos.getText().trim();
            String entrenadorSeleccionadoCompleto = (String) nuevoEntrenador.getSelectedItem();

            String entrenadorSeleccionado = "";
            if (entrenadorSeleccionadoCompleto != null && !entrenadorSeleccionadoCompleto.isEmpty()) {
                entrenadorSeleccionado = entrenadorSeleccionadoCompleto.split(" ")[0];
            }

            if (nombreNuevoEquipo.isEmpty() || nombreEstadio.isEmpty() || numTrofeos.isEmpty() || entrenadorSeleccionado.isEmpty()) {
                JOptionPane.showMessageDialog(frame, "Todos los campos deben estar completos.");
            } else if (!numTrofeos.matches("\\d+")) {
                JOptionPane.showMessageDialog(frame, "El número de títulos debe ser un número entero válido.");
            } else {
                int trofeos = Integer.parseInt(numTrofeos);
                Equipo equipoModificado = new Equipo(nombreNuevoEquipo, trofeos, entrenadorSeleccionado, id_eq_seleccionado, nombreEstadio);
                coEquipos.modificarEquipo(equipoModificado);
                JOptionPane.showMessageDialog(frame, "Equipo modificado exitosamente.");
                frame.dispose();
                Iniciar_Modificacion();
            }
        });

        botonCancelar.addActionListener(e -> frame.dispose());
    }
}






