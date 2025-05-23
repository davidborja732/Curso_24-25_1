package Controlador.Controlador_Partidos;

import Controlador.Conexion;
import Modelo.Partidos;
import Vista.Modificar.MO_Partido;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Modificar {
    private final Conexion conexion = new Conexion();
    private final MO_Partido moPartido=new MO_Partido();
    public Modificar() {
    }


    public void modificarPartido(Partidos partido) {
        try {
            String modificar_partido = "UPDATE partidos SET Fecha = ?, ID_arbitro = ? WHERE ID_partido = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_partido);
            preparedStatement.setDate(1, Date.valueOf(partido.getFecha()));
            preparedStatement.setInt(2, partido.getID_arbitro());
            preparedStatement.setInt(3, partido.getID_partido());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moPartido.recogermensaje("Partido modificado correctamente.");
            } else {
                moPartido.recogermensaje("No se pudo modificar el partido. Verifique los datos.");
            }
        } catch (SQLException ex) {
            moPartido.recogermensaje("Error al modificar partido: " + ex.getMessage());
        }
    }

    public List<Integer> obtenerPartidos() {
        List<Integer> partidos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT Id_partido FROM partidos");
            while (resultSet.next()) {
                partidos.add(resultSet.getInt("Id_partido"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        Collections.sort(partidos);
        return partidos;
    }

    public List<String> obtenerarbitros() {
        List<String> arbitros = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID,Nombre FROM arbitro");
            while (resultSet.next()) {
                arbitros.add(resultSet.getInt("ID")+" "+resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return arbitros;
    }

    public List<String> obtener_local_y_visitante(int partido){
        List<String> equipo = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq, Nombre FROM equipo WHERE ID_eq IN (SELECT ID_eq FROM juega WHERE ID_partido=" + partido +")");
            while (resultSet.next()) {
                equipo.add(resultSet.getInt("ID_eq") + " " + resultSet.getString("Nombre"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipo;
    }
    public void modificarganador(int equipo,int id_partido){
        try {
            String modificar_partido = "UPDATE partidos SET Ganador = ? WHERE ID_partido = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_partido);
            preparedStatement.setInt(1, equipo);
            preparedStatement.setInt(2, id_partido);

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moPartido.recogermensaje("ganador modificado correctamente.");
            } else {
                moPartido.recogermensaje("No se pudo modificar el Ganador. Verifique los datos.");
            }
            preparedStatement.close();
        } catch (SQLException ex) {
            moPartido.recogermensaje("Error al modificar partido: " + ex.getMessage());
        }

    }


}

