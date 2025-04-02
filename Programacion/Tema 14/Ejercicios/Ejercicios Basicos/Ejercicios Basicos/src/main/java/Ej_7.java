import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ej_7 {
    static String url = "jdbc:mysql://localhost:3306/ej14";
    static String usuario = "root";
    static String Contraseña = "1234";

    public static void main(String[] args) {
        JFrame frame1 = new JFrame("Mostrar todos los alumnos");
        frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame1.setSize(500, 200);
        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        JLabel ID = new JLabel("Dime el id del alumno a Borrar:");
        JLabel ID2 = new JLabel("Dime el id del alumno a Borrar:");
        JLabel ID3 = new JLabel("Dime el id del alumno a Borrar:");
        frame1.add(panel);
        try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM alumnos");
            while (resultSet.next()) {
                String Nombre = resultSet.getString("Nombre");
                String Apellidos = resultSet.getString("Apellidos");
                String Direccion = resultSet.getString("Direccion");
                String alumno = (Nombre + " " + Apellidos + " " + Direccion);
                panel.add(new JLabel(alumno));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        frame1.setVisible(true);


    }
}
