package Vista.Insertar;

import Controlador.Controlador_Partidos.Anadir;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import Modelo.Partidos;
import com.toedter.calendar.JDateChooser;

public class IN_Partido {
    private static String mensaje_confirmacion;
    public void recogermensaje(String mensaje){
        mensaje_confirmacion=mensaje;
    }
    public IN_Partido() {
    }
    public void Iniciar_insercion() {
        Anadir anadir = new Anadir(); // Instancia de la clase Anadir
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        JFrame frame = new JFrame("Añadir partido");
        frame.setSize(ancho/4, alto/2);
        frame.setLayout(new GridLayout(3, 2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        JDateChooser fecha_partido = new JDateChooser();
        fecha_partido.setDateFormatString("yyyy-MM-dd");
        JComboBox<String> arbitros=new JComboBox<>();
        JButton boton_Anadir = new JButton("Añadir");
        JButton boton_Cancelar = new JButton("Cancelar");
        frame.add(new JLabel("Fecha= "));
        frame.add(fecha_partido);
        frame.add(new JLabel("ID_arbitro"));
        frame.add(arbitros);
        try {
            for (String nombre : anadir.obtenerarbitros()) {
                arbitros.addItem(nombre);
            }
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage());
        }
        frame.add(boton_Anadir);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        boton_Anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String seleccionado = (String) arbitros.getSelectedItem(); // Obtiene el valor seleccionado
                assert seleccionado != null;
                String[] id_arbitro = seleccionado.split(" ");
                Date fecha = fecha_partido.getDate();
                SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");
                if (fecha != null) {
                    String fecha_sola=formato_fecha.format(fecha_partido.getDate());
                    System.out.println(fecha_sola+" "+Integer.parseInt(id_arbitro[0]));
                    //Partidos partido= new Partidos(Date.parse(fecha_sola),Integer.parseInt(id_arbitro[0]));
                    //anadir.Anadir_Partido(partido);
                    JOptionPane.showMessageDialog(frame,mensaje_confirmacion);
                }else {
                    JOptionPane.showMessageDialog(frame,"La fecha no puede estar vacia");
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
}
