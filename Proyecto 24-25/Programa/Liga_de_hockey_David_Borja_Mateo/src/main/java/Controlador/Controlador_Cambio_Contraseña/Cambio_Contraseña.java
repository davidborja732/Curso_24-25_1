package Controlador.Controlador_Cambio_Contraseña;

import Controlador.Conexion;
import Vista.Interfaz_login;

import javax.swing.*;
import java.awt.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cambio_Contraseña {
    public Cambio_Contraseña() {
    }
    public void Inicializar_cambio(String Contrasena_Actual, String Contrasena_Nueva, Frame frame){
        try {
            Conexion conexion=new Conexion();
            Interfaz_login interfazLogin=new Interfaz_login();
            ResultSet resultSet= conexion.resultSet("SELECT contraseña FROM usuario");
            while (resultSet.next()){
                String contraseña_base= resultSet.getString("contraseña");
                if (Contrasena_Actual.isBlank() || Contrasena_Nueva.isBlank()){
                    JOptionPane.showMessageDialog(frame, "Hay un campo vacio");
                    break;
                } else if (contraseña_base.equals(Contrasena_Actual)){
                    if (contraseña_base.equals(Contrasena_Nueva)){
                        JOptionPane.showMessageDialog(frame, "No puedes cambiar la contraseña por la misma");
                        break;
                    }else {
                        PreparedStatement preparedStatement = conexion.prepared("UPDATE usuario SET contraseña=? WHERE usuario='Admin'");
                        preparedStatement.setString(1, Contrasena_Nueva);
                        int filas = preparedStatement.executeUpdate();
                        if (filas > 0) {
                            JOptionPane.showMessageDialog(frame, "Contraseña cambiada correctamanete");
                            frame.dispose();
                            interfazLogin.Inicializar_Login();
                            break;
                        }
                    }
                } else {
                    JOptionPane.showMessageDialog(frame, "Algo ha fallado");
                }
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
