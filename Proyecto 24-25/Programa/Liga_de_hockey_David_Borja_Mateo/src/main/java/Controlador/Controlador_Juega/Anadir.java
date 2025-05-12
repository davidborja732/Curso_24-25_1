package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;

import javax.swing.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Anadir {
    private Conexion conexion;

    public Anadir() {
        conexion = new Conexion();
    }

    public void Anadir_juega(Juega juega, JFrame frame) {
        try {
            // Consulta que usare para verificar existencia del equipo en un partido
            String consulta = "SELECT ID_eq, Rol FROM juega WHERE ID_partido = ?";
            PreparedStatement stmt = conexion.prepared(consulta);
            stmt.setInt(1, juega.getID_partido());
            ResultSet resultSet = stmt.executeQuery();

            boolean localExiste = false, visitanteExiste = false, equipoAsignado = false;

            while (resultSet.next()) {
                int equipoExistente = resultSet.getInt("ID_eq");
                String rol = resultSet.getString("Rol");
                if (equipoExistente == juega.getID_equipo()) {
                    equipoAsignado = true;
                }
                if (rol.equals("Local")) localExiste = true;
                if (rol.equals("Visitante")) visitanteExiste = true;
            }
            resultSet.close();

            // Lanzo mensaje usando el frame de la interfaz
            if (localExiste && juega.getROL().equals("Local")) {
                JOptionPane.showMessageDialog(frame, "Este partido ya tiene un equipo local registrado.");
            } else if (visitanteExiste && juega.getROL().equals("Visitante")) {
                JOptionPane.showMessageDialog(frame, "Este partido ya tiene un equipo visitante registrado.");
            } else if (equipoAsignado) {
                JOptionPane.showMessageDialog(frame, "Este equipo ya está asignado a este partido.");
            } else {
                // Inserto en la tabla juega los datos seleccionados por el usuario
                try {
                    String insertar_juega = "INSERT INTO juega VALUES (?, ?, ?)";
                    PreparedStatement preparedStatement = conexion.prepared(insertar_juega);
                    preparedStatement.setInt(1, juega.getID_equipo());
                    preparedStatement.setInt(2, juega.getID_partido());
                    preparedStatement.setString(3, juega.getROL());
                    int filas = preparedStatement.executeUpdate();
                    if (filas > 0) {
                        JOptionPane.showMessageDialog(frame, "Añadido correctamente.");
                    }
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(frame, "Error al añadir equipo: " + ex.getMessage());
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(frame, "Error en la verificación de datos: " + ex.getMessage());
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
