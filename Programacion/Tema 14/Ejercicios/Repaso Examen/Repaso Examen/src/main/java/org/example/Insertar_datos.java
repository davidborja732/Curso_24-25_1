package org.example;

import java.sql.PreparedStatement;

public class Insertar_datos {
    public static void main(String[] args) {
        Conexion conexion = new Conexion();
        try {
            String consulta = "INSERT INTO alumnos (Nombre, Apellidos, Direccion) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = conexion.prepared(consulta);

            preparedStatement.setString(1, "Juan");
            preparedStatement.setString(2, "Pérez");
            preparedStatement.setString(3, "Calle Sol 123");
            int filas=preparedStatement.executeUpdate();
            if (filas>0){
                System.out.println(filas);
                System.out.println("Fallo");
            }else{
                System.out.println("El alumno se ha insertado correctamente en la base de datos.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
