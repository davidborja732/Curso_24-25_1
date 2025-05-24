package Vista.Modificar;

import Controlador.Controlador_Juega.Modificar;
import Modelo.Juega;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MO_Juega {
    private final int ancho;
    private final int alto;
    Modificar modificar=new Modificar();
    private static String mensaje_confirmacion;
    private JFrame frameSeleccion;
    private JComboBox<Integer> partidos;
    public MO_Juega() {
        ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        alto = Toolkit.getDefaultToolkit().getScreenSize().height;
    }
    public void recogermensaje(String mensaje){
        mensaje_confirmacion=mensaje;
    }
    public void Iniciar_Modificacion() {
        frameSeleccion = new JFrame("Seleccionar partido");
        frameSeleccion.setSize(ancho/4,alto/2);
        frameSeleccion.setLayout(new GridLayout(2, 2));
        frameSeleccion.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frameSeleccion.setLocationRelativeTo(null);

        partidos = new JComboBox<>();
        JButton botonModificar = new JButton("Modificar");
        JButton botonCancelar = new JButton("Cancelar");

        frameSeleccion.add(new JLabel("Seleccione partido"));
        frameSeleccion.add(partidos);
        frameSeleccion.add(botonModificar);
        frameSeleccion.add(botonCancelar);

        // Cargar los partidos en el JComboBox
        try {
            for (int id : modificar.obtenerPartidos()) {
                partidos.addItem(id);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar partidos: " + e.getMessage());
        }

        frameSeleccion.setVisible(true);

        // Acción al presionar "Modificar"
        botonModificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (partidos.getSelectedItem() != null) {
                    int idPartidoSeleccionado = (int) partidos.getSelectedItem();
                    AbrirFormularioModificacion(idPartidoSeleccionado);
                } else {
                    JOptionPane.showMessageDialog(frameSeleccion, "Seleccione un partido para modificar.");
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

    private void AbrirFormularioModificacion(int idPartido) {
        JFrame frameModificar = new JFrame("Modificar equipo de partido");
        frameModificar.setSize(ancho/4,alto/2);
        frameModificar.setLayout(new GridLayout(3, 2));
        frameModificar.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frameModificar.setLocationRelativeTo(null);

        JComboBox<String> equipos = new JComboBox<>();
        JComboBox<String> Rol = new JComboBox<>();
        JButton botonGuardar = new JButton("Guardar");
        JButton botonCancelar = new JButton("Cancelar");

        frameModificar.add(new JLabel("Nuevo equipo"));
        frameModificar.add(equipos);
        frameModificar.add(new JLabel("Nuevo Rol"));
        frameModificar.add(Rol);

        // Cargar los equipos en el JComboBox

        try {
            for (String id : modificar.obtenerEquipos()) {
                equipos.addItem(id);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar equipos: " + e.getMessage());
        }

        Rol.addItem("Local");
        Rol.addItem("Visitante");

        frameModificar.add(botonGuardar);
        frameModificar.add(botonCancelar);
        frameModificar.setVisible(true);

        botonGuardar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (equipos.getSelectedItem() != null && Rol.getSelectedItem() != null) {
                    Juega juega = new Juega(modificar.obtener_ID_equipo(String.valueOf(equipos.getSelectedItem())), idPartido, Rol.getSelectedItem().toString());
                    System.out.println(juega.getID_equipo());
                    System.out.println(juega.getID_partido());
                    System.out.println(juega.getROL());
                    modificar.Modificar_juega(juega);
                    JOptionPane.showMessageDialog(frameModificar, mensaje_confirmacion);
                } else {
                    JOptionPane.showMessageDialog(frameModificar, "Seleccione un equipo y un rol.");
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
