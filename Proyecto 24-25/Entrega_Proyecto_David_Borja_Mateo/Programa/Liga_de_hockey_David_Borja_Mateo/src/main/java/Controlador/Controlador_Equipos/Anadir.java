package Controlador.Controlador_Equipos;

import Controlador.Conexion;
import Modelo.Equipo;
import Vista.Insertar.IN_Equipo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Anadir {

    /* Instancia de la conexion a la base de datos */
    Conexion conexion = new Conexion();

    /* Instancia de la clase IN_Equipo para mostrar mensajes */
    IN_Equipo inEquipo = new IN_Equipo();

    /* Constructor de la clase */
    public Anadir() {
        inEquipo = new IN_Equipo(); /* Se inicializa la instancia de IN_Equipo */
    }

    /* Metodo para añadir un nuevo equipo a la base de datos */
    public void Anadir_equipo(Equipo equipo) {
        try {
            PreparedStatement preparedStatement;
            try {
                /* Se prepara la consulta SQL para insertar un nuevo equipo */
                String insertar_equipo = "INSERT INTO equipo (Nombre, N_Titulos, Estadio, DNI_entrenador) VALUES (?, ?, ?, ?)";
                preparedStatement = conexion.prepared(insertar_equipo);
                preparedStatement.setString(1, equipo.getNombre()); /* Se establece el nombre del equipo */
                preparedStatement.setInt(2, equipo.getN_trofeos()); /* Se establece el numero de titulos */
                preparedStatement.setString(3, equipo.getEstadio()); /* Se establece el estadio */
                preparedStatement.setString(4, equipo.getDni_Entrenador()); /* Se establece el DNI del entrenador */

                /* Se ejecuta la consulta */
                int filas = preparedStatement.executeUpdate();
                if (filas > 0) {
                    inEquipo.recogermensaje("Añadido correctamente."); /* Se muestra mensaje de exito */
                }
                preparedStatement.close(); /* Se cierra la consulta */
            } catch (SQLException ex) {
                inEquipo.recogermensaje("Error al añadir equipo: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
            }
        } catch (Exception e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
        }
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
