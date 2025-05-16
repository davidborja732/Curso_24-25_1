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
    private final Conexion conexion = new Conexion();

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

    public void modificarEquipo(Equipo equipo,int id_eq_seleccionado) {
        MO_Equipo moEquipo = new MO_Equipo();
        try {
            // Modifico en la tabla equipo los datos seleccionados por el usuario
            String modificar_equipo = "UPDATE equipo SET Nombre = ?, N_Titulos = ?, Estadio = ? ,DNI_entrenador = ? WHERE ID_eq = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_equipo);
            preparedStatement.setString(1, equipo.getNombre());
            preparedStatement.setInt(2, equipo.getN_trofeos());
            preparedStatement.setString(3, equipo.getEstadio());
            preparedStatement.setString(4, equipo.getDni_Entrenador());
            preparedStatement.setInt(5,id_eq_seleccionado);

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

    // Metodo con el que obtengo los equipos para poder usarlos en el JComboBox
    public List<String> obtenerEquipos() {
        List<String> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Nombre FROM equipo");
            while (resultSet.next()) {
                equipos.add(resultSet.getString("Nombre"));
            }
            Collections.sort(equipos);
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }
    public List<String> obtenerEntrenadores() {
        List<String> entrenadores = new ArrayList<>();
        try {
            String consulta = "SELECT DNI,Nombre, Apellidos FROM persona WHERE DNI IN (SELECT DNI FROM entrenador WHERE DNI NOT IN (SELECT DNI_Entrenador FROM equipo))";
            ResultSet resultSet = conexion.resultSet(consulta);
            while (resultSet.next()) {
                String nombreCompleto =resultSet.getString("DNI")+" "+ resultSet.getString("Nombre") + " " + resultSet.getString("Apellidos");
                entrenadores.add(nombreCompleto);
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener entrenadores: " + e.getMessage());
        }
        return entrenadores;
    }

}

