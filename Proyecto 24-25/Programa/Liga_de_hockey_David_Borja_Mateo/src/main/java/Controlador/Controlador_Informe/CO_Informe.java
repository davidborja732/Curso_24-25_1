package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CO_Informe {
    private final Conexion conexion;

    public CO_Informe() {
        conexion = new Conexion();
    }

    // **Método para añadir un informe**
    public void anadirInforme(Informe informe) {
        try {
            String insertar_informe = "INSERT INTO informe (N_Rojas, N_Amarillas, Id_arbitro, Id_partido, Equipo_Local, Equipo_Visitante) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conexion.prepared(insertar_informe);
            preparedStatement.setInt(1, informe.getN_rojas());
            preparedStatement.setInt(2, informe.getN_amarillas());
            preparedStatement.setInt(3, informe.getID_arbitro());
            preparedStatement.setInt(4, informe.getID_partido());
            preparedStatement.setString(5, informe.getEquipoLocal());
            preparedStatement.setString(6, informe.getEquipoVisitante());

            int filas = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al añadir informe: " + ex.getMessage());
        }
    }

    // **Método para modificar un informe**
    public void modificarInforme(Informe informe) {
        try {
            String modificar_informe = "UPDATE informe SET N_Rojas = ?, N_Amarillas = ? WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_informe);
            preparedStatement.setInt(1, informe.getN_rojas());
            preparedStatement.setInt(2, informe.getN_amarillas());
            preparedStatement.setInt(3, informe.getId_informe());

            int filas = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al modificar informe: " + ex.getMessage());
        }
    }

    // **Método para eliminar un informe**
    public void eliminarInforme(int idInforme, DefaultTableModel modeloTabla) {
        try {
            String eliminar_informe = "DELETE FROM informe WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_informe);
            preparedStatement.setInt(1, idInforme);

            int filas = preparedStatement.executeUpdate();
            preparedStatement.close();
            cargarDatos(modeloTabla); // Recargar tabla después de eliminar
        } catch (SQLException ex) {
            throw new RuntimeException("Error al eliminar informe: " + ex.getMessage());
        }
    }

    // **Método para cargar los datos en la tabla**
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0);
        try {
            String consulta = "SELECT a.Nombre AS Nombre_Arbitro, i.N_Rojas, i.N_Amarillas, i.Equipo_Local, i.Equipo_Visitante " +
                    "FROM informe i " +
                    "JOIN arbitro a ON i.Id_arbitro = a.ID";

            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getString("Nombre_Arbitro"),
                        resultSet.getInt("N_Rojas"),
                        resultSet.getInt("N_Amarillas"),
                        resultSet.getString("Equipo_Local"),
                        resultSet.getString("Equipo_Visitante")
                });
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage());
        }
    }

    // **Método para obtener la lista de partidos**
    public List<String> obtenerPartidos() {
        List<String> partidos = new ArrayList<>();
        try {
            String consulta = "SELECT ID_partido, Fecha, Equipo_Local, Equipo_Visitante FROM partidos";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                partidos.add(resultSet.getInt("ID_partido") + " - " + resultSet.getString("Fecha") + " | " +
                        resultSet.getString("Equipo_Local") + " vs " + resultSet.getString("Equipo_Visitante"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }

    // **Método para obtener la lista de árbitros**
    public List<String> obtenerArbitros() {
        List<String> arbitros = new ArrayList<>();
        try {
            String consulta = "SELECT ID, Nombre FROM arbitro";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                arbitros.add(resultSet.getInt("ID") + " - " + resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener árbitros: " + e.getMessage());
        }
        return arbitros;
    }
    public static String[] extraerEquipos(String texto) {
        String regex = "L: (.+?) V: (.+)";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(texto);

        if (matcher.find()) {
            return new String[]{matcher.group(1).trim(), matcher.group(2).trim()};
        } else {
            return new String[]{"Error", "Error"}; // Si el formato no es válido
        }
    }
    public String obtenerArbitroPartido(String equipoLocal, String equipoVisitante) {
        String arbitro = "";
        try {
            String query = "SELECT ID_arbitro FROM partidos WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal);
            ps.setString(2, equipoVisitante);
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                arbitro = String.valueOf(resultSet.getInt("ID_arbitro"));
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el árbitro del partido: " + e.getMessage());
        }
        return arbitro;
    }
    public int obtenerIdPartido(String equipoLocal, String equipoVisitante) {
        int idPartido = -1; // Valor por defecto si no se encuentra el partido
        try {
            String query = "SELECT ID_partido FROM partidos WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal);
            ps.setString(2, equipoVisitante);
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                idPartido = resultSet.getInt("ID_partido");
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del partido: " + e.getMessage());
        }
        return idPartido;

    }
}

