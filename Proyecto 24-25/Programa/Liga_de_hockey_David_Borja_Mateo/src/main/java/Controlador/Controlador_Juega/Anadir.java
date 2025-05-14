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
    Conexion conexion;
    IN_Juega inJuega;
    public Anadir() {
        conexion = new Conexion();
        inJuega = new IN_Juega();
    }
    public int obtener_ID_equipo(String nombre){
        int id_equipo=0;
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo WHERE Nombre='"+nombre+"'");
            while (resultSet.next()) {
                id_equipo=resultSet.getInt("ID_eq");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id_equipo;
    }
    public void Anadir_juega(Juega juega) {
        try {
            // Consulta que usaré para verificar existencia del equipo en un partido
            String consulta = "SELECT ID_eq, Rol FROM juega WHERE ID_partido = ?";
            PreparedStatement preparedStatement;
            preparedStatement= conexion.prepared(consulta);
            preparedStatement.setInt(1, juega.getID_partido());
            ResultSet resultSet = preparedStatement.executeQuery();

            boolean localExiste = false, visitanteExiste = false, equipoAsignado = false;

            while (resultSet.next()) {
                int equipoExistente = resultSet.getInt("ID_eq");
                String rol = resultSet.getString("Rol");
                if (equipoExistente == juega.getID_equipo()) {
                    equipoAsignado = true;
                }
                if (rol.equals("Local")){
                    localExiste = true;
                }
                if (rol.equals("Visitante")){
                    visitanteExiste = true;
                }
            }
            resultSet.close();
            preparedStatement.close();

            if (localExiste && juega.getROL().equals("Local")) {
                inJuega.recogermensaje("Este partido ya tiene un equipo local registrado.");
            } else if (visitanteExiste && juega.getROL().equals("Visitante")) {
                inJuega.recogermensaje("Este partido ya tiene un equipo visitante registrado.");
            } else if (equipoAsignado) {
                inJuega.recogermensaje("Este equipo ya está asignado a este partido.");;
            } else {
                // Inserto en la tabla juega los datos seleccionados por el usuario
                try {
                    String insertar_juega = "INSERT INTO juega VALUES (?, ?, ?)";
                    preparedStatement = conexion.prepared(insertar_juega);
                    preparedStatement.setInt(1,juega.getID_equipo());
                    preparedStatement.setInt(2, juega.getID_partido());
                    preparedStatement.setString(3, juega.getROL());
                    int filas = preparedStatement.executeUpdate();
                    if (filas > 0) {
                        inJuega.recogermensaje("Añadido correctamente.");

                    }
                } catch (SQLException ex) {
                    inJuega.recogermensaje("Error al añadir equipo: " + ex.getMessage());
                }
                preparedStatement.close();
            }
        } catch (SQLException ex) {
            inJuega.recogermensaje("Error en la verificación de datos: " + ex.getMessage());
        }
    }

    // Obtengo equipos y los meto a una lista que después metere a los JComboBox que tengo en la interfaz
    public List<String> obtenerEquipos() {
        List<String> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Nombre FROM equipo");
            while (resultSet.next()) {
                equipos.add(resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }

    // Obtengo partidos y los meto a una lista que después metere a los Jcombobox que tengo en la interfaz
    public List<Integer> obtenerPartidos() {
        List<Integer> partidos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_partido FROM partidos");
            while (resultSet.next()) {
                partidos.add(resultSet.getInt("ID_partido"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }
}
