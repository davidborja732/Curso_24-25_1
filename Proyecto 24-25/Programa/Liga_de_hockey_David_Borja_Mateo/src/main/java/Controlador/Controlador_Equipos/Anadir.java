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
    Conexion conexion=new Conexion();
    IN_Equipo inEquipo=new IN_Equipo();

    public Anadir() {
        inEquipo=new IN_Equipo();
    }

    public void Anadir_equipo(Equipo equipo) {
        try {
            PreparedStatement preparedStatement;
            try {
                // Inserto en la tabla equipo los datos seleccionados por el usuario
                String insertar_equipo = "INSERT INTO equipo (Nombre,N_Titulos,Estadio,DNI_entrenador) VALUES (?, ?, ?, ?)";
                preparedStatement = conexion.prepared(insertar_equipo);
                preparedStatement.setString(1, equipo.getNombre());
                preparedStatement.setInt(2,equipo.getN_trofeos());
                preparedStatement.setString(3, equipo.getEstadio());
                preparedStatement.setString(4, equipo.getDni_Entrenador());
                int filas = preparedStatement.executeUpdate();
                if (filas > 0) {
                    inEquipo.recogermensaje("Añadido correctamente.");
                }
                preparedStatement.close();
            } catch (SQLException ex) {
                inEquipo.recogermensaje("Error al añadir equipo: " + ex.getMessage());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    // Obtengo entrenadores y los meto en una lista para el JComboBox de la interfaz externa
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
