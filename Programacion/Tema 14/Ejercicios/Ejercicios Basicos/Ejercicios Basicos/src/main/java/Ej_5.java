import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class Ej_5 {
    static String url="jdbc:mysql://localhost:3306/ej14";
    static String usuario="root";
    static String Contraseña="1234";

    public static void main(String[] args) {
        JFrame frame1=new JFrame("Estudiante a modificar");
        frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame1.setSize(500, 200);
        frame1.setLayout(new GridLayout(2, 1));
        JLabel ID = new JLabel("Dime el id del alumno a modificar:");
        JTextField recogoID = new JTextField();
        JButton botonInsertar = new JButton("Modificar");
        frame1.add(ID);
        frame1.add(recogoID);
        frame1.add(botonInsertar);
        frame1.setVisible(true);
        botonInsertar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
                    int contador = 0;
                    Statement statement= connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT * FROM alumnos WHERE id=" + recogoID.getText());
                    while (resultSet.next()){
                        contador++;
                    }
                    if (contador>0){
                        frame1.dispose();
                        JFrame frame=new JFrame("Modificar estudiante");
                        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                        frame.setSize(400, 400);
                        frame.setLayout(new GridLayout(4, 1));
                        JLabel nombre = new JLabel("Nombre:");
                        JTextField recogonombre = new JTextField();
                        JLabel apellidos = new JLabel("Apellidos:");
                        JTextField recogoapellidos = new JTextField();
                        JLabel direccion = new JLabel("Dirección:");
                        JTextField recogodireccion = new JTextField();
                        JButton botonID = new JButton("Modificar alumno");
                        frame.add(nombre);
                        frame.add(recogonombre);
                        frame.add(apellidos);
                        frame.add(recogoapellidos);
                        frame.add(direccion);
                        frame.add(recogodireccion);
                        frame.add(botonID,BorderLayout.CENTER);
                        frame.setVisible(true);
                        botonID.addActionListener(new ActionListener() {
                            @Override
                            public void actionPerformed(ActionEvent e) {
                                Alumno alumno=new Alumno(recogonombre.getText(),recogoapellidos.getText(),recogodireccion.getText());
                                try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
                                    PreparedStatement preparedStatement = connection.prepareStatement("UPDATE alumnos SET Nombre = ?, Apellidos = ?, Direccion = ? WHERE Id ="+recogoID.getText());
                                    preparedStatement.setString(1, alumno.getNombre());
                                    preparedStatement.setString(2, alumno.getApellidos());
                                    preparedStatement.setString(3, alumno.getDireccion());
                                    int filas=preparedStatement.executeUpdate();
                                    System.out.println(filas);
                                    if (filas>0){
                                        JOptionPane.showMessageDialog(frame, "Alumno Modificado");
                                        frame.dispose();
                                    }
                                }catch (SQLException z) {
                                    throw new RuntimeException(z);
                                }
                            }
                        });
                    }else {
                        JOptionPane.showMessageDialog(frame1, "No hay ningun usuario con ese id");
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
    }
}
