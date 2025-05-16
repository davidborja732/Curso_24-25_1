package Controlador.Controlador_Partidos;

import Controlador.Conexion;
import Modelo.Equipo;
import Modelo.Juega;
import Modelo.Partidos;
import Vista.Insertar.IN_Juega;
import Vista.Insertar.IN_Partido;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Anadir {
    Conexion conexion;
    IN_Partido inPartido;
    public Anadir() {
        conexion = new Conexion();
        inPartido = new IN_Partido();
    }
    public void Anadir_Partido(Partidos partidos) {
        try {
            PreparedStatement preparedStatement;
            try {
                // Inserto en la tabla equipo los datos seleccionados por el usuario
                String insertar_equipo = "INSERT INTO equipo (Fecha,ID_arbitro) VALUES (?, ?)";
                preparedStatement = conexion.prepared(insertar_equipo);
                preparedStatement.setDate(1,Date.valueOf(String.valueOf(partidos.getFecha())));
                preparedStatement.setInt(2,partidos.getID_arbitro());
                int filas = preparedStatement.executeUpdate();
                if (filas > 0) {
                    inPartido.recogermensaje("Añadido correctamente.");
                }
                preparedStatement.close();
            } catch (SQLException ex) {
                inPartido.recogermensaje("Error al añadir equipo: " + ex.getMessage());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Obtengo equipos y los meto a una lista que después metere a los JComboBox que tengo en la interfaz
    public List<String> obtenerarbitros() {
        List<String> equipos = new ArrayList<>();
        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID,Nombre FROM arbitro");
            while (resultSet.next()) {
                equipos.add(String.valueOf(resultSet.getInt("ID")+" "+resultSet.getString("Nombre")));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener equipos: " + e.getMessage());
        }
        return equipos;
    }
}
