package Controlador.Controlador_Equipos;

import Controlador.Conexion;
import Modelo.Equipo;
import Vista.Insertar.IN_Equipo;
import Vista.Borrar.BO_Equipo;
import Vista.Modificar.MO_Equipo;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CO_Equipos {

    /* Instancia de la conexion a la base de datos */
    Conexion conexion = new Conexion();
    IN_Equipo inEquipo = new IN_Equipo();
    BO_Equipo boEquipo = new BO_Equipo();
    MO_Equipo moEquipo = new MO_Equipo();

    /* Método para obtener los datos de un equipo dado su ID */
    public Equipo obtenerDatosEquipo(int idEquipo) {
        try {
            String consulta = "SELECT * FROM equipo WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setInt(1, idEquipo);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String nombre = resultSet.getString("Nombre");
                int titulos = resultSet.getInt("N_Titulos");
                String estadio = resultSet.getString("Estadio");
                String dniEntrenador = resultSet.getString("DNI_entrenador");

                resultSet.close();
                preparedStatement.close();

                return new Equipo(dniEntrenador, estadio, titulos, nombre);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener datos del equipo: " + e.getMessage());
        }
        return null;
    }

    /* Método para añadir un nuevo equipo */
    public void anadirEquipo(Equipo equipo) {
        try {
            String insertar_equipo = "INSERT INTO equipo (Nombre, N_Titulos, Estadio, DNI_entrenador) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = conexion.prepared(insertar_equipo);
            preparedStatement.setString(1, equipo.getNombre());
            preparedStatement.setInt(2, equipo.getN_trofeos());
            preparedStatement.setString(3, equipo.getEstadio());
            preparedStatement.setString(4, equipo.getDni_Entrenador());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                inEquipo.recogermensaje("Añadido correctamente.");
            }
            preparedStatement.close();
        } catch (SQLException ex) {
            inEquipo.recogermensaje("Error al añadir equipo: " + ex.getMessage());
        }
    }

    /* Método para eliminar un equipo */
    public void eliminarEquipo(int id_eq, DefaultTableModel modeloTabla) {
        try {
            String eliminar_equipo = "DELETE FROM equipo WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_equipo);
            preparedStatement.setInt(1, id_eq);

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                boEquipo.recogermensaje("Eliminado correctamente.");
                cargarDatos(modeloTabla);
            } else {
                boEquipo.recogermensaje("No se pudo eliminar. Verifique que el equipo existe.");
            }
            preparedStatement.close();
        } catch (SQLException ex) {
            boEquipo.recogermensaje("Error al eliminar equipo: " + ex.getMessage());
        }
    }

    /* Método para modificar un equipo */
    public void modificarEquipo(Equipo equipo) {
        try {
            String modificar_equipo = "UPDATE equipo SET Nombre = ?, N_Titulos = ?, Estadio = ?, DNI_entrenador = ? WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_equipo);
            preparedStatement.setString(1, equipo.getNombre());
            preparedStatement.setInt(2, equipo.getN_trofeos());
            preparedStatement.setString(3, equipo.getEstadio());
            preparedStatement.setString(4, equipo.getDni_Entrenador());
            preparedStatement.setInt(5, equipo.getId_eq());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moEquipo.recogermensaje("Modificado correctamente.");
            } else {
                moEquipo.recogermensaje("No se pudo modificar. Verifique que el equipo existe.");
            }
            preparedStatement.close();
        } catch (SQLException ex) {
            moEquipo.recogermensaje("Error al modificar equipo: " + ex.getMessage());
        }
    }

    /* Método para cargar los datos en la tabla */
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0);
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Nombre,N_titulos,Estadio,DNI_Entrenador FROM equipo");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
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

    /* Método para obtener el ID de un equipo dado su nombre */
    public int obtenerIDEquipo(String nombre) {
        int id_equipo = 0;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo WHERE Nombre='" + nombre + "'");
            while (resultSet.next()) {
                id_equipo = resultSet.getInt("ID_eq");
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id_equipo;
    }

    /* Método para obtener la lista de equipos */
    public List<String> obtenerEquipos() {
        List<String> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Nombre FROM equipo");
            while (resultSet.next()) {
                equipos.add(resultSet.getString("Nombre"));
            }
            Collections.sort(equipos);
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }

    /* Método para obtener la lista de entrenadores disponibles */
    public List<String> obtenerEntrenadores() {
        List<String> entrenadores = new ArrayList<>();
        try {
            String consulta = "SELECT DNI, Nombre, Apellidos FROM persona WHERE DNI IN (SELECT DNI FROM entrenador WHERE DNI NOT IN (SELECT DNI_Entrenador FROM equipo))";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                String nombreCompleto = resultSet.getString("DNI") + " " + resultSet.getString("Nombre") + " " + resultSet.getString("Apellidos");
                entrenadores.add(nombreCompleto);
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener entrenadores: " + e.getMessage());
        }
        return entrenadores;
    }
    public boolean existeEquipo(String nombreEquipo) {
        Conexion conexion = new Conexion(); // Crear instancia de la clase Conexion
        try (PreparedStatement stmt = conexion.prepared("SELECT COUNT(*) FROM Equipo WHERE Nombre = ?")) {
            stmt.setString(1, nombreEquipo);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; // Si el contador es mayor a 0, el equipo ya existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<String> obtener_Entrenadores_modificar(String nombre_equipo) {
        List<String> entrenadores = new ArrayList<>();
        String consulta = "SELECT DNI, Nombre, Apellidos FROM persona WHERE DNI IN (" +
                "SELECT DNI FROM Entrenador WHERE DNI = (" +
                "SELECT DNI_Entrenador FROM equipo WHERE Nombre = ?) " +
                "OR DNI NOT IN (SELECT DNI_Entrenador FROM equipo))";

        try (PreparedStatement stmt = conexion.prepared(consulta)) {
            stmt.setString(1, nombre_equipo);
            ResultSet resultSet = stmt.executeQuery();

            while (resultSet.next()) {
                String nombreCompleto = resultSet.getString("DNI") + " " +
                        resultSet.getString("Nombre") + " " +
                        resultSet.getString("Apellidos");
                entrenadores.add(nombreCompleto);
            }

            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener entrenadores: " + e.getMessage());
        }
        return entrenadores;
    }
    public List<String> obtenerEntrenadorActual(String nombreEquipo) {
        List<String> entrenadorActual = new ArrayList<>();
        String consulta = "SELECT DNI, Nombre, Apellidos FROM persona WHERE DNI = (" +
                "SELECT DNI_Entrenador FROM equipo WHERE Nombre = ?)";

        try (PreparedStatement stmt = conexion.prepared(consulta)) {
            stmt.setString(1, nombreEquipo);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                entrenadorActual.add(resultSet.getString("DNI"));
                entrenadorActual.add(resultSet.getString("Nombre"));
                entrenadorActual.add(resultSet.getString("Apellidos"));
            }

            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el entrenador actual: " + e.getMessage());
        }

        return entrenadorActual;
    }
}


