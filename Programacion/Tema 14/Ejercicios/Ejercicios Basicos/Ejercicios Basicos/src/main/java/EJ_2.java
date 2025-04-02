import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EJ_2 {
    public static void main(String[] args) {
        Conexion conexion=new Conexion();
        String url="jdbc:mysql://localhost:3306/ej14";
        String usuario="root";
        String Contraseña="1234";
        List<Alumno> alumnos = new ArrayList<>();
        alumnos.add(new Alumno("Juan", "Pérez", "Calle Mayor 123"));
        alumnos.add(new Alumno("Ana", "García", "Avenida Sol 45"));
        alumnos.add(new Alumno("Carlos", "López", "Plaza Central 78"));
        alumnos.add(new Alumno("Marta", "Fernández", "Calle Luna 10"));
        alumnos.add(new Alumno("Luis", "Hernández", "Avenida Norte 56"));
        alumnos.add(new Alumno("Elena", "Martín", "Calle Sur 89"));
        alumnos.add(new Alumno("Pedro", "Sánchez", "Boulevard Oeste 12"));
        alumnos.add(new Alumno("Clara", "Jiménez", "Calle Este 34"));
        alumnos.add(new Alumno("Álvaro", "Ruiz", "Pasaje Norte 67"));
        alumnos.add(new Alumno("Sofía", "Torres", "Calle Flor 90"));
        try {
            PreparedStatement preparedStatement= conexion.prepared("INSERT INTO alumnos (Nombre, Apellidos, Direccion) VALUES (?, ?, ?)");
            for (Alumno alumno:alumnos){
                preparedStatement.setString(1, alumno.getNombre());
                preparedStatement.setString(2, alumno.getApellidos());
                preparedStatement.setString(3, alumno.getDireccion());
                preparedStatement.executeUpdate();
            }
            Statement statement= conexion.statement();
            ResultSet resultSet= statement.executeQuery("Select * from alumnos");
            while (resultSet.next()){
                String Nombre=resultSet.getString("Nombre");
                String Apellidos=resultSet.getString("Apellidos");
                String Direccion=resultSet.getString("Direccion");
                System.out.println(Nombre+" "+Apellidos+" "+Direccion);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
