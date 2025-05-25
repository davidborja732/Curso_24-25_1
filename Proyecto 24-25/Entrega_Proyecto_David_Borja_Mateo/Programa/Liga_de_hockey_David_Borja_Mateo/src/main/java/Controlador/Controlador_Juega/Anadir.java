package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;
import Vista.Insertar.IN_Juega;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Anadir {

    /* Instancia de la conexion a la base de datos */
    Conexion conexion;

    /* Instancia de la clase IN_Juega para mostrar mensajes */
    IN_Juega inJuega;

    /* Constructor de la clase */
    public Anadir() {
        conexion = new Conexion(); /* Se inicializa la conexion */
        inJuega = new IN_Juega(); /* Se inicializa la instancia de IN_Juega */
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
            resultSet.close(); /* Se cierra el ResultSet */
        } catch (SQLException e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
        }
        return id_equipo;
    }

    /* Metodo para añadir un equipo a un partido */
    public void Anadir_juega(Juega juega) {
        try {
            /* Se prepara la consulta SQL para verificar si el equipo ya existe en el partido */
            String consulta = "SELECT ID_eq, Rol FROM juega WHERE ID_partido = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setInt(1, juega.getID_partido());
            ResultSet resultSet = preparedStatement.executeQuery();

            boolean localExiste = false, visitanteExiste = false, equipoAsignado = false;

            while (resultSet.next()) {
                int equipoExistente = resultSet.getInt("ID_eq");
                String rol = resultSet.getString("Rol");
                if (equipoExistente == juega.getID_equipo()) {
                    equipoAsignado = true;
                }
                if (rol.equals("Local")) {
                    localExiste = true;
                }
                if (rol.equals("Visitante")) {
                    visitanteExiste = true;
                }
            }
            resultSet.close();
            preparedStatement.close();

            /* Se verifican condiciones antes de insertar en la base de datos */
            if (localExiste && juega.getROL().equals("Local")) {
                inJuega.recogermensaje("Este partido ya tiene un equipo local registrado.");
            } else if (visitanteExiste && juega.getROL().equals("Visitante")) {
                inJuega.recogermensaje("Este partido ya tiene un equipo visitante registrado.");
            } else if (equipoAsignado) {
                inJuega.recogermensaje("Este equipo ya esta asignado a este partido.");
            } else {
                /* Se inserta el equipo en el partido */
                try {
                    String insertar_juega = "INSERT INTO juega VALUES (?, ?, ?)";
                    preparedStatement = conexion.prepared(insertar_juega);
                    preparedStatement.setInt(1, juega.getID_equipo());
                    preparedStatement.setInt(2, juega.getID_partido());
                    preparedStatement.setString(3, juega.getROL());

                    int filas = preparedStatement.executeUpdate();
                    if (filas > 0) {
                        inJuega.recogermensaje("Añadido correctamente.");
                    }
                    preparedStatement.close();
                } catch (SQLException ex) {
                    inJuega.recogermensaje("Error al añadir equipo: " + ex.getMessage());
                }
            }
        } catch (SQLException ex) {
            inJuega.recogermensaje("Error en la verificacion de datos: " + ex.getMessage());
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
            resultSet.close();
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
            ResultSet resultSet = conexion.resultSet("SELECT ID_partido FROM partidos");
            while (resultSet.next()) {
                partidos.add(resultSet.getInt("ID_partido")); /* Se añaden los IDs a la lista */
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return partidos;
    }
}
