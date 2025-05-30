package Vista.Vistas_Generales;

import Controlador.Conexion;
import Controlador.Controlador_Cambio_Contraseña.Cambio_Contraseña;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_Cambiar_Contraseña {
    private static String mensaje_confirmacion;

    // Constructor de la clase
    public Interfaz_Cambiar_Contraseña() {
    }

    // Metodo para almacenar mensajes y mostrarlos al usuario
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Metodo para inicializar la interfaz de cambio de contraseña
    public void Inicializar_Cambio() {
        // Obtenemos las dimensiones de la pantalla
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        // Instanciamos las clases necesarias
        Interfaz_login interfazLogin = new Interfaz_login();
        Conexion conexion = new Conexion();

        // Creamos la ventana de cambio de contraseña
        JFrame frame = new JFrame("Cambiar contraseña");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(3, 2)); // Ajustamos el GridLayout
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null); // Centramos la ventana

        // Campos de entrada de contraseña
        JTextField Contrasena_Nueva = new JTextField();
        JPasswordField Contrasena_Actual = new JPasswordField();

        // Botones de accion
        JButton boton_Cambiar_Contrasena = new JButton("Cambiar Contraseña");
        JButton boton_Cancelar = new JButton("Cancelar Cambio");
        // Agregamos los elementos a la ventana
        frame.add(new JLabel("Contraseña actual ="));
        frame.add(Contrasena_Actual);
        frame.add(new JLabel("Contraseña nueva ="));
        frame.add(Contrasena_Nueva);
        frame.add(boton_Cambiar_Contrasena);
        frame.add(boton_Cancelar);

        // Accion cuando se presiona el boton de cambiar contraseña
        boton_Cambiar_Contrasena.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Cambio_Contraseña cambioContraseña = new Cambio_Contraseña(); // Instancia de Cambio_Contraseña
                cambioContraseña.Inicializar_cambio(Contrasena_Actual.getText(), Contrasena_Nueva.getText()); // Validamos y cambiamos la contraseña
                JOptionPane.showMessageDialog(frame, mensaje_confirmacion); // Mostramos el mensaje de confirmacion al usuario
            }
        });

        // Accion cuando se presiona el boton de cancelar
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose(); // Cerramos la ventana actual
                interfazLogin.Inicializar_Login(); // Volvemos a la interfaz de login
            }
        });

        frame.setVisible(true); // Hacemos visible la ventana
    }
}
