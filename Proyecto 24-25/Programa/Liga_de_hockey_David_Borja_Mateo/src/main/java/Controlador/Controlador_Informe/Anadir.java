package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;
import Vista.Insertar.IN_informe;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Anadir {
    Conexion conexion = new Conexion();
    IN_informe inInforme = new IN_informe();

    public Anadir() {
        inInforme = new IN_informe();
    }

    public void anadirInforme(Informe informe) {
        try {
            PreparedStatement preparedStatement;
            try {
                // Inserto en la tabla informe los datos seleccionados por el usuario
                String insertar_informe = "INSERT INTO informe (N_Rojas, N_Amarillas, Id_arbitro, Id_partido) VALUES (?, ?, ?, ?)";
                preparedStatement = conexion.prepared(insertar_informe);
                preparedStatement.setInt(1, informe.getN_rojas());
                preparedStatement.setInt(2, informe.getN_amarillas());
                preparedStatement.setInt(3, informe.getID_arbitro());
                preparedStatement.setInt(4, informe.getID_partido());

                int filas = preparedStatement.executeUpdate();
                if (filas > 0) {
                    inInforme.recogermensaje("Informe añadido correctamente.");
                }
                preparedStatement.close();
            } catch (SQLException ex) {
                inInforme.recogermensaje("Error al añadir informe: " + ex.getMessage());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Obtengo partidos y los meto en una lista para el JComboBox de la interfaz externa
    public List<String> obtenerPartidos() {
        List<String> partidos = new ArrayList<>();
        try {
            String consulta = "SELECT ID_partido, Fecha FROM partidos";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                String partidoInfo = resultSet.getInt("ID_partido") + " - " + resultSet.getString("Fecha");
                partidos.add(partidoInfo);
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }

    // Obtengo árbitros y los meto en una lista para el JComboBox
    public List<String> obtenerArbitros() {
        List<String> arbitros = new ArrayList<>();
        try {
            String consulta = "SELECT ID, Nombre FROM arbitro";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                String arbitroInfo = resultSet.getInt("ID") + " - " + resultSet.getString("Nombre");
                arbitros.add(arbitroInfo);
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener árbitros: " + e.getMessage());
        }
        return arbitros;
    }

    // Obtengo el ID de un partido a partir de su representación en el JComboBox
    public int obtenerIDPartido(String partidoSeleccionado) {
        int idPartido = -1;
        try {
            String consulta = "SELECT ID_partido FROM partidos WHERE Fecha = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setString(1, partidoSeleccionado.split(" - ")[1]); // Extraigo la fecha

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                idPartido = resultSet.getInt("ID_partido");
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del partido: " + e.getMessage());
        }
        return idPartido;
    }

    public int obtenerIDArbitro(String arbitroSeleccionado) {
        int idArbitro = -1;
        try {
            String consulta = "SELECT ID FROM arbitro WHERE Nombre = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setString(1, arbitroSeleccionado); // Extraigo el nombre

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                idArbitro = resultSet.getInt("ID");
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del árbitro: " + e.getMessage());
        }
        return idArbitro;
    }
    public String obtenerNombreArbitroPorPartido(int idPartido) {
        String nombreArbitro = "";
        try {
            String consulta = "SELECT a.Nombre FROM arbitro a JOIN partidos p ON a.ID = p.ID_arbitro WHERE p.ID_partido = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setInt(1, idPartido);

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

