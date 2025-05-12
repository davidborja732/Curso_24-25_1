package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;

import javax.swing.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Modificar {
    private Conexion conexion;

    public Modificar() {
        conexion = new Conexion();
    }

    public void Modificar_juega(Juega juega, JFrame frame) {
        try {
            // Modifico en la tabla juega los datos seleccionados por el usuario, comprobando también el ROL en la condición WHERE
            String modificar_juega = "UPDATE juega SET ID_eq = ? WHERE ID_partido = ? AND Rol = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_juega);
            preparedStatement.setInt(1, juega.getID_equipo());
            preparedStatement.setInt(2, juega.getID_partido());
            preparedStatement.setString(3, juega.getROL()); // Se agrega la condición del Rol

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                JOptionPane.showMessageDialog(frame, "Modificado correctamente.");
            } else {
                JOptionPane.showMessageDialog(frame, "No se pudo modificar. Verifique que el partido y el rol existen.");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(frame, "Error al modificar equipo: " + ex.getMessage());
        }
    }

    // Método para obtener los equipos
    public List<Integer> obtenerEquipos() {
        List<Integer> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo");
            while (resultSet.next()) {
                equipos.add(resultSet.getInt("ID_eq"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }

    // Método para obtener los partidos
    public List<Integer> obtenerPartidos() {
        List<Integer> partidos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_partido FROM partidos");
            while (resultSet.next()) {
                partidos.add(resultSet.getInt("ID_partido"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }
}
