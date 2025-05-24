package Controlador.Controlador_Partidos;

import Controlador.Conexion;
import Modelo.Partidos;
import Vista.Borrar.BO_Partido;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {
    Conexion conexion;
    BO_Partido boPartido = new BO_Partido();

    public Eliminar() {
        conexion = new Conexion();
    }


    public void eliminarPartido(Partidos partido, DefaultTableModel modeloTabla) {
        try {

            // Ahora, eliminar el partido
            String eliminar_partido = "DELETE FROM partidos WHERE ID_partido = ?";
            PreparedStatement psPartido = conexion.prepared(eliminar_partido);
            psPartido.setInt(1, partido.getID_partido());

            int filas = psPartido.executeUpdate();
            if (filas > 0) {
                boPartido.recogermensaje("Partido eliminado correctamente.");
                cargarDatos(modeloTabla);
            } else {
                boPartido.recogermensaje("No se pudo eliminar. Verifique que el partido existe.");
            }
        } catch (SQLException ex) {
            boPartido.recogermensaje("Error al eliminar partido: " + ex.getMessage());
        }
    }

    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); // Limpiar tabla antes de actualizar
        try {
            ResultSet resultSet = conexion.resultSet("SELECT p.ID_partido, e.Nombre AS Ganador, p.Fecha FROM partidos p LEFT JOIN equipo e ON p.Ganador = e.ID_eq");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getInt("ID_partido"),
                        resultSet.getString("Ganador"), // Obtiene el nombre del equipo ganador
                        resultSet.getString("Fecha")
                });
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage());
        }
    }
}


