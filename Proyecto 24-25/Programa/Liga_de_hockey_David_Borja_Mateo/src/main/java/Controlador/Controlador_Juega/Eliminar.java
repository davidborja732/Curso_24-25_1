package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {
    private Conexion conexion;

    public Eliminar() {
        conexion = new Conexion();
    }

    public void Eliminar_juega(Juega juega, JFrame frame, DefaultTableModel modeloTabla) {
        try {
            String eliminar_juega = "DELETE FROM juega WHERE ID_partido = ? AND Rol = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_juega);
            preparedStatement.setInt(1, juega.getID_partido());
            preparedStatement.setString(2, juega.getROL());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                JOptionPane.showMessageDialog(frame, "Eliminado correctamente.");
                cargarDatos(modeloTabla); // Recargar la tabla tras la eliminación
            } else {
                JOptionPane.showMessageDialog(frame, "No se pudo eliminar. Verifique que el partido y el rol existen.");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(frame, "Error al eliminar equipo: " + ex.getMessage());
        }
    }

    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); // Limpiar tabla antes de actualizar
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq, ID_partido, Rol FROM juega");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getInt("ID_eq"),
                        resultSet.getInt("ID_partido"),
                        resultSet.getString("Rol")
                });
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage());
        }
    }
}

