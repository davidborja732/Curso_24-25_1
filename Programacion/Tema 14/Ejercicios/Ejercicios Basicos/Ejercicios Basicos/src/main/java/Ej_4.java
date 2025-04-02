import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Ej_4 {
    static String url="jdbc:mysql://localhost:3306/ej14";
    static String usuario="root";
    static String Contraseña="1234";
    public static void main(String[] args) {
        JFrame frame=new JFrame("Añadir estudiante");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.setLayout(new GridLayout(4, 1));
        JLabel nombre = new JLabel("Nombre:");
        JTextField recogonombre = new JTextField();
        JLabel apellidos = new JLabel("Apellidos:");
        JTextField recogoapellidos = new JTextField();
        JLabel direccion = new JLabel("Dirección:");
        JTextField recogodireccion = new JTextField();
        JButton botonInsertar = new JButton("Insertar alumno");
        frame.add(nombre);
        frame.add(recogonombre);
        frame.add(apellidos);
        frame.add(recogoapellidos);
        frame.add(direccion);
        frame.add(recogodireccion);
        frame.add(botonInsertar,BorderLayout.CENTER);
        frame.setVisible(true);
        botonInsertar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Alumno alumno=new Alumno(recogonombre.getText(),recogoapellidos.getText(),recogodireccion.getText());
                try (Connection connection= DriverManager.getConnection(url,usuario,Contraseña)) {
                    PreparedStatement preparedStatement = connection.prepareStatement("INSERT alumnos (Nombre, Apellidos, Direccion) VALUES (?, ?, ?)");
                    preparedStatement.setString(1, alumno.getNombre());
                    preparedStatement.setString(2, alumno.getApellidos());
                    preparedStatement.setString(3, alumno.getDireccion());
                    int filas=preparedStatement.executeUpdate();
                    if (filas>0){
                        JOptionPane.showMessageDialog(frame, "Alumno añadido");
                        frame.dispose();
                    }
                }catch (SQLException z) {
                    throw new RuntimeException(z);
                }
            }
        });
    }
}
