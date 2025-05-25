package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;
import Vista.Modificar.MO_Informe;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Modificar {

    /* Instancia de la conexion a la base de datos */
    private final Conexion conexion = new Conexion();

    /* Instancia de la clase MO_Informe para mostrar mensajes */
    private MO_Informe moInforme = new MO_Informe();

    /* Constructor vacio de la clase */
    public Modificar() {
    }

    /* Metodo para modificar los datos de un informe */
    public void modificarInforme(Informe informe) {
        try {
            /* Se prepara la consulta SQL para actualizar los datos del informe */
            String modificar_informe = "UPDATE informe SET N_Rojas = ?, N_Amarillas = ? WHERE ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_informe);
            preparedStatement.setInt(1, informe.getN_rojas()); /* Se establece el numero de tarjetas rojas */
            preparedStatement.setInt(2, informe.getN_amarillas()); /* Se establece el numero de tarjetas amarillas */
            preparedStatement.setInt(3, informe.getId_informe()); /* Se establece el ID del informe a modificar */

            /* Se ejecuta la modificacion */
            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moInforme.recogermensaje("Informe modificado correctamente."); /* Se muestra mensaje de exito */
            } else {
                moInforme.recogermensaje("No se pudo modificar. Verifique que el informe existe."); /* Se muestra mensaje de error */
            }
            preparedStatement.close(); /* Se cierra la consulta */
        } catch (SQLException ex) {
            moInforme.recogermensaje("Error al modificar informe: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
        }
    }

    /* Metodo para obtener la lista de informes y usarlos en el JComboBox */
    public List<Integer> obtenerInformes() {
        List<Integer> informes = new ArrayList<>();
        try {
            /* Se realiza la consulta para obtener los IDs de los informes */
            ResultSet resultSet = conexion.resultSet("SELECT ID_informe FROM informe");
            while (resultSet.next()) {
                informes.add(resultSet.getInt("ID_informe")); /* Se añaden los IDs a la lista */
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener informes: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return informes;
    }

    /* Metodo para obtener el nombre del arbitro asignado a un informe especifico */
    public String obtenerNombreArbitroPorInforme(int idInforme) {
        String nombreArbitro = "";
        try {
            /* Se prepara la consulta SQL para obtener el nombre del arbitro */
            String consulta = "SELECT a.Nombre FROM arbitro a JOIN informe i ON a.ID = i.Id_arbitro WHERE i.ID_informe = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setInt(1, idInforme);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                nombreArbitro = resultSet.getString("Nombre"); /* Se almacena el nombre del arbitro */
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre del arbitro: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return nombreArbitro;
    }
}
