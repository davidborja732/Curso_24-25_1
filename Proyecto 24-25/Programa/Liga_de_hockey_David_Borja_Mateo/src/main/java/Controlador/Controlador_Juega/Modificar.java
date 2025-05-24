package Controlador.Controlador_Juega;

import Controlador.Conexion;
import Modelo.Juega;
import Vista.Modificar.MO_Juega;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Modificar {
    private Conexion conexion=new Conexion();

    public Modificar() {

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
    public void Modificar_juega(Juega juega) {
        MO_Juega moJuega=new MO_Juega();
        try {
            // Modifico en la tabla juega los datos seleccionados por el usuario, comprobando también el ROL en la condición WHERE
            String modificar_juega = "UPDATE juega SET ID_eq = ? WHERE ID_partido = ? AND Rol = ?";
            PreparedStatement preparedStatement = conexion.prepared(modificar_juega);
            preparedStatement.setInt(1, juega.getID_equipo());
            preparedStatement.setInt(2, juega.getID_partido());
            preparedStatement.setString(3, juega.getROL());

            int filas = preparedStatement.executeUpdate();
            if (filas > 0) {
                moJuega.recogermensaje("Modificado correctamente.");
            } else {
                moJuega.recogermensaje("No se pudo modificar. Verifique que el partido y el rol existen.");
            }
        } catch (SQLException ex) {
            moJuega.recogermensaje("Error al modificar equipo: " + ex.getMessage());

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
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }

    // Metodo con el que obtengo los partidos para poder usarlos en el JComboBox
    public List<Integer> obtenerPartidos() {
        List<Integer> partidos = new ArrayList<>();
        try {
            try (ResultSet resultSet = conexion.resultSet("SELECT ID_partido FROM juega")) {
                while (resultSet.next()) {
                    int idPartido = resultSet.getInt("ID_partido");
                    if (!partidos.contains(idPartido)) {
                        partidos.add(idPartido);
                    }
                }
                Collections.sort(partidos);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener partidos: " + e.getMessage());
        }
        return partidos;
    }
}
