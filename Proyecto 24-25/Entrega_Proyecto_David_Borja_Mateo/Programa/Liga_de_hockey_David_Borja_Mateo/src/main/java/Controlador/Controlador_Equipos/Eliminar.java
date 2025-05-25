package Controlador.Controlador_Equipos;

import Controlador.Conexion;
import Modelo.Equipo;
import Vista.Borrar.BO_Equipo;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {

    /* Instancia de la conexion a la base de datos */
    Conexion conexion;

    /* Instancia de la clase BO_Equipo para mostrar mensajes */
    BO_Equipo boJuega = new BO_Equipo();

    /* Constructor de la clase */
    public Eliminar() {
        conexion = new Conexion(); /* Se inicializa la conexion */
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

    /* Metodo para eliminar un equipo de la base de datos */
    public void Eliminar_juega(Equipo equipo, DefaultTableModel modeloTabla) {
        try {
            /* Se prepara la consulta SQL para eliminar el equipo */
            String eliminar_juega = "DELETE FROM equipo WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_juega);
            preparedStatement.setInt(1, equipo.getId_eq());

            /* Se ejecuta la eliminacion */
            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                boJuega.recogermensaje("Eliminado correctamente."); /* Se muestra mensaje de exito */
                cargarDatos(modeloTabla); /* Se recarga la tabla con los datos actualizados */
            } else {
                boJuega.recogermensaje("No se pudo eliminar. Verifique que el equipo existe."); /* Se muestra mensaje de error */
            }
            preparedStatement.close(); /* Se cierra la consulta */
        } catch (SQLException ex) {
            boJuega.recogermensaje("Error al eliminar equipo: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }

    /* Metodo para cargar los datos en la tabla */
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); /* Se limpia la tabla antes de actualizar */
        try {
            /* Se realiza la consulta para obtener los datos de los equipos */
            ResultSet resultSet = conexion.resultSet("SELECT * FROM equipo");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getInt("ID_eq"), /* Se añade el ID del equipo */
                        resultSet.getString("Nombre"), /* Se añade el nombre del equipo */
                        resultSet.getInt("N_Titulos"), /* Se añade el numero de titulos */
                        resultSet.getString("Estadio"), /* Se añade el nombre del estadio */
                        resultSet.getString("DNI_entrenador") /* Se añade el DNI del entrenador */
                });
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }
}


