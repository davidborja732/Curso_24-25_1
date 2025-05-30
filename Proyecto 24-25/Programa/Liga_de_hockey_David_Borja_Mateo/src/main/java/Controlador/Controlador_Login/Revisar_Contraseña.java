package Controlador.Controlador_Login;

import Controlador.Conexion;
import Controlador.Ficheros;
import Vista.Vistas_Generales.Interfaz_Arbitros;
import Vista.Vistas_Generales.Interfaz_Seleccion_Tablas;
import Vista.Vistas_Generales.Interfaz_login;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Revisar_Contraseña {
    public Revisar_Contraseña() {
    }

    public void Inicializar_Revision(String usuario, String contrasena) {
        Conexion conexion = new Conexion(); // Creamos una instancia de conexión a la base de datos
        Ficheros ficheros = new Ficheros(); // Instancia para manejo de archivos
        Interfaz_Seleccion_Tablas interfazSeleccionTablas = new Interfaz_Seleccion_Tablas(); // Instancia de interfaz de selección de tablas
        Interfaz_login interfazLogin = new Interfaz_login(); // Instancia de la interfaz de login para mostrar mensajes

        // Validar la contraseña si no es "123456"
        if (!contrasena.equals("123456") && !validarContrasena(contrasena)) {
            interfazLogin.recogermensaje("La contraseña debe tener entre 5 y 10 caracteres, incluir al menos 2 números y una mayúscula.");
            return;
        }

        // Ejecutamos consulta para obtener los usuarios registrados
        ResultSet resultSet = conexion.resultSet("SELECT * FROM usuario");
        Boolean registrado_correctamente = null;

        try {
            while (resultSet.next()) {
                String usuario_base = resultSet.getString("usuario"); // Obtiene usuario desde la base de datos
                String contraseña_base = resultSet.getString("contraseña"); // Obtiene contraseña desde la base de datos

                // Si el usuario y contraseña coinciden con los registros en la base de datos
                if (usuario_base.equals(usuario) && contraseña_base.equals(contrasena)) {
                    interfazLogin.recogermensaje("Registro correcto");

                    // Verificamos si el usuario es árbitro o administrador
                    if (usuario.equals("Arbitro")) {
                        ficheros.escritura(new File("Ficheros/log.txt"), "Registro Arbitro " + LocalDateTime.now());
                        Interfaz_Arbitros interfazArbitros=new Interfaz_Arbitros();
                        interfazArbitros.Inicializar_Interfaz_Arbitro();
                    } else if (usuario.equals("Admin")) {
                        ficheros.escritura(new File("Ficheros/log.txt"), "Registro Administrador " + LocalDateTime.now());
                        interfazSeleccionTablas.Inicializar_Seleccion();
                    }

                    registrado_correctamente = true;
                    break;
                } else {
                    registrado_correctamente = false;
                }
            }

            // Si la autenticación falla, mostramos mensaje de error
            if (!registrado_correctamente) {
                interfazLogin.recogermensaje("Contraseña incorrecta");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    /*
     Metodo para validar contraseña que comprueba que=
     Tiene entre 5 y 10 caracteres.
     Contiene al menos una letra mayúscula.
     Contiene al menos dos números.
     */
    private boolean validarContrasena(String contrasena) {
        String regex = "^(?=.*[A-Z])(?=(?:.*\\d){2})[A-Za-z\\d]{5,10}$"; // Expresión regular para validar la contraseña
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(contrasena);
        return matcher.matches(); // Retorna true si la contraseña cumple con el formato esperado
    }
}

