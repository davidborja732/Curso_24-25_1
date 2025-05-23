package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;
import Vista.Modificar.MO_Informe;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Modificar {
    private final Conexion conexion = new Conexion();
    private MO_Informe moInforme = new MO_Informe();
    public Modificar() {
    }

    public void modificarInforme(Informe informe) {
        try {
            // Modifico en la tabla informe los datos seleccionados por el usuario
            String modificar_informe = "UPDATE informe SET N_Rojas = ?, N_Amarillas = ? WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_informe);
            preparedStatement.setInt(1, informe.getN_rojas());
            preparedStatement.setInt(2, informe.getN_amarillas());
            preparedStatement.setInt(3, informe.getId_informe());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moInforme.recogermensaje("Informe modificado correctamente.");
            } else {
                moInforme.recogermensaje("No se pudo modificar. Verifique que el informe existe.");
            }
        } catch (SQLException ex) {
            moInforme.recogermensaje("Error al modificar informe: " + ex.getMessage());
        }
    }

    // Obtengo los informes para usarlos en el JComboBox
    public List<Integer> obtenerInformes() {
        List<Integer> informes = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_informe FROM informe");
            while (resultSet.next()) {
                informes.add(resultSet.getInt("ID_informe"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener informes: " + e.getMessage());
        }
        return informes;
    }

    // Obtengo el nombre del árbitro asignado a un informe específico
    public String obtenerNombreArbitroPorInforme(int idInforme) {
        String nombreArbitro = "";
        try {
            String consulta = "SELECT a.Nombre FROM arbitro a JOIN informe i ON a.ID = i.Id_arbitro WHERE i.ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setInt(1, idInforme);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                nombreArbitro = resultSet.getString("Nombre");
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre del árbitro: " + e.getMessage());
        }
        return nombreArbitro;
    }
}

