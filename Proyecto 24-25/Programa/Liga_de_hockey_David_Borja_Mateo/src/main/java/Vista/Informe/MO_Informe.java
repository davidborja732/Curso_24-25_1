package Vista.Informe;

import Controlador.Controlador_Informe.CO_Informe;
import Modelo.Informe;

import javax.swing.*;
import java.awt.*;
import java.util.List;

public class MO_Informe {
    private static String mensaje_confirmacion;
    private CO_Informe coInforme;
    private JComboBox<String> partido_usuario;
    private JTextPane equipoLocal;
    private JTextPane equipoVisitante;
    private JTextPane ID_arbitro;
    private JTextField N_Rojas;
    private JTextField N_Amarillas;

    public MO_Informe() {
        coInforme = new CO_Informe();
    }

    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    public void Iniciar_Modificacion() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Modificar informe");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(7, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        partido_usuario = new JComboBox<>();
        equipoLocal = new JTextPane();
        equipoVisitante = new JTextPane();
        ID_arbitro = new JTextPane();
        N_Rojas = new JTextField();
        N_Amarillas = new JTextField();
        JButton boton_Modificar = new JButton("Modificar");
        JButton boton_Cancelar = new JButton("Cancelar");

        equipoLocal.setEditable(false);
        equipoVisitante.setEditable(false);
        ID_arbitro.setEditable(false);

        frame.add(new JLabel("Partido"));
        frame.add(partido_usuario);
        frame.add(new JLabel("Equipo Local"));
        frame.add(equipoLocal);
        frame.add(new JLabel("Equipo Visitante"));
        frame.add(equipoVisitante);
        frame.add(new JLabel("Árbitro"));
        frame.add(ID_arbitro);
        frame.add(new JLabel("Tarjetas Rojas"));
        frame.add(N_Rojas);
        frame.add(new JLabel("Tarjetas Amarillas"));
        frame.add(N_Amarillas);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);

        cargarPartidos();

        partido_usuario.addActionListener(e -> cargarDatosPartido());

        boton_Modificar.addActionListener(e -> modificarInforme());
        boton_Cancelar.addActionListener(e -> frame.dispose());

        frame.setVisible(true);
    }

    private void cargarPartidos() {
        try {
            partido_usuario.removeAllItems();
            List<String> listaPartidos = coInforme.obtenerPartidos();

            for (String partido : listaPartidos) {
                String[] equipos = CO_Informe.extraerEquipos(partido);
                if (!equipos[0].equals("Error")) {
                    int idPartido = coInforme.obtenerIdPartido(equipos[0], equipos[1]);

                    if (coInforme.tieneInforme(idPartido)) { // Solo agregar partidos con informe
                        partido_usuario.addItem(partido);
                    }
                }
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar partidos: " + e.getMessage());
        }
    }

    private void cargarDatosPartido() {
        equipoLocal.setText("");
        equipoVisitante.setText("");
        ID_arbitro.setText("");
        N_Rojas.setText("");
        N_Amarillas.setText("");

        if (partido_usuario.getSelectedItem() != null) {
            String partidoSeleccionado = (String) partido_usuario.getSelectedItem();
            String[] localyvisi = CO_Informe.extraerEquipos(partidoSeleccionado);

            if (!localyvisi[0].equals("Error")) {
                equipoLocal.setText(localyvisi[0]);
                equipoVisitante.setText(localyvisi[1]);

                int idPartido = coInforme.obtenerIdPartido(localyvisi[0], localyvisi[1]);
                int idArbitro = Integer.parseInt(coInforme.obtenerArbitroPartido(localyvisi[0], localyvisi[1]));
                String nombreArbitro = coInforme.obtenerNombreArbitroPorId(idArbitro);

                ID_arbitro.setText(nombreArbitro);

                // Obtener tarjetas rojas y amarillas del informe registrado
                Informe informe = coInforme.obtenerDatosInforme(idPartido);
                N_Rojas.setText(String.valueOf(informe.getN_rojas()));
                N_Amarillas.setText(String.valueOf(informe.getN_amarillas()));
            } else {
                JOptionPane.showMessageDialog(null, "Error en el formato del partido.");
            }
        }
    }

    private void modificarInforme() {
        if (partido_usuario.getSelectedItem() != null) {
            String partidoSeleccionado = (String) partido_usuario.getSelectedItem();
            String[] localyvisi = CO_Informe.extraerEquipos(partidoSeleccionado);

            if (!localyvisi[0].equals("Error")) {
                int idPartido = coInforme.obtenerIdPartido(localyvisi[0], localyvisi[1]);
                int idArbitro = Integer.parseInt(coInforme.obtenerArbitroPartido(localyvisi[0], localyvisi[1]));

                String rojasStr = N_Rojas.getText().trim();
                String amarillasStr = N_Amarillas.getText().trim();
                if (!rojasStr.matches("\\d+") || !amarillasStr.matches("\\d+")) {
                    JOptionPane.showMessageDialog(null, "Los valores de tarjetas deben ser números enteros.");
                    return;
                }

                int nRojas = Integer.parseInt(rojasStr);
                int nAmarillas = Integer.parseInt(amarillasStr);

                Informe informe = new Informe(nRojas,nAmarillas, coInforme.obtenerIdInforme(localyvisi[0], localyvisi[1]),idPartido,idArbitro,localyvisi[0], localyvisi[1]);
                coInforme.modificarInforme(informe);

                JOptionPane.showMessageDialog(null, "Informe modificado correctamente.");
            } else {
                JOptionPane.showMessageDialog(null, "Error en el formato del partido.");
            }
        } else {
            JOptionPane.showMessageDialog(null, "Seleccione un partido para modificar el informe.");
        }
    }
}








