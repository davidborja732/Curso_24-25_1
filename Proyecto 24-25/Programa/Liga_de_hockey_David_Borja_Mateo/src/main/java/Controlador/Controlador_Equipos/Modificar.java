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
    private Conexion conexion = new Conexion();

    public Modificar() {

    }

    public int obtener_ID_equipo(String nombre) {
        int id_equipo = 0;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo WHERE Nombre='" + nombre + "'");
            while (resultSet.next()) {
                id_equipo = resultSet.getInt("ID_eq");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id_equipo;
    }

    public void modificarEquipo(Equipo equipo) {
        MO_Equipo moEquipo = new MO_Equipo();
        try {
            // Modifico en la tabla equipo los datos seleccionados por el usuario
            String modificar_equipo = "UPDATE equipo SET Nombre = ?, N_Titulos = ?, Estadio = ? ,DNI_entrenador = ? WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_equipo);
            preparedStatement.setString(1, equipo.getNombre());
            preparedStatement.setInt(2, equipo.getN_trofeos());
            preparedStatement.setString(3, equipo.getEstadio()); // Se añade el campo Estadio
            //preparedStatement.setInt(4, equipo.getDni_Entrenador());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moEquipo.recogermensaje("Modificado correctamente.");
            } else {
                moEquipo.recogermensaje("No se pudo modificar. Verifique que el equipo existe.");
            }
        } catch (SQLException ex) {
            moEquipo.recogermensaje("Error al modificar equipo: " + ex.getMessage());
        }
    }

    // Método con el que obtengo los equipos para poder usarlos en el JComboBox
    public List<String> obtenerEquipos() {
        List<String> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Nombre FROM equipo");
            while (resultSet.next()) {
                equipos.add(resultSet.getString("Nombre"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }

}

