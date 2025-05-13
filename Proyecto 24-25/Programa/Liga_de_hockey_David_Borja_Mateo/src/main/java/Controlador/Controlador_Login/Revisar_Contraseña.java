package Controlador.Controlador_Login;

import Controlador.Conexion;
import Controlador.Ficheros;
import Vista.Interfaz_Arbitros;
import Vista.Interfaz_Seleccion_Tablas;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class Revisar_Contraseña {
    public Revisar_Contraseña() {
    }
    public void Inicializar_Revision(String usuario, String contrasena, Frame frame){
        Conexion conexion=new Conexion();
        Ficheros ficheros=new Ficheros();
        Interfaz_Arbitros interfazArbitros=new Interfaz_Arbitros();
        Interfaz_Seleccion_Tablas interfazSeleccionTablas=new Interfaz_Seleccion_Tablas();
        ResultSet resultSet= conexion.resultSet("SELECT * FROM usuario");
        Boolean registrado_correctamente = null;
        try {
            while (resultSet.next()){
                String usuario_base= resultSet.getString("usuario");
                String contraseña_base= resultSet.getString("contraseña");
                if (usuario_base.equals(usuario) && contraseña_base.equals(contrasena)){
                    JOptionPane.showMessageDialog(frame, "Registro correcto");
                    if (usuario.equals("Arbitro")){
                        ficheros.escritura(new File("Ficheros/log.txt"),"Registro Arbitro "+ LocalDateTime.now());
                        frame.dispose();
                        interfazArbitros.Inicializar_Interfaz_Arbitro();
                    } else if (usuario.equals("Admin")) {
                        ficheros.escritura(new File("Ficheros/log.txt"),"Registro Administrador "+ LocalDateTime.now());
                        frame.dispose();
                        interfazSeleccionTablas.Inicializar_Seleccion();
                    }
                    registrado_correctamente =true;
                    break;
                }else{
                    registrado_correctamente =false;
                }
            }
            if (!registrado_correctamente){
                JOptionPane.showMessageDialog(frame, "Contraseña o usuario incorrectos");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
