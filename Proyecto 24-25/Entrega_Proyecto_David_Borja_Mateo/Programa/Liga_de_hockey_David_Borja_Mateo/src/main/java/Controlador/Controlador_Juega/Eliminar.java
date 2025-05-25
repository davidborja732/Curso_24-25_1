package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;
import Vista.Borrar.BO_Juega;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {

    /* Instancia de la conexion a la base de datos */
    Conexion conexion;

    /* Instancia de la clase BO_Juega para mostrar mensajes */
    BO_Juega boJuega = new BO_Juega();

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
        } catch (SQLException e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
        }
        return id_equipo;
    }

    /* Metodo para eliminar un equipo de la tabla juega */
    public void Eliminar_juega(Juega juega, DefaultTableModel modeloTabla) {
        try {
            /* Se prepara la consulta SQL para eliminar el registro de la tabla juega */
            String eliminar_juega = "DELETE FROM juega WHERE ID_partido = ? AND Rol = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_juega);
            preparedStatement.setInt(1, juega.getID_partido());
            preparedStatement.setString(2, juega.getROL());

            /* Se ejecuta la eliminacion */
            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                boJuega.recogermensaje("Eliminado correctamente."); /* Se muestra mensaje de exito */
                cargarDatos(modeloTabla); /* Se recarga la tabla con los datos actualizados */
            } else {
                boJuega.recogermensaje("No se pudo eliminar. Verifique que el partido y el rol existen."); /* Se muestra mensaje de error */
            }
        } catch (SQLException ex) {
            boJuega.recogermensaje("Error al eliminar equipo: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }

    /* Metodo para cargar los datos en la tabla */
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); /* Se limpia la tabla antes de actualizar */
        try {
            /* Se realiza la consulta para obtener los datos de la tabla juega y equipo */
            ResultSet resultSet = conexion.resultSet("SELECT equipo.Nombre, juega.ID_partido, juega.Rol FROM juega JOIN equipo ON juega.ID_eq = equipo.ID_eq");
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getString("equipo.Nombre"), /* Se añade el nombre del equipo */
                        resultSet.getInt("ID_partido"), /* Se añade el ID del partido */
                        resultSet.getString("Rol") /* Se añade el rol del equipo en el partido */
                });
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }
}


