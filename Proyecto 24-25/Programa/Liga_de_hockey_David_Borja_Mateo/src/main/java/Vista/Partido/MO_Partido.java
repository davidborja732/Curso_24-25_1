package Vista.Partido;

import Controlador.Controlador_Partidos.CO_Partidos;
import Modelo.Partidos;
import com.toedter.calendar.JDateChooser;

import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MO_Partido {

    private JFrame frame;
    private CO_Partidos coPartidos;
    private static String mensaje_confirmacion;

    private JComboBox<String> partidos;
    private JDateChooser fecha_partido;
    private JComboBox<String> equipoLocal;
    private JComboBox<String> equipoVisitante;
    private JComboBox<String> ganador;
    private JComboBox<String> arbitro;
    private JButton boton_Modificar;
    private JButton boton_Cancelar;

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public MO_Partido() {
        coPartidos = new CO_Partidos();
    }

    public void Iniciar_Modificacion() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        frame = new JFrame("Modificar partido");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(7, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        partidos = new JComboBox<>();
        fecha_partido = new JDateChooser();
        fecha_partido.setDateFormatString("yyyy-MM-dd");
        equipoLocal = new JComboBox<>();
        equipoVisitante = new JComboBox<>();
        ganador = new JComboBox<>();
        arbitro = new JComboBox<>();
        boton_Modificar = new JButton("Modificar");
        boton_Cancelar = new JButton("Cancelar");

        frame.add(new JLabel("Seleccione partido"));
        frame.add(partidos);
        frame.add(new JLabel("Nueva Fecha"));
        frame.add(fecha_partido);
        frame.add(new JLabel("Equipo Local"));
        frame.add(equipoLocal);
        frame.add(new JLabel("Equipo Visitante"));
        frame.add(equipoVisitante);
        frame.add(new JLabel("Ganador"));
        frame.add(ganador);
        frame.add(new JLabel("Árbitro"));
        frame.add(arbitro);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        cargarPartidos();
        partidos.addActionListener(e -> cargarDatosPartido());

        equipoLocal.addActionListener(e -> actualizarGanador());
        equipoVisitante.addActionListener(e -> actualizarGanador());

        cargarArbitros();

        boton_Modificar.addActionListener(e -> modificarPartido());
        boton_Cancelar.addActionListener(e -> frame.dispose());
    }

    private void cargarEquipos() {
        equipoLocal.removeAllItems();
        equipoVisitante.removeAllItems();

        try {
            List<String> listaEquipos = coPartidos.obtenerEquipos(); // ✅ Obtiene todos los equipos desde la base de datos
            for (String equipo : listaEquipos) {
                equipoLocal.addItem(equipo);
                equipoVisitante.addItem(equipo);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(frame, "Error al cargar equipos: " + e.getMessage());
        }
    }

    private void cargarDatosPartido() {
        if (partidos.getSelectedItem() != null) {
            String partidoSeleccionado = (String) partidos.getSelectedItem();
            String[] equipos = CO_Partidos.extraerEquipos(partidoSeleccionado);

            if (!equipos[0].equals("Error")) {
                cargarEquipos(); // ✅ Cargar todos los equipos antes de asignar los seleccionados
                equipoLocal.setSelectedItem(equipos[0]);
                equipoVisitante.setSelectedItem(equipos[1]);

                ganador.addItem(equipos[0]);
                ganador.addItem(equipos[1]);

                String arbitroDelPartido = coPartidos.obtenerArbitroPartido(equipos[0], equipos[1]);
                List<String> listaArbitros = coPartidos.obtenerArbitros();
                for (String arbitroNombre : listaArbitros) {
                    arbitro.addItem(arbitroNombre);
                    if (arbitroNombre.startsWith(arbitroDelPartido)) {
                        arbitro.setSelectedItem(arbitroNombre);
                    }
                }

                Date fechaDelPartido = coPartidos.obtenerFechaPartido(equipos[0], equipos[1]);
                fecha_partido.setDate(fechaDelPartido);
            } else {
                recogermensaje("Error al procesar los equipos. Formato inválido.");
            }
        }
    }

    private void cargarPartidos() {
        try {
            partidos.removeAllItems();
            List<String> listaPartidos = coPartidos.obtenerPartidos();

            for (String partido : listaPartidos) {
                partidos.addItem(partido);
            }

            if (!listaPartidos.isEmpty()) {
                partidos.setSelectedIndex(0);
                cargarDatosPartido(); // ✅ Asegurar que se cargan los equipos correctamente
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(frame, "Error al cargar partidos: " + e.getMessage());
        }
    }


    private void actualizarGanador() {
        ganador.removeAllItems();
        String localSeleccionado = (String) equipoLocal.getSelectedItem();
        String visitanteSeleccionado = (String) equipoVisitante.getSelectedItem();

        if (localSeleccionado != null) {
            ganador.addItem(localSeleccionado);
        }
        if (visitanteSeleccionado != null) {
            ganador.addItem(visitanteSeleccionado);
        }
    }

    private void cargarArbitros() {
        try {
            for (String nombre : coPartidos.obtenerArbitros()) {
                arbitro.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(frame, "Error al cargar árbitros: " + e.getMessage());
        }
    }

    private void modificarPartido() {
        if (partidos.getSelectedItem() != null && fecha_partido.getDate() != null) {
            Date fechaSeleccionada = fecha_partido.getDate();
            Date fechaActual = new Date();

            if (fechaSeleccionada.after(fechaActual)) {
                JOptionPane.showMessageDialog(frame, "La fecha debe ser la actual o fecha pasada.");
                return;
            }

            String local = (String) equipoLocal.getSelectedItem();
            String visitante = (String) equipoVisitante.getSelectedItem();
            String ganadorSeleccionado = (String) ganador.getSelectedItem();
            String arbitroSeleccionado = (String) arbitro.getSelectedItem();

            SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");
            String fecha_sola = formato_fecha.format(fechaSeleccionada);

            String[] arbitroParts = arbitroSeleccionado.split(" ");
            int idArbitro = Integer.parseInt(arbitroParts[0]);

            int idPartido = coPartidos.obtenerIdPartido(local, visitante);

            Partidos partido = new Partidos(idPartido, fecha_sola, local, visitante, ganadorSeleccionado, idArbitro);
            coPartidos.modificarPartido(partido);

            JOptionPane.showMessageDialog(frame, "Partido modificado correctamente.");
        } else {
            JOptionPane.showMessageDialog(frame, "Seleccione un partido y una fecha para modificar.");
        }
    }
}















