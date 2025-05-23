package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;
import Vista.Borrar.BO_Informe;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {
    Conexion conexion;
    BO_Informe boInforme = new BO_Informe();

    public Eliminar() {
        conexion = new Conexion();
    }

    public int obtenerIDInforme(int idInforme) {
        int id = -1;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_informe FROM informe WHERE ID_informe=" + idInforme);
            if (resultSet.next()) {
                id = resultSet.getInt("ID_informe");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }

    public void eliminarInforme(Informe informe, DefaultTableModel modeloTabla) {
        try {
            String eliminar_informe = "DELETE FROM informe WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_informe);
            preparedStatement.setInt(1, informe.getId_informe());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                boInforme.recogermensaje("Informe eliminado correctamente.");
                cargarDatos(modeloTabla); // Recargar los datos después de eliminar
            } else {
                boInforme.recogermensaje("No se pudo eliminar. Verifique que el informe existe.");
            }
        } catch (SQLException ex) {
            boInforme.recogermensaje("Error al eliminar informe: " + ex.getMessage());
        }
    }

    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); // Limpiar tabla antes de actualizar
        try {
            String consulta = "SELECT i.ID_informe, a.Nombre AS Nombre_Arbitro, i.N_Rojas, i.N_Amarillas, i.Id_partido " +
                    "FROM informe i " +
                    "JOIN arbitro a ON i.Id_arbitro = a.ID";

            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getInt("ID_informe"),
                        resultSet.getString("Nombre_Arbitro"),
                        resultSet.getInt("N_Rojas"),
                        resultSet.getInt("N_Amarillas"),
                        resultSet.getInt("Id_partido")
                });
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage());
        }
    }
}

