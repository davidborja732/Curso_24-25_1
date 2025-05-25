package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;
import Vista.Borrar.BO_Informe;

import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Eliminar {

    /* Instancia de la conexion a la base de datos */
    Conexion conexion;

    /* Instancia de la clase BO_Informe para mostrar mensajes */
    BO_Informe boInforme = new BO_Informe();

    /* Constructor de la clase */
    public Eliminar() {
        conexion = new Conexion(); /* Se inicializa la conexion */
    }

    /* Metodo para obtener el ID de un informe dado su identificador */
    public int obtenerIDInforme(int idInforme) {
        int id = -1;
        try {
            /* Se realiza la consulta para obtener el ID del informe */
            ResultSet resultSet = conexion.resultSet("SELECT ID_informe FROM informe WHERE ID_informe=" + idInforme);
            if (resultSet.next()) {
                id = resultSet.getInt("ID_informe"); /* Se almacena el ID del informe */
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
        }
        return id;
    }

    /* Metodo para eliminar un informe de la base de datos */
    public void eliminarInforme(Informe informe, DefaultTableModel modeloTabla) {
        try {
            /* Se prepara la consulta SQL para eliminar el informe */
            String eliminar_informe = "DELETE FROM informe WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(eliminar_informe);
            preparedStatement.setInt(1, informe.getId_informe());

            /* Se ejecuta la eliminacion */
            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                boInforme.recogermensaje("Informe eliminado correctamente."); /* Se muestra mensaje de exito */
                cargarDatos(modeloTabla); /* Se recarga la tabla con los datos actualizados */
            } else {
                boInforme.recogermensaje("No se pudo eliminar. Verifique que el informe existe."); /* Se muestra mensaje de error */
            }
            preparedStatement.close(); /* Se cierra la consulta */
        } catch (SQLException ex) {
            boInforme.recogermensaje("Error al eliminar informe: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }

    /* Metodo para cargar los datos en la tabla */
    public void cargarDatos(DefaultTableModel modeloTabla) {
        modeloTabla.setRowCount(0); /* Se limpia la tabla antes de actualizar */
        try {
            /* Se realiza la consulta para obtener los datos de los informes */
            String consulta = "SELECT i.ID_informe, a.Nombre AS Nombre_Arbitro, i.N_Rojas, i.N_Amarillas, i.Id_partido " +
                    "FROM informe i " +
                    "JOIN arbitro a ON i.Id_arbitro = a.ID";

            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                modeloTabla.addRow(new Object[]{
                        resultSet.getInt("ID_informe"), /* Se añade el ID del informe */
                        resultSet.getString("Nombre_Arbitro"), /* Se añade el nombre del arbitro */
                        resultSet.getInt("N_Rojas"), /* Se añade el numero de tarjetas rojas */
                        resultSet.getInt("N_Amarillas"), /* Se añade el numero de tarjetas amarillas */
                        resultSet.getInt("Id_partido") /* Se añade el ID del partido */
                });
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al cargar datos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }
}


