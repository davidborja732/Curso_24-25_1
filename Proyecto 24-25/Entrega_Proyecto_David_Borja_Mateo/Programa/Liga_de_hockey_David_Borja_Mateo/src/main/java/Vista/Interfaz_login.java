package Vista;

import Controlador.Controlador_Login.Revisar_Contraseña;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Interfaz_login {
    private static String mensaje_confirmacion;

    // Constructor de la clase
    public Interfaz_login() {
    }

    // Metodo para almacenar mensajes y mostrarlos al usuario
    public void recogermensaje(String mensaje) {
        mensaje_confirmacion = mensaje;
    }

    // Metodo para inicializar la interfaz de login
    public void Inicializar_Login() {
        // Se crean instancias de las interfaces necesarias
        Interfaz_Seleccion_Tablas interfazSeleccionTablas = new Interfaz_Seleccion_Tablas();
        Interfaz_Arbitros interfazArbitros = new Interfaz_Arbitros();

        // Obtiene las dimensiones de la pantalla para calcular el tamaño de la ventana
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        // Crea la ventana del login con titulo
        JFrame frame = new JFrame("Login Programa");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new GridLayout(3, 2)); // Usa una cuadricula de 3 filas y 2 columnas
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null); // Centra la ventana en la pantalla

        // Crea los elementos de la interfaz grafica
        String[] opcionesUsuario = {"Admin", "Arbitro"}; // Opciones de usuario
        JComboBox<String> usuario = new JComboBox<>(opcionesUsuario); // Menu desplegable para seleccionar usuario
        JPasswordField contrasena = new JPasswordField(); // Campo de contraseña
        JButton boton_Iniciar_Sesion = new JButton("Iniciar Sesion"); // Boton para iniciar sesion
        JButton boton_Cambiar_Contraseña = new JButton("Cambiar Contraseña"); // Boton para cambiar contraseña

        // Agrega los elementos a la ventana
        frame.add(new JLabel("Usuario ="));
        frame.add(usuario);
        frame.add(new JLabel("Contraseña ="));
        frame.add(contrasena);
        frame.add(boton_Iniciar_Sesion);
        frame.add(boton_Cambiar_Contraseña);

        frame.setVisible(true); // Hace visible la ventana de login

        boton_Iniciar_Sesion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Revisar_Contraseña revisarContraseña = new Revisar_Contraseña(); // Instancia de la clase Revisar_Contraseña
                revisarContraseña.Inicializar_Revision(String.valueOf(usuario.getSelectedItem()), contrasena.getText());
                if (contrasena.getText().isBlank()){
                    JOptionPane.showMessageDialog(frame, "EL campo no puede estar vacio");
                }else if ("Registro correcto".equals(mensaje_confirmacion)) {
                    frame.dispose(); // Cierra la interfaz después de mostrar el mensaje
                    JOptionPane.showMessageDialog(frame, "Inicio de sesión exitoso.");
                } else {
                    JOptionPane.showMessageDialog(frame, "Contraseña incorrecta.");
                }
            }
        });



        // Accion cuando se presiona "Cambiar Contraseña"
        boton_Cambiar_Contraseña.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(frame, "La contraseña debe de tener una duracion de 5 a 10 caracteres " +
                        "ademas de incluir dos numero y una mayuscula como minimo");
                Interfaz_Cambiar_Contraseña interfazCambiarContraseña = new Interfaz_Cambiar_Contraseña(); // Instancia de la interfaz de cambio de contraseña
                frame.dispose(); // Cerramos la ventana de login
                interfazCambiarContraseña.Inicializar_Cambio(); // Abrimos la interfaz de cambio de contraseña
            }
        });
    }
}
