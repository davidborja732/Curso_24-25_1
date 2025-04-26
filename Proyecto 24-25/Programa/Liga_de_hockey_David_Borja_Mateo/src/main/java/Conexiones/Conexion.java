package Conexiones;

import java.io.File;
import java.sql.*;

public class Conexion {
    private static String URL_Login;
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
            Conexion.URL_Login = ficheros.getLineas_lectura().get(0);
            Conexion.URL_Liga = ficheros.getLineas_lectura().get(1);
            Conexion.Usuario = ficheros.getLineas_lectura().get(2);
            Conexion.Contrasena = ficheros.getLineas_lectura().get(3);
        } catch (IndexOutOfBoundsException e) {
            throw new RuntimeException("Error al leer los valores de conexión: asegúrate de que el archivo tenga las líneas correctamente.", e);
        }
    }

    public Connection conectar(int opcion) {
        Connection connection = null;
        try {
            if (opcion==1){
                connection = DriverManager.getConnection(Conexion.URL_Login, Conexion.Usuario, Conexion.Contrasena);
            } else if (opcion==2) {
                connection = DriverManager.getConnection(Conexion.URL_Liga, Conexion.Usuario, Conexion.Contrasena);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al conectar con la base de datos.", e);
        }
        return connection;
    }

    public PreparedStatement prepared(String consulta,int opcion) {
        PreparedStatement preparedStatement = null;
        try {
            if (opcion==1){
                preparedStatement = this.conectar(1).prepareStatement(consulta);
            } else if (opcion==2) {
                preparedStatement = this.conectar(2).prepareStatement(consulta);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al preparar la consulta SQL.", e);
        }
        return preparedStatement;
    }

    public Statement statement(int opcion) {
        Statement statement = null;
        try {
            if (opcion==1){
                statement = this.conectar(1).createStatement();
            } else if (opcion==2) {
                statement = this.conectar(2).createStatement();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al crear el Statement SQL.",e);
        }
        return statement;
    }

    public ResultSet resultSet(String consulta,int opcion) {
        ResultSet resultSet = null;
        try {
            if (opcion==1){
                resultSet = this.statement(1).executeQuery(consulta);
            } else if (opcion==2) {
                resultSet = this.statement(2).executeQuery(consulta);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al ejecutar la consulta SQL.", e);
        }
        return resultSet;
    }

    @Override
    public String toString() {
        return "URL: " + URL_Login + ", Usuario: " + Usuario + ", Contraseña: " + Contrasena;
    }
}


