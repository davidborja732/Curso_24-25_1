package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;
import Vista.Modificar.MO_Juega;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Modificar {

    /* Se crea una instancia de la clase Conexion para manejar la base de datos */
    private Conexion conexion = new Conexion();

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
        } catch (SQLException e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
        }
        return id_equipo;
    }

    /* Metodo para modificar un equipo dentro de la tabla juega */
    public void Modificar_juega(Juega juega) {
        MO_Juega moJuega = new MO_Juega();
        try {
            /* Se prepara la consulta SQL para actualizar los datos en la tabla juega */
            String modificar_juega = "UPDATE juega SET ID_eq = ? WHERE ID_partido = ? AND Rol = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_juega);
            preparedStatement.setInt(1, juega.getID_equipo());
            preparedStatement.setInt(2, juega.getID_partido());
            preparedStatement.setString(3, juega.getROL());

            /* Se ejecuta la actualizacion */
            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moJuega.recogermensaje("Modificado correctamente."); /* Se muestra mensaje de exito */
            } else {
                moJuega.recogermensaje("No se pudo modificar. Verifique que el partido y el rol existen."); /* Se muestra mensaje de error */
            }
        } catch (SQLException ex) {
            moJuega.recogermensaje("Error al modificar equipo: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
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
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return equipos;
    }

    /* Metodo para obtener la lista de partidos y usarlos en el JComboBox */
    public List<Integer> obtenerPartidos() {
        List<Integer> partidos = new ArrayList<>();
        try {
            /* Se realiza la consulta para obtener los IDs de los partidos */
            try (ResultSet resultSet = conexion.resultSet("SELECT ID_partido FROM juega")) {
                while (resultSet.next()) {
                    int idPartido = resultSet.getInt("ID_partido");
                    if (!partidos.contains(idPartido)) {
                        partidos.add(idPartido); /* Se añaden los IDs a la lista si no estan duplicados */
                    }
                }
                Collections.sort(partidos); /* Se ordenan los partidos */
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return partidos;
    }
}
