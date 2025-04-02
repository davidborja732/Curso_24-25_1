import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class Ej_6 {
    static String url = "jdbc:mysql://localhost:3306/ej14";
    static String usuario = "root";
    static String Contraseña = "1234";

    public static void main(String[] args) {
        JFrame frame1 = new JFrame("Estudiante a Borrar");
        frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame1.setSize(500, 200);
        frame1.setLayout(new GridLayout(2, 1));
        JLabel ID = new JLabel("Dime el id del alumno a Borrar:");
        JTextField recogoID = new JTextField();
        JButton botonInsertar = new JButton("Borrar");
        frame1.add(ID);
        frame1.add(recogoID);
        frame1.add(botonInsertar);
        frame1.setVisible(true);
        botonInsertar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
                    int contador = 0;
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT * FROM alumnos WHERE id=" + recogoID.getText());
                    while (resultSet.next()) {
                        contador++;
                    }
                    if (contador > 0) {
                        PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM alumnos WHERE id=" + recogoID.getText());
                        preparedStatement.executeUpdate();
                        JOptionPane.showMessageDialog(frame1, "Usuario borrado");

                    } else {
                        JOptionPane.showMessageDialog(frame1, "No hay ningun usuario con ese id");
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
    }
}
