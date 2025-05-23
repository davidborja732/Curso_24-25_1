package Vista.Modificar;

import Controlador.Controlador_Partidos.Modificar;
import Modelo.Partidos;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.List;

import com.toedter.calendar.JDateChooser;

public class MO_Partido {
    private JFrame frame;
    private Modificar modificar;
    private static String mensaje_confirmacion;
    public void recogermensaje(String mensaje){
        mensaje_confirmacion=mensaje;
    }

    public MO_Partido() {

    }


    public void Iniciar_Modificacion() {
        modificar=new Modificar();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        frame = new JFrame("Modificar partido");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(4, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JComboBox<Integer> partidos = new JComboBox<>();
        JDateChooser fecha_partido = new JDateChooser();
        fecha_partido.setDateFormatString("yyyy-MM-dd");
        JComboBox<String> arbitros = new JComboBox<>();
        JButton boton_Modificar = new JButton("Modificar");
        JButton boton_Cancelar = new JButton("Cancelar");

        frame.add(new JLabel("Seleccione partido"));
        frame.add(partidos);
        frame.add(new JLabel("Nueva Fecha"));
        frame.add(fecha_partido);
        frame.add(new JLabel("Nuevo Árbitro"));
        frame.add(arbitros);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        // Cargar partidos en el JComboBox
        try {
            for (int id_partido : modificar.obtenerPartidos()) {
                partidos.addItem(id_partido);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        // Cargar árbitros en el JComboBox
        try {
            for (String nombre : modificar.obtenerarbitros()) {
                arbitros.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }

        // Acción al presionar "Modificar"
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (partidos.getSelectedItem() != null && fecha_partido.getDate() != null) {
                    int partidoSeleccionado = (int) partidos.getSelectedItem();
                    String seleccionado = (String) arbitros.getSelectedItem();
                    String[] id_arbitro = seleccionado.split(" ");
                    SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");
                    String fecha_sola = formato_fecha.format(fecha_partido.getDate());
                    System.out.println(id_arbitro[0]);
                    Partidos partido = new Partidos(partidoSeleccionado, fecha_sola, Integer.parseInt(id_arbitro[0]));
                    modificar.modificarPartido(partido);

                    JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
                    frame.dispose();
                    Modificar_ganador(partidoSeleccionado);
                } else {
                    JOptionPane.showMessageDialog(frame, "Seleccione un partido y una fecha para modificar.");
                }
            }
        });

        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
            }
        });
    }
    public void Modificar_ganador(int id_partido){
        modificar=new Modificar();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        frame = new JFrame("Modificar partido");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(2, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        JButton boton_Modificar = new JButton("Modificar");
        JButton boton_Cancelar = new JButton("Cancelar");
        JComboBox<String> equipos_juegan = new JComboBox<>();
        for (String equipos : modificar.obtener_local_y_visitante(id_partido)){
            equipos_juegan.addItem(equipos);
        }
        frame.add(new JLabel("Seleccione el ganador"));
        frame.add(equipos_juegan);
        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true);
        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String[] id_equipo_seleccionado=equipos_juegan.getSelectedItem().toString().split(" ");
                modificar.modificarganador(Integer.parseInt(id_equipo_seleccionado[0]),id_partido);
                JOptionPane.showMessageDialog(frame, mensaje_confirmacion);
            }
        });

    }
}


