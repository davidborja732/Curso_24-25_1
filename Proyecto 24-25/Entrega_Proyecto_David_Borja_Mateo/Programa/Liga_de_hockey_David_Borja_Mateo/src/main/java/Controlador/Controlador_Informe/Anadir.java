package Controlador.Controlador_Informe;

import Controlador.Conexion;
import Modelo.Informe;
import Vista.Insertar.IN_informe;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Anadir {

    /* Instancia de la conexion a la base de datos */
    Conexion conexion = new Conexion();

    /* Instancia de la clase IN_informe para mostrar mensajes */
    IN_informe inInforme = new IN_informe();

    /* Constructor de la clase */
    public Anadir() {
        inInforme = new IN_informe(); /* Se inicializa la instancia de IN_informe */
    }

    /* Metodo para añadir un nuevo informe a la base de datos */
    public void anadirInforme(Informe informe) {
        try {
            PreparedStatement preparedStatement;
            try {
                /* Se prepara la consulta SQL para insertar un nuevo informe */
                String insertar_informe = "INSERT INTO informe (N_Rojas, N_Amarillas, Id_arbitro, Id_partido) VALUES (?, ?, ?, ?)";
                preparedStatement = conexion.prepared(insertar_informe);
                preparedStatement.setInt(1, informe.getN_rojas()); /* Se establece el numero de tarjetas rojas */
                preparedStatement.setInt(2, informe.getN_amarillas()); /* Se establece el numero de tarjetas amarillas */
                preparedStatement.setInt(3, informe.getID_arbitro()); /* Se establece el ID del arbitro */
                preparedStatement.setInt(4, informe.getID_partido()); /* Se establece el ID del partido */

                /* Se ejecuta la consulta */
                int filas = preparedStatement.executeUpdate();
                if (filas > 0) {
                    inInforme.recogermensaje("Informe añadido correctamente."); /* Se muestra mensaje de exito */
                }
                preparedStatement.close(); /* Se cierra la consulta */
            } catch (SQLException ex) {
                inInforme.recogermensaje("Error al añadir informe: " + ex.getMessage()); /* Se maneja la excepcion en caso de error */
            }
        } catch (Exception e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
        }
    }

    /* Metodo para obtener la lista de partidos y usarlos en el JComboBox */
    public List<String> obtenerPartidos() {
        List<String> partidos = new ArrayList<>();
        try {
            /* Se realiza la consulta para obtener los partidos */
            String consulta = "SELECT ID_partido, Fecha FROM partidos";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                String partidoInfo = resultSet.getInt("ID_partido") + " - " + resultSet.getString("Fecha");
                partidos.add(partidoInfo);
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return partidos;
    }

    /* Metodo para obtener la lista de arbitros y usarlos en el JComboBox */
    public List<String> obtenerArbitros() {
        List<String> arbitros = new ArrayList<>();
        try {
            /* Se realiza la consulta para obtener los arbitros */
            String consulta = "SELECT ID, Nombre FROM arbitro";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                String arbitroInfo = resultSet.getInt("ID") + " - " + resultSet.getString("Nombre");
                arbitros.add(arbitroInfo);
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener arbitros: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return arbitros;
    }

    /* Metodo para obtener el ID de un partido dado su representacion en el JComboBox */
    public int obtenerIDPartido(String partidoSeleccionado) {
        int idPartido = -1;
        try {
            /* Se prepara la consulta SQL para obtener el ID del partido */
            String consulta = "SELECT ID_partido FROM partidos WHERE Fecha = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setString(1, partidoSeleccionado.split(" - ")[1]); /* Se extrae la fecha */

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                idPartido = resultSet.getInt("ID_partido");
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del partido: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return idPartido;
    }

    /* Metodo para obtener el ID de un arbitro dado su nombre */
    public int obtenerIDArbitro(String arbitroSeleccionado) {
        int idArbitro = -1;
        try {
            /* Se prepara la consulta SQL para obtener el ID del arbitro */
            String consulta = "SELECT ID FROM arbitro WHERE Nombre = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setString(1, arbitroSeleccionado); /* Se extrae el nombre */

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                idArbitro = resultSet.getInt("ID");
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el ID del arbitro: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return idArbitro;
    }

    /* Metodo para obtener el nombre del arbitro de un partido */
    public String obtenerNombreArbitroPorPartido(int idPartido) {
        String nombreArbitro = "";
        try {
            /* Se prepara la consulta SQL para obtener el nombre del arbitro */
            String consulta = "SELECT a.Nombre FROM arbitro a JOIN partidos p ON a.ID = p.ID_arbitro WHERE p.ID_partido = ?";
            PreparedStatement preparedStatement = conexion.prepared(consulta);
            preparedStatement.setInt(1, idPartido);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                nombreArbitro = resultSet.getString("Nombre");
            }
            resultSet.close(); /* Se cierra el resultado de la consulta */
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre del arbitro: " + e.getMessage()); /* Se maneja la excepcion en caso de error */
        }
        return nombreArbitro;
    }
}


