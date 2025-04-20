import java.sql.*;

public class Conexion {
    private static String url="jdbc:mysql://localhost:3306/ej14";
    private static String usuario="root";
    private static String Contraseña="1234";

    public Conexion() {
    }

    public Connection conectar(){
        Connection connection=null;
        try {
            connection= DriverManager.getConnection(url,usuario,Contraseña);
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
    public  Statement statement(){
        Conexion conexion;
        Statement statement;
        try {
            statement=conectar().createStatement();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return statement();
    }
    public ResultSet resultSet(String consulta){
        ResultSet resultSet;
        try {
            resultSet=statement().executeQuery(consulta);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultSet;
    }
}
