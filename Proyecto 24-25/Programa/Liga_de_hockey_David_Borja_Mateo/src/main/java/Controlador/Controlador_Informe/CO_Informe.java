package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CO_Informe {
    private final Conexion conexion;

    /* Constructor que inicializa la conexion a la base de datos */
    public CO_Informe() {
        conexion = new Conexion();
    }

    /* Metodo para añadir un informe */
    public void anadirInforme(Informe informe) {
        try {
            String insertar_informe = "INSERT INTO informe (N_Rojas, N_Amarillas, Id_arbitro, Id_partido, Equipo_Local, Equipo_Visitante) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conexion.prepared(insertar_informe);
            preparedStatement.setInt(1, informe.getN_rojas()); /* Asigna el numero de tarjetas rojas */
            preparedStatement.setInt(2, informe.getN_amarillas()); /* Asigna el numero de tarjetas amarillas */
            preparedStatement.setInt(3, informe.getID_arbitro()); /* Asigna el ID del arbitro */
            preparedStatement.setInt(4, informe.getID_partido()); /* Asigna el ID del partido */
            preparedStatement.setString(5, informe.getEquipoLocal()); /* Asigna el nombre del equipo local */
            preparedStatement.setString(6, informe.getEquipoVisitante()); /* Asigna el nombre del equipo visitante */

            int filas = preparedStatement.executeUpdate(); /* Ejecuta la insercion */
            preparedStatement.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al añadir informe: " + ex.getMessage());
        }
    }

    /* Metodo para modificar un informe */
    public void modificarInforme(Informe informe) {
        try {
            String modificar_informe = "UPDATE informe SET N_Rojas = ?, N_Amarillas = ? WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_informe);
            preparedStatement.setInt(1, informe.getN_rojas()); /* Asigna el numero de tarjetas rojas */
            preparedStatement.setInt(2, informe.getN_amarillas()); /* Asigna el numero de tarjetas amarillas */
            preparedStatement.setInt(3, informe.getId_informe()); /* Asigna el ID del informe */

            int filas = preparedStatement.executeUpdate(); /* Ejecuta la actualizacion */
            preparedStatement.close();
        } catch (SQLException ex) {
            throw new RuntimeException("Error al modificar informe: " + ex.getMessage());
        }
    }

    /* Metodo para eliminar un informe */
    public void eliminarInforme(int idInforme, DefaultTableModel modeloTabla) {
        try {
            String eliminar_informe = "DELETE FROM informe WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_informe);
            preparedStatement.setInt(1, idInforme); /* Asigna el ID del informe */

            int filas = preparedStatement.executeUpdate(); /* Ejecuta la eliminacion */
            preparedStatement.close();
            cargarDatos(modeloTabla); /* Recarga la tabla despues de eliminar */
        } catch (SQLException ex) {
            throw new RuntimeException("Error al eliminar informe: " + ex.getMessage());
        }
    }

    /* Metodo para cargar los datos en la tabla */
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); /* Limpia la tabla antes de insertar nuevos datos */
        try {
            String consulta = "SELECT Id_arbitro, N_Rojas, N_Amarillas, Equipo_Local, Equipo_Visitante FROM informe";
            ResultSet resultSet = conexion.resultSet(consulta);

            while (resultSet.next()) {
                String nombreArbitro = obtenerNombreArbitroPorId(resultSet.getInt("Id_arbitro")); /* Obtiene el nombre del arbitro */

                modeloTabla.addRow(new Object[]{ /* Inserta una fila con los datos del informe */
                        nombreArbitro,
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

    /* Metodo para obtener el nombre del equipo local */
    public String obtenerNombreLocal(int idEquipo) {
        String nombreEquipo = "Desconocido";
        try {
            String query = "SELECT Nombre FROM equipos WHERE ID_equipo = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setInt(1, idEquipo); /* Asigna el ID del equipo */
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                nombreEquipo = resultSet.getString("Nombre"); /* Obtiene el nombre del equipo local */
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre del equipo local: " + e.getMessage());
        }
        return nombreEquipo;
    }

    /* Metodo para obtener el nombre del equipo visitante */
    public String obtenerNombreVisitante(int idEquipo) {
        String nombreEquipo = "Desconocido";
        try {
            String query = "SELECT Nombre FROM equipos WHERE ID_equipo = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setInt(1, idEquipo); /* Asigna el ID del equipo */
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                nombreEquipo = resultSet.getString("Nombre"); /* Obtiene el nombre del equipo visitante */
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre del equipo visitante: " + e.getMessage());
        }
        return nombreEquipo;
    }

    public int obtenerIdPartido(String equipoLocal, String equipoVisitante) {
        int idPartido = -1; /* Valor por defecto si no se encuentra el partido */
        try {
            String query = "SELECT ID_partido FROM partidos WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal); /* Asigna el nombre del equipo local */
            ps.setString(2, equipoVisitante); /* Asigna el nombre del equipo visitante */
            ResultSet resultSet = ps.executeQuery();

            /* Si se encuentra el partido, obtiene su ID */
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

        /* Extrae los nombres de los equipos usando expresiones regulares */
        if (matcher.find()) {
            return new String[]{matcher.group(1).trim(), matcher.group(2).trim()};
        } else {
            return new String[]{"Error", "Error"}; /* Si el formato no es valido */
        }
    }

    /* Metodo para obtener la lista de partidos */
    public List<String> obtenerPartidos() {
        List<String> partidos = new ArrayList<>();
        try {
            String consulta = "SELECT Equipo_Local, Equipo_Visitante FROM partidos";
            ResultSet resultSet = conexion.resultSet(consulta);

            /* Agrega cada partido a la lista con formato */
            while (resultSet.next()) {
                String partidoFormato = "L: " + resultSet.getString("Equipo_Local") + " V: " + resultSet.getString("Equipo_Visitante");
                partidos.add(partidoFormato);
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }

    public boolean tieneInforme(int idPartido) {
        boolean existeInforme = false;
        try {
            String consulta = "SELECT COUNT(*) AS total FROM informe WHERE Id_partido = ?";
            PreparedStatement ps = conexion.prepared(consulta);
            ps.setInt(1, idPartido); /* Asigna el ID del partido */
            ResultSet resultSet = ps.executeQuery();

            /* Si hay registros, el partido ya tiene un informe */
            if (resultSet.next() && resultSet.getInt("total") > 0) {
                existeInforme = true;
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al verificar si el partido tiene informe: " + e.getMessage());
        }
        return existeInforme;
    }

    public int obtenerIdInforme(String equipoLocal, String equipoVisitante) {
        int idInforme = -1; /* Valor por defecto si no se encuentra el informe */
        try {
            String query = "SELECT ID_informe FROM informe WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal); /* Asigna el equipo local */
            ps.setString(2, equipoVisitante); /* Asigna el equipo visitante */
            ResultSet resultSet = ps.executeQuery();

            /* Obtiene el ID del informe si existe */
            if (resultSet.next()) {
                idInforme = resultSet.getInt("ID_informe");
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del informe: " + e.getMessage());
        }
        return idInforme;
    }

    public Informe obtenerDatosInforme(int idPartido) {
        Informe informe = null; /* Inicializamos como null si no se encuentra el informe */
        try {
            String query = "SELECT ID_informe, N_Rojas, N_Amarillas, Id_arbitro, Equipo_Local, Equipo_Visitante FROM informe WHERE Id_partido = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setInt(1, idPartido); /* Asigna el ID del partido */
            ResultSet resultSet = ps.executeQuery();

            /* Si existe el informe, obtiene sus datos */
            if (resultSet.next()) {
                int idInforme = resultSet.getInt("ID_informe");
                int nRojas = resultSet.getInt("N_Rojas");
                int nAmarillas = resultSet.getInt("N_Amarillas");
                int idArbitro = resultSet.getInt("Id_arbitro");
                String equipoLocal = resultSet.getString("Equipo_Local");
                String equipoVisitante = resultSet.getString("Equipo_Visitante");

                informe = new Informe(nRojas, nAmarillas, idInforme, idPartido, idArbitro, equipoLocal, equipoVisitante);
            }
            resultSet.close();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener los datos del informe: " + e.getMessage());
        }
        return informe;
    }

    public String obtenerNombreArbitroPorId(int idArbitro) {
        String nombreArbitro = "Desconocido";
        try {
            String consulta = "SELECT Nombre FROM arbitro WHERE ID = ?";
            PreparedStatement ps = conexion.prepared(consulta);
            ps.setInt(1, idArbitro); /* Asigna el ID del arbitro */
            ResultSet resultSet = ps.executeQuery();

            /* Obtiene el nombre del arbitro si existe */
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

    /* Metodo para obtener el arbitro asignado a un partido */
    public String obtenerArbitroPartido(String equipoLocal, String equipoVisitante) {
        String arbitro = "";
        try {
            String query = "SELECT ID_arbitro FROM partidos WHERE Equipo_Local = ? AND Equipo_Visitante = ?";
            PreparedStatement ps = conexion.prepared(query);
            ps.setString(1, equipoLocal); /* Asigna el equipo local */
            ps.setString(2, equipoVisitante); /* Asigna el equipo visitante */
            ResultSet resultSet = ps.executeQuery();

            /* Obtiene el ID del arbitro si existe */
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
}



