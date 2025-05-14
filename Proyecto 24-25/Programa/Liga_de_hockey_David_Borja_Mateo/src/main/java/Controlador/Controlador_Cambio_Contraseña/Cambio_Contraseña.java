package Controlador.Controlador_Cambio_Contraseña;

import Controlador.Conexion;
import Vista.Interfaz_Cambiar_Contraseña;
import Vista.Interfaz_login;

import javax.swing.*;
import java.awt.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cambio_Contraseña {
    Interfaz_Cambiar_Contraseña interfazCambiarContraseña;
    public Cambio_Contraseña() {
        interfazCambiarContraseña=new Interfaz_Cambiar_Contraseña();
    }
    public void Inicializar_cambio(String Contrasena_Actual, String Contrasena_Nueva){
        try {
            Conexion conexion=new Conexion();
            Interfaz_login interfazLogin=new Interfaz_login();
            ResultSet resultSet= conexion.resultSet("SELECT contraseña FROM usuario");
            while (resultSet.next()){
                String contraseña_base= resultSet.getString("contraseña");
                if (Contrasena_Actual.isBlank() || Contrasena_Nueva.isBlank()){
                    interfazCambiarContraseña.recogermensaje("Hay un campo vacio");
                    break;
                } else if (contraseña_base.equals(Contrasena_Actual)){
                    if (contraseña_base.equals(Contrasena_Nueva)){
                        interfazCambiarContraseña.recogermensaje("No puedes cambiar la contraseña por la misma");
                        break;
                    }else {
                        PreparedStatement preparedStatement = conexion.prepared("UPDATE usuario SET contraseña=? WHERE usuario='Admin'");
                        preparedStatement.setString(1, Contrasena_Nueva);
                        int filas = preparedStatement.executeUpdate();
                        if (filas > 0) {
                            interfazCambiarContraseña.recogermensaje("Contraseña cambiada correctamanete");
                            interfazLogin.Inicializar_Login();
                            break;
                        }
                    }
                } else {
                    interfazCambiarContraseña.recogermensaje("Algo ha fallado");
                }
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
