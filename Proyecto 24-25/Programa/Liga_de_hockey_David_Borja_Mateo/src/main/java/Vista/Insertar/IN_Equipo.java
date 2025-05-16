package Vista.Insertar;

import Controlador.Conexion;
import Controlador.Controlador_Equipos.Anadir;
import Modelo.Equipo;


import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.List;

public class IN_Equipo {
    private static String mensaje_confirmacion;
    Anadir anadir;
    public void recogermensaje(String mensaje){
        mensaje_confirmacion=mensaje;
    }
    public IN_Equipo() {
    }
    public void Iniciar_insercion(){
        anadir=new Anadir();
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        Conexion conexion=new Conexion();
        JFrame frame;
        frame=new JFrame("Insertar equipo");
        frame.setSize(ancho/4,alto/2);
        frame.setLayout(new GridLayout(5,2));
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        JComboBox<String> DNI_entrenador=new JComboBox<>();
        JTextField Estadio=new JTextField();
        JTextField N_trofeos=new JTextField();
        N_trofeos.setText("0");
        JTextField Nombre_equipo=new JTextField();
        JButton boton_anadir =new JButton("Anadir");
        JButton boton_Cancelar=new JButton("Cancelar");
        frame.add(new JLabel("Nombre equipo "));
        frame.add(Nombre_equipo);
        frame.add(new JLabel("Numero trofeos (Palmares)"));
        frame.add(N_trofeos);
        frame.add(new JLabel("Estadio "));
        frame.add(Estadio);
        frame.add(new JLabel("Entrenador "));
        frame.add(DNI_entrenador);
        frame.add(boton_anadir);
        frame.add(boton_Cancelar);
        // Cargar datos en el JComboBox
        List<String> entrenadores = anadir.obtenerEntrenadores();
        for (String entrenador : entrenadores) {
            DNI_entrenador.addItem(entrenador); // Añadir el nombre del entrenador
        }

        frame.setVisible(true);
        boton_anadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String seleccionado = (String) DNI_entrenador.getSelectedItem(); // Obtiene el valor seleccionado
                String[] nombre_apellido = seleccionado.split(" ");
                // Divide la cadena por espacios
                Equipo equipo=new Equipo(nombre_apellido[0],Estadio.getText(),Integer.parseInt(N_trofeos.getText().replace(" ","_")),Nombre_equipo.getText().replace(" ","_"));
                anadir.Anadir_equipo(equipo);
                JOptionPane.showMessageDialog(frame,mensaje_confirmacion);

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
