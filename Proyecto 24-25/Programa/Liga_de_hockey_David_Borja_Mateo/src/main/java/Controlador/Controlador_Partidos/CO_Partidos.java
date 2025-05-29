package Controlador.Controlador_Partidos;

import Controlador.Conexion;
import Modelo.Partidos;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CO_Partidos {
    private final Conexion conexion;

    public CO_Partidos() {
        conexion = new Conexion();
    }

    // **Método para añadir un partido**
    public void añadirPartido(Partidos partido) {
        try {
            String insertar_partido = "INSERT INTO Partidos (Fecha, Equipo_Local, Equipo_Visitante, Ganador, ID_arbitro) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conexion.prepared(insertar_partido);
            preparedStatement.setDate(1, Date.valueOf(partido.getFecha()));
            preparedStatement.setString(2, partido.getEquipoLocal());
            preparedStatement.setString(3, partido.getEquipoVisitante());
            preparedStatement.setString(4, partido.getGanador());
            preparedStatement.setInt(5, partido.getID_arbitro());

            int filas = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al añadir partido: " + ex.getMessage());
        }
    }

    // **Método para modificar un partido**
    public void modificarPartido(Partidos partido) {
        try {
            String modificar_partido = "UPDATE partidos SET Fecha = ?, Equipo_Local = ?, Equipo_Visitante = ?, Ganador = ?, ID_arbitro = ? WHERE ID_partido = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_partido);
            preparedStatement.setDate(1, Date.valueOf(partido.getFecha()));
            preparedStatement.setString(2, partido.getEquipoLocal());
            preparedStatement.setString(3, partido.getEquipoVisitante());
            preparedStatement.setString(4, partido.getGanador());
            preparedStatement.setInt(5, partido.getID_arbitro());
            preparedStatement.setInt(6, partido.getID_partido());

            int filas = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al modificar partido: " + e.getMessage());
        }
    }

    // **Método para eliminar un partido por ID**
    public void eliminarPartido(int idPartido) {
        try {
            String eliminar_partido = "DELETE FROM partidos WHERE ID_partido = ?";
            PreparedStatement psPartido = conexion.prepared(eliminar_partido);
            psPartido.setInt(1, idPartido);

            int filas = psPartido.executeUpdate();
            psPartido.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al eliminar partido: " + ex.getMessage());
        }
    }

    // **Método para obtener la lista de árbitros**
    public List<String> obtenerArbitros() {
        List<String> arbitros = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID, Nombre FROM arbitro");
            while (resultSet.next()) {
                arbitros.add(resultSet.getInt("ID") + " " + resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener árbitros: " + e.getMessage());
        }
        return arbitros;
    }

    // **Método para obtener el próximo ID de partido**
    public int obtenerIdPartido() {
        int id = 0;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT MAX(ID_partido) AS max_id FROM Partidos");
            if (resultSet.next()) {
                id = resultSet.getInt("max_id") + 1;
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del partido: " + e.getMessage());
        }
        return id;
    }

    // **Método para obtener la lista de equipos**
    public List<String> obtenerEquipos() {
        List<String> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Nombre FROM Equipo");
            while (resultSet.next()) {
                equipos.add(resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }

    // **Método para cargar datos en la tabla**
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0);
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Fecha, Equipo_Local, Equipo_Visitante, Ganador, ID_arbitro FROM partidos");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getString("Fecha"),
                        resultSet.getString("Equipo_Local"),
                        resultSet.getString("Equipo_Visitante"),
                        resultSet.getString("Ganador"),
                        obtenerNombreArbitro(resultSet.getInt("ID_arbitro"))
                });
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage());
        }
    }

    // **Método para obtener el nombre del árbitro a partir de su ID**
    public String obtenerNombreArbitro(int idArbitro) {
        String nombreArbitro = "Desconocido";
        try {
            String query = "SELECT Nombre FROM arbitro WHERE ID = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setInt(1, idArbitro);
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                nombreArbitro = resultSet.getString("Nombre");
            }

            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre del árbitro: " + e.getMessage());
        }
        return nombreArbitro;
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
    public Date obtenerFechaPartido(String equipoLocal, String equipoVisitante) {
        Date fechaPartido = null;
        try {
            String query = "SELECT Fecha FROM partidos WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal);
            ps.setString(2, equipoVisitante);
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                fechaPartido = resultSet.getDate("Fecha");
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener la fecha del partido: " + e.getMessage());
        }
        return fechaPartido;
    }
    public List<String> obtenerPartidos() {
        List<String> partidos = new ArrayList<>();
        try {
            // Consulta SQL para obtener ID_partido, Equipo_Local y Equipo_Visitante
            String query = "SELECT ID_partido, Equipo_Local, Equipo_Visitante FROM partidos";
            ResultSet resultSet = conexion.resultSet(query);
            while (resultSet.next()) {
                int idPartido = resultSet.getInt("ID_partido");
                String equipoLocal = resultSet.getString("Equipo_Local");
                String equipoVisitante = resultSet.getString("Equipo_Visitante");
                partidos.add("L: "+equipoLocal+" V: "+equipoVisitante);
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }
}


