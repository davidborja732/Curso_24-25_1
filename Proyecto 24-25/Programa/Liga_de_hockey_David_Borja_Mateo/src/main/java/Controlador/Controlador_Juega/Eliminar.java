package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;
import Vista.Borrar.BO_Juega;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {
    Conexion conexion;
    BO_Juega boJuega=new BO_Juega();
    public Eliminar() {
        conexion = new Conexion();
    }
    public int obtener_ID_equipo(String nombre){
        int id_equipo=0;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo WHERE Nombre='"+nombre+"'");
            while (resultSet.next()) {
                id_equipo=resultSet.getInt("ID_eq");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id_equipo;
    }
    public void Eliminar_juega(Juega juega, DefaultTableModel modeloTabla) {
        try {
            String eliminar_juega = "DELETE FROM juega WHERE ID_partido = ? AND Rol = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_juega);
            preparedStatement.setInt(1, juega.getID_partido());
            preparedStatement.setString(2, juega.getROL());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                boJuega.recogermensaje("Eliminado correctamente.");
                cargarDatos(modeloTabla); // Recargo los datos que tendra la tabla después de borrar
            } else {
                boJuega.recogermensaje("No se pudo eliminar. Verifique que el partido y el rol existen.");
            }
        } catch (SQLException ex) {
            boJuega.recogermensaje("Error al eliminar equipo: " + ex.getMessage());
        }
    }

    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); // Limpiar tabla antes de actualizar
        try {
            ResultSet resultSet = conexion.resultSet("SELECT equipo.Nombre, juega.ID_partido, juega.Rol FROM juega JOIN equipo ON juega.ID_eq = equipo.ID_eq");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getString("equipo.Nombre"),
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

