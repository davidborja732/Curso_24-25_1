package Controlador;

import java.io.File;
import java.sql.*;

public class Conexion {
    private static String Usuario;
    private static String Contrasena;
    private static String URL_Liga;

    public Conexion() {
        inicializarValores();
    }

    private void inicializarValores() {
        Ficheros ficheros = new Ficheros();
        ficheros.lectura(new File("Ficheros/Informacion_conexion.txt"));
        try {
            Conexion.URL_Liga = ficheros.getLineas_lectura().get(0);
            Conexion.Usuario = ficheros.getLineas_lectura().get(1);
            Conexion.Contrasena = ficheros.getLineas_lectura().get(2);
        } catch (IndexOutOfBoundsException e) {
            throw new RuntimeException("Error al leer los valores de conexión: asegúrate de que el archivo tenga las líneas correctamente.", e);
        }
    }

    public Connection conectar() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(Conexion.URL_Liga, Conexion.Usuario, Conexion.Contrasena);
        } catch (SQLException e) {
            throw new RuntimeException("Error al conectar con la base de datos.", e);
        }
        return connection;
    }

    public PreparedStatement prepared(String consulta) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.conectar().prepareStatement(consulta);
        } catch (SQLException e) {
            throw new RuntimeException("Error al preparar la consulta SQL.", e);
        }
        return preparedStatement;
    }

    public Statement statement() {
        Statement statement = null;
        try {
            statement = this.conectar().createStatement();
        } catch (SQLException e) {
            throw new RuntimeException("Error al crear el Statement SQL.",e);
        }
        return statement;
    }

    public ResultSet resultSet(String consulta) {
        ResultSet resultSet = null;
        try {
            resultSet = this.statement().executeQuery(consulta);

        } catch (SQLException e) {
            throw new RuntimeException("Error al ejecutar la consulta SQL.", e);
        }
        return resultSet;
    }

    @Override
    public String toString() {
        return "URL: " + URL_Liga + ", Usuario: " + Usuario + ", Contraseña: " + Contrasena;
    }
}


