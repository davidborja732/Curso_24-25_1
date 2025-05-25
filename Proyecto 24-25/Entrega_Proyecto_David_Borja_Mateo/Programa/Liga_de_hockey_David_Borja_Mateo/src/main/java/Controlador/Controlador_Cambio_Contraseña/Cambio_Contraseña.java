package Controlador.Controlador_Cambio_Contraseña;

import Controlador.Conexion;
import Vista.Interfaz_Cambiar_Contraseña;
import Vista.Interfaz_login;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Cambio_Contraseña {
    Interfaz_Cambiar_Contraseña interfazCambiarContraseña;

    // Constructor de la clase
    public Cambio_Contraseña() {
        interfazCambiarContraseña = new Interfaz_Cambiar_Contraseña();
    }

    // Metodo para inicializar el cambio de contraseña
    public void Inicializar_cambio(String Contrasena_Actual, String Contrasena_Nueva) {
        try {
            Conexion conexion = new Conexion();
            Interfaz_login interfazLogin = new Interfaz_login();

            // Mostrar un mensaje recordando los requisitos de la nueva contraseña
            interfazCambiarContraseña.recogermensaje(
                    "La nueva contraseña debe tener entre 5 y 10 caracteres, incluir al menos 2 numeros y una mayuscula."
            );


            // Consultamos la base de datos para verificar la contraseña actual
            ResultSet resultSet = conexion.resultSet("SELECT contraseña FROM usuario WHERE usuario='Admin'");


            while (resultSet.next()) {
                String contraseña_base = resultSet.getString("contraseña");
                // Validamos que los campos no esten vacios
                if (Contrasena_Actual.isBlank() || Contrasena_Nueva.isBlank()) {
                    interfazCambiarContraseña.recogermensaje("Hay un campo vacio.");
                }


                // Verificamos que la contraseña actual coincida con la registrada en la base de datos
                if (contraseña_base.equals(Contrasena_Actual)) {

                    // Evitamos que el usuario ingrese la misma contraseña
                    if (contraseña_base.equals(Contrasena_Nueva)) {
                        interfazCambiarContraseña.recogermensaje("No puedes cambiar la contraseña por la misma.");
                    } else if (!validarContrasena(Contrasena_Nueva)) {
                        interfazCambiarContraseña.recogermensaje("La contraseña no cumple con los requisitos de seguridad.");
                    } else {
                        // Procedemos con la actualizacion de la contraseña
                        PreparedStatement preparedStatement = conexion.prepared(
                                "UPDATE usuario SET contraseña=? WHERE usuario='Admin'"
                        );
                        preparedStatement.setString(1, Contrasena_Nueva);
                        int filas = preparedStatement.executeUpdate();

                        // Verificamos si el cambio se realizo correctamente
                        if (filas > 0) {
                            interfazCambiarContraseña.recogermensaje("Contraseña cambiada correctamente.");
                        }
                    }
                } else {
                    interfazCambiarContraseña.recogermensaje("La contraseña actual es incorrecta.");
                }
            }


        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    /*
     Metodo para validar una contraseña que=
     Debe tener entre 5 y 10 caracteres.
     Debe contener al menos una letra mayuscula.
     Debe contener al menos dos numeros.
     */
    private boolean validarContrasena(String contrasena) {
        String regex = "^(?=.*[A-Z])(?=(?:.*\\d){2})[A-Za-z\\d]{5,10}$"; // Expresion regular
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(contrasena);
        return matcher.matches(); // Devuelve true si la contraseña cumple con los requisitos
    }
}
