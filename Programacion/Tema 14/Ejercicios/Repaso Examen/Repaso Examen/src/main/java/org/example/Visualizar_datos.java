package org.example;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Visualizar_datos {
    public static void main(String[] args) {
        Conexion conexion = new Conexion();
        String consulta = "SELECT * FROM alumnos";

        try {
            ResultSet resultSet = conexion.resultSet(consulta);
            // Iteramos por los resultados
            while (resultSet.next()) {
                // Asumimos que la tabla tiene las columnas: id, nombre, edad
                int id = resultSet.getInt("Id");
                String nombre = resultSet.getString("Nombre");
                String apellidos = resultSet.getString("Apellidos");
                String direccion = resultSet.getString("Direccion");

                // Imprimimos los datos
                System.out.println("ID: " + id + ", Nombre: " + nombre + ", Apellidos: " + apellidos+" Direccion "+direccion);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
