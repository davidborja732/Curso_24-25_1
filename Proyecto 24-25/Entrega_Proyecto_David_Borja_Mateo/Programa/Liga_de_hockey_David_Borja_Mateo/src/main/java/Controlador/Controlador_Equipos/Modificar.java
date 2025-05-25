package Controlador.Controlador_Equipos;

import Controlador.Conexion;
import Modelo.Equipo;
import Vista.Modificar.MO_Equipo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Modificar {

    /* Instancia de la conexion a la base de datos */
    private final Conexion conexion = new Conexion();

    /* Constructor vacio de la clase */
    public Modificar() {
    }

    /* Metodo para obtener el ID de un equipo dado su nombre */
    public int obtener_ID_equipo(String nombre) {
        int id_equipo = 0;
        try {
            /* Se realiza la consulta para obtener el ID del equipo */
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo WHERE Nombre='" + nombre + "'");
            while (resultSet.next()) {
                id_equipo = resultSet.getInt("ID_eq"); /* Se almacena el ID del equipo */
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
        }
        return id_equipo;
    }

    /* Metodo para modificar los datos de un equipo */
    public void modificarEquipo(Equipo equipo, int id_eq_seleccionado) {
        MO_Equipo moEquipo = new MO_Equipo();
        try {
            /* Se prepara la consulta SQL para actualizar los datos del equipo */
            String modificar_equipo = "UPDATE equipo SET Nombre = ?, N_Titulos = ?, Estadio = ?, DNI_entrenador = ? WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_equipo);
            preparedStatement.setString(1, equipo.getNombre()); /* Se establece el nuevo nombre del equipo */
            preparedStatement.setInt(2, equipo.getN_trofeos()); /* Se establece el nuevo numero de titulos */
            preparedStatement.setString(3, equipo.getEstadio()); /* Se establece el nuevo estadio */
            preparedStatement.setString(4, equipo.getDni_Entrenador()); /* Se establece el nuevo DNI del entrenador */
            preparedStatement.setInt(5, id_eq_seleccionado); /* Se establece el ID del equipo a modificar */

            /* Se ejecuta la modificacion */
            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moEquipo.recogermensaje("Modificado correctamente."); /* Se muestra mensaje de exito */
            } else {
                moEquipo.recogermensaje("No se pudo modificar. Verifique que el equipo existe."); /* Se muestra mensaje de error */
            }
            preparedStatement.close(); /* Se cierra la consulta */
        } catch (SQLException ex) {
            moEquipo.recogermensaje("Error al modificar equipo: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }

    /* Metodo para obtener la lista de equipos y usarlos en el JComboBox */
    public List<String> obtenerEquipos() {
        List<String> equipos = new ArrayList<>();
        try {
            /* Se realiza la consulta para obtener los nombres de los equipos */
            ResultSet resultSet = conexion.resultSet("SELECT Nombre FROM equipo");
            while (resultSet.next()) {
                equipos.add(resultSet.getString("Nombre")); /* Se añaden los nombres a la lista */
            }
            Collections.sort(equipos); /* Se ordenan los equipos */
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return equipos;
    }

    /* Metodo para obtener la lista de entrenadores disponibles */
    public List<String> obtenerEntrenadores() {
        List<String> entrenadores = new ArrayList<>();
        try {
            /* Se realiza la consulta para obtener los entrenadores que aun no tienen equipo asignado */
            String consulta = "SELECT DNI, Nombre, Apellidos FROM persona WHERE DNI IN (SELECT DNI FROM entrenador WHERE DNI NOT IN (SELECT DNI_Entrenador FROM equipo))";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                /* Se formatea el nombre del entrenador con su DNI */
                String nombreCompleto = resultSet.getString("DNI") + " " + resultSet.getString("Nombre") + " " + resultSet.getString("Apellidos");
                entrenadores.add(nombreCompleto);
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener entrenadores: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return entrenadores;
    }
}
