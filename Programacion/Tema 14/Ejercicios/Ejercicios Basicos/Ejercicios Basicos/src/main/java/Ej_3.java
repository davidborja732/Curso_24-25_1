import java.sql.*;

public class Ej_3 {
    public static void main(String[] args) {
        String url="jdbc:mysql://localhost:3306/ej14";
        String usuario="root";
        String Contraseña="1234";
        Alumno alumno=new Alumno(3,"Antonio","Lopez","Calle Madrid Nº3");
        try (Connection connection= DriverManager.getConnection(url,usuario,Contraseña)) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO alumnos VALUES (?,?, ?, ?)");
            preparedStatement.setInt(1, alumno.getId());
            preparedStatement.setString(2, alumno.getNombre());
            preparedStatement.setString(3, alumno.getApellidos());
            preparedStatement.setString(4, alumno.getDireccion());
            preparedStatement.executeUpdate();
        } catch (SQLIntegrityConstraintViolationException e){
            System.out.println("Ya existe un usario con ese id");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
