package Controlador.Controlador_Equipos;

import Controlador.Conexion;
import Modelo.Equipo;
import Modelo.Juega;
import Vista.Borrar.BO_Equipo;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {
    Conexion conexion;
    BO_Equipo boJuega = new BO_Equipo();

    public Eliminar() {
        conexion = new Conexion();
    }

    public int obtener_ID_equipo(String nombre) {
        int id_equipo = 0;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo WHERE Nombre='" + nombre + "'");
            while (resultSet.next()) {
                id_equipo = resultSet.getInt("ID_eq");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id_equipo;
    }

    public void Eliminar_juega(Equipo equipo, DefaultTableModel modeloTabla) {
        try {
            String eliminar_juega = "DELETE FROM equipo WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_juega);
            preparedStatement.setInt(1, equipo.getId_eq());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                boJuega.recogermensaje("Eliminado correctamente.");
                cargarDatos(modeloTabla); // Recargo los datos que tendra la tabla después de borrar
            } else {
                boJuega.recogermensaje("No se pudo eliminar. Verifique que el equipo existe.");
            }
        } catch (SQLException ex) {
            boJuega.recogermensaje("Error al eliminar equipo: " + ex.getMessage());
        }
    }

    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); // Limpiar tabla antes de actualizar
        try {
            ResultSet resultSet = conexion.resultSet("SELECT* FROM equipo");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getInt("ID_eq"),
                        resultSet.getString("Nombre"),
                        resultSet.getInt("N_Titulos"),
                        resultSet.getString("Estadio"),
                        resultSet.getString("DNI_entrenador")
                });
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage());
        }
    }
}

