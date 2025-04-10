package org.example;

import java.sql.*;

public class Conexion {
    private static String url="jdbc:mysql://localhost:3306/repasoexamen";
    private static String usuario="root";
    private static String Contrasena="1234";

    public Conexion() {
    }

    public Connection conectar(){
        Connection connection=null;
        try {
            connection= DriverManager.getConnection(url,usuario,Contrasena);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
    public PreparedStatement prepared(String consulta){
        Conexion conexion=new Conexion();
        PreparedStatement preparedStatement;
        try {
            preparedStatement=conexion.conectar().prepareStatement(consulta);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return preparedStatement;
    }
    public ResultSet resultSet(String consulta){
        ResultSet resultSet = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = conectar();
            preparedStatement = connection.prepareStatement(consulta);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultSet;
    }
}
