package Controlador;

import java.io.File;
import java.sql.*;

public class Conexion {

    /* Variables para almacenar las credenciales de conexion */
    private static String Usuario;
    private static String Contrasena;
    private static String URL_Liga;

    /* Constructor de la clase */
    public Conexion() {
        inicializarValores(); /* Se inicializan los valores de conexion */
    }

    /* Metodo para leer y establecer los valores de conexion desde un archivo */
    private void inicializarValores() {
        Ficheros ficheros = new Ficheros(); /* Se crea una instancia de la clase Ficheros */
        ficheros.lectura(new File("Ficheros/Informacion_conexion.txt")); /* Se lee el archivo de configuracion */

        try {
            /* Se asignan los valores de conexion obtenidos del archivo */
            Conexion.URL_Liga = ficheros.getLineas_lectura().get(0);
            Conexion.Usuario = ficheros.getLineas_lectura().get(1);
            Conexion.Contrasena = ficheros.getLineas_lectura().get(2);
        } catch (IndexOutOfBoundsException e) {
            /* Se lanza una excepcion si el archivo no contiene todas las lineas necesarias */
            throw new RuntimeException("Error al leer los valores de conexion: asegurese de que el archivo tenga las lineas correctamente.", e);
        }
    }

    /* Metodo para establecer la conexion con la base de datos */
    public Connection conectar() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(Conexion.URL_Liga, Conexion.Usuario, Conexion.Contrasena);
        } catch (SQLException e) {
            /* Se lanza una excepcion si ocurre un error al conectar */
            throw new RuntimeException("Error al conectar con la base de datos.", e);
        }
        return connection;
    }

    /* Metodo para preparar una consulta SQL */
    public PreparedStatement prepared(String consulta) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.conectar().prepareStatement(consulta);
        } catch (SQLException e) {
            /* Se lanza una excepcion si ocurre un error al preparar la consulta */
            throw new RuntimeException("Error al preparar la consulta SQL.", e);
        }
        return preparedStatement;
    }

    /* Metodo para crear un Statement SQL */
    public Statement statement() {
        Statement statement = null;
        try {
            statement = this.conectar().createStatement();
        } catch (SQLException e) {
            /* Se lanza una excepcion si ocurre un error al crear el Statement */
            throw new RuntimeException("Error al crear el Statement SQL.", e);
        }
        return statement;
    }

    /* Metodo para ejecutar una consulta SQL y obtener un ResultSet */
    public ResultSet resultSet(String consulta) {
        ResultSet resultSet = null;
        try {
            resultSet = this.statement().executeQuery(consulta);
        } catch (SQLException e) {
            /* Se lanza una excepcion si ocurre un error al ejecutar la consulta */
            throw new RuntimeException("Error al ejecutar la consulta SQL.", e);
        }
        return resultSet;
    }

    /* Metodo para obtener una representacion en texto de los valores de conexion */
    @Override
    public String toString() {
        return "URL: " + URL_Liga + ", Usuario: " + Usuario + ", Contraseña: " + Contrasena;
    }
}



