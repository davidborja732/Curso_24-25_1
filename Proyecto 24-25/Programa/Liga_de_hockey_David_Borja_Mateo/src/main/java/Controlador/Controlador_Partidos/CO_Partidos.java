package Controlador.Controlador_Partidos;

import Controlador.Conexion;
import Modelo.Partidos;

import javax.swing.table.DefaultTableModel;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CO_Partidos {
    private final Conexion conexion;

    /* Constructor que inicializa la conexion a la base de datos */
    public CO_Partidos() {
        conexion = new Conexion();
    }

    /* Metodo para añadir un partido */
    public void añadirPartido(Partidos partido) {
        try {
            String insertar_partido = "INSERT INTO Partidos (Fecha, Equipo_Local, Equipo_Visitante, Ganador, ID_arbitro) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conexion.prepared(insertar_partido);
            preparedStatement.setDate(1, Date.valueOf(partido.getFecha())); /* Asigna la fecha del partido */
            preparedStatement.setString(2, partido.getEquipoLocal()); /* Asigna el equipo local */
            preparedStatement.setString(3, partido.getEquipoVisitante()); /* Asigna el equipo visitante */
            preparedStatement.setString(4, partido.getGanador()); /* Asigna el ganador */
            preparedStatement.setInt(5, partido.getID_arbitro()); /* Asigna el ID del arbitro */

            int filas = preparedStatement.executeUpdate(); /* Ejecuta la insercion */
            preparedStatement.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al añadir partido: " + ex.getMessage());
        }
    }
    public static String[] extraerEquipos(String texto) {
        String regex = "L: (.+?) V: (.+)";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(texto);

        /* Extrae los nombres de los equipos usando expresiones regulares */
        if (matcher.find()) {
            return new String[]{matcher.group(1).trim(), matcher.group(2).trim()};
        } else {
            return new String[]{"Error", "Error"}; /* Si el formato no es valido */
        }
    }
    public Date obtenerFechaPartido(String equipoLocal, String equipoVisitante) {
        Date fechaPartido = null; /* Valor por defecto si no se encuentra la fecha */
        try {
            String query = "SELECT Fecha FROM partidos WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal); /* Asigna el equipo local */
            ps.setString(2, equipoVisitante); /* Asigna el equipo visitante */
            ResultSet resultSet = ps.executeQuery();

            /* Si existe el partido, obtiene la fecha */
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
            String query = "SELECT Equipo_Local, Equipo_Visitante FROM partidos";
            ResultSet resultSet = conexion.resultSet(query);

            /* Recorre cada partido y lo agrega a la lista con formato */
            while (resultSet.next()) {
                String equipoLocal = resultSet.getString("Equipo_Local");
                String equipoVisitante = resultSet.getString("Equipo_Visitante");
                partidos.add("L: " + equipoLocal + " V: " + equipoVisitante);
            }

            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }

    public String obtenerArbitroPartido(String equipoLocal, String equipoVisitante) {
        String arbitro = "Desconocido"; /* Valor por defecto si no se encuentra el arbitro */
        try {
            String query = "SELECT Id_arbitro FROM partidos WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal); /* Asigna el equipo local */
            ps.setString(2, equipoVisitante); /* Asigna el equipo visitante */
            ResultSet resultSet = ps.executeQuery();

            /* Si existe el partido, obtiene el ID del arbitro */
            if (resultSet.next()) {
                arbitro = String.valueOf(resultSet.getInt("ID_arbitro"));
            }

            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el arbitro del partido: " + e.getMessage());
        }
        return arbitro;
    }

    /* Metodo para modificar un partido */
    public void modificarPartido(Partidos partido) {
        try {
            String modificar_partido = "UPDATE partidos SET Fecha = ?, Equipo_Local = ?, Equipo_Visitante = ?, Ganador = ?, ID_arbitro = ? WHERE ID_partido = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_partido);
            preparedStatement.setDate(1, Date.valueOf(partido.getFecha())); /* Asigna la fecha */
            preparedStatement.setString(2, partido.getEquipoLocal()); /* Asigna equipo local */
            preparedStatement.setString(3, partido.getEquipoVisitante()); /* Asigna equipo visitante */
            preparedStatement.setString(4, partido.getGanador()); /* Asigna el ganador */
            preparedStatement.setInt(5, partido.getID_arbitro()); /* Asigna el ID del arbitro */
            preparedStatement.setInt(6, partido.getID_partido()); /* Asigna el ID del partido */

            int filas = preparedStatement.executeUpdate(); /* Ejecuta la modificacion */
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al modificar partido: " + e.getMessage());
        }
    }

    /* Metodo para eliminar un partido por ID */
    public void eliminarPartido(int idPartido) {
        try {
            String eliminar_partido = "DELETE FROM partidos WHERE ID_partido = ?";
            PreparedStatement psPartido = conexion.prepared(eliminar_partido);
            psPartido.setInt(1, idPartido); /* Asigna el ID del partido */

            int filas = psPartido.executeUpdate(); /* Ejecuta la eliminacion */
            psPartido.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al eliminar partido: " + ex.getMessage());
        }
    }

    /* Metodo para obtener la lista de arbitros */
    public List<String> obtenerArbitros() {
        List<String> arbitros = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID, Nombre FROM arbitro");

            /* Agrega cada arbitro a la lista */
            while (resultSet.next()) {
                arbitros.add(resultSet.getInt("ID") + " " + resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener arbitros: " + e.getMessage());
        }
        return arbitros;
    }

    /* Metodo para obtener el proximo ID de partido */
    public int obtenerIdPartido(String string, String s) {
        int id = 0;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT MAX(ID_partido) AS max_id FROM Partidos");

            /* Obtiene el siguiente ID */
            if (resultSet.next()) {
                id = resultSet.getInt("max_id") + 1;
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del partido: " + e.getMessage());
        }
        return id;
    }

    /* Metodo para obtener la lista de equipos */
    public List<String> obtenerEquipos() {
        List<String> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Nombre FROM Equipo");

            /* Agrega cada equipo a la lista */
            while (resultSet.next()) {
                equipos.add(resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }

    /* Metodo para cargar datos en la tabla */
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); /* Limpia la tabla antes de insertar nuevos datos */
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Fecha, Equipo_Local, Equipo_Visitante, Ganador, ID_arbitro FROM partidos");

            /* Agrega cada partido a la tabla */
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getString("Fecha"),
                        resultSet.getString("Equipo_Local"),
                        resultSet.getString("Equipo_Visitante"),
                        resultSet.getString("Ganador"),
                        obtenerNombreArbitro(resultSet.getInt("ID_arbitro")) /* Obtiene el nombre del arbitro */
                });
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage());
        }
    }

    /* Metodo para obtener el nombre del arbitro a partir de su ID */
    public String obtenerNombreArbitro(int idArbitro) {
        String nombreArbitro = "Desconocido";
        try {
            String query = "SELECT Nombre FROM arbitro WHERE Id = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setInt(1, idArbitro);
            ResultSet resultSet = ps.executeQuery();

            /* Obtiene el nombre si existe */
            if (resultSet.next()) {
                nombreArbitro = resultSet.getString("Nombre");
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre del arbitro: " + e.getMessage());
        }
        return nombreArbitro;
    }
}



