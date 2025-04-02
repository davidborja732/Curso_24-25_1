import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class EJ_8 {
    static String url = "jdbc:mysql://localhost:3306/ej14";
    static String usuario = "root";
    static String Contraseña = "1234";

    public static void main(String[] args) {
        JFrame frame = new JFrame("Menu opciones");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.setLayout(new GridLayout(2, 2));
        JButton BuscoId = new JButton("Buscar ID");
        JButton BuscoNombre = new JButton("Buscar Nombre");
        JButton BuscoApellidos = new JButton("Buscar Apellidos");
        JButton BuscoNomApe = new JButton("Buscar Nombre y Apellidos");
        frame.add(BuscoId);
        frame.add(BuscoNombre);
        frame.add(BuscoApellidos);
        frame.add(BuscoNomApe);
        BuscoId.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFrame frame1 = new JFrame("Estudiante ID");
                frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame1.setSize(500, 200);
                frame1.setLayout(new GridLayout(2, 1));
                JLabel ID = new JLabel("Dime el id del alumno");
                JTextField recogoID = new JTextField();
                JButton botonBuscar = new JButton("Buscar");
                frame1.add(ID);
                frame1.add(recogoID);
                frame1.add(botonBuscar);
                frame1.setVisible(true);
                //int contador=0;
                botonBuscar.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
                            Statement statement = connection.createStatement();
                            ResultSet resultSet = statement.executeQuery("SELECT * FROM alumnos WHERE id=" + recogoID.getText());
                            resultSet.next();
                            if (!resultSet.next()){
                                JOptionPane.showMessageDialog(frame,"No hay resultados");
                            }
                            while (resultSet.next()){
                                String Nombre = resultSet.getString("Nombre");
                                String Apellidos = resultSet.getString("Apellidos");
                                String Direccion = resultSet.getString("Direccion");
                                String alumnno=(Nombre + " " + Apellidos + " " + Direccion);
                                JOptionPane.showMessageDialog(frame,alumnno);
                            }
                        } catch (SQLException ex) {
                            throw new RuntimeException(ex);
                        }
                        frame1.dispose();
                    }
                });
            }
        });
        BuscoNombre.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFrame frame1 = new JFrame("Estudiante Nombre");
                frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame1.setSize(500, 200);
                frame1.setLayout(new GridLayout(2, 1));
                JLabel Nombre = new JLabel("Dime el Nombre del alumno");
                JTextField recogoNombre = new JTextField();
                JButton botonBuscar = new JButton("Buscar");
                frame1.add(Nombre);
                frame1.add(recogoNombre);
                frame1.add(botonBuscar);
                botonBuscar.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
                            Statement statement = connection.createStatement();
                            ResultSet resultSet = statement.executeQuery("SELECT * FROM alumnos WHERE Nombre="+"'"+recogoNombre.getText()+"'");
                            resultSet.next();
                            if (!resultSet.next()){
                                JOptionPane.showMessageDialog(frame,"No hay resultados");
                            }
                            while (resultSet.next()){
                                String Nombre = resultSet.getString("Nombre");
                                String Apellidos = resultSet.getString("Apellidos");
                                String Direccion = resultSet.getString("Direccion");
                                String alumnno=(Nombre + " " + Apellidos + " " + Direccion);
                                JOptionPane.showMessageDialog(frame,alumnno);
                            }
                        } catch (SQLException ex) {
                            throw new RuntimeException(ex);
                        }
                        frame1.dispose();
                    }
                });
                frame1.setVisible(true);
            }
        });
        BuscoApellidos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFrame frame1 = new JFrame("Estudiante Apellidos");
                frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame1.setSize(500, 200);
                frame1.setLayout(new GridLayout(2, 1));
                JLabel Apellido = new JLabel("Dime el Apellido");
                JTextField recogoApellido = new JTextField();
                JButton botonBuscar = new JButton("Buscar");
                frame1.add(Apellido);
                frame1.add(recogoApellido);
                frame1.add(botonBuscar);
                botonBuscar.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
                            Statement statement = connection.createStatement();
                            ResultSet resultSet = statement.executeQuery("SELECT * FROM alumnos WHERE Apellidos="+"'"+ recogoApellido.getText()+"'");
                            System.out.println("SELECT * FROM alumnos WHERE Apellidos="+"'"+ recogoApellido.getText()+"'");
                            resultSet.next();
                            /*if (!resultSet.next()){
                                JOptionPane.showMessageDialog(frame,"No hay resultados");
                            }*/
                            while (resultSet.next()){
                                int id=resultSet.getInt("Id");
                                String Nombre = resultSet.getString("Nombre");
                                String Apellidos = resultSet.getString("Apellidos");
                                String Direccion = resultSet.getString("Direccion");
                                String alumnno=(Nombre + " " + Apellidos + " " + Direccion);
                                JOptionPane.showMessageDialog(frame,alumnno);
                            }
                        } catch (SQLException ex) {
                            throw new RuntimeException(ex);
                        }
                        frame1.dispose();
                    }
                });
                frame1.setVisible(true);
            }
        });
        BuscoNomApe.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFrame frame1 = new JFrame("Estudiante Nombre y Apellidos");
                frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame1.setSize(500, 200);
                frame1.setLayout(new GridLayout(3, 1));
                JLabel nombre = new JLabel("Dime el nombre del alumno ");
                JTextField recogonombre = new JTextField();
                JLabel apellido = new JLabel("Dime el apellido del alumno ");
                JTextField recogoapellido = new JTextField();
                JButton botonBuscar = new JButton("Buscar");
                frame1.add(nombre);
                frame1.add(recogonombre);
                frame1.add(apellido);
                frame1.add(recogoapellido);
                frame1.add(botonBuscar);
                botonBuscar.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        try (Connection connection = DriverManager.getConnection(url, usuario, Contraseña)) {
                            Statement statement = connection.createStatement();
                            ResultSet resultSet;
                            if (recogonombre.getText().isBlank()){
                                resultSet = statement.executeQuery("SELECT * FROM alumnos WHERE Apellidos LIKE "+"'%"+recogoapellido.getText()+"%'");
                                System.out.println("SELECT * FROM alumnos WHERE Apellidos LIKE "+"'%"+recogoapellido.getText()+"%'");
                            } else if (recogoapellido.getText().isBlank()) {
                                resultSet = statement.executeQuery("SELECT * FROM alumnos WHERE Nombre LIKE "+"'%"+recogonombre.getText()+"%'");
                                System.out.println("SELECT * FROM alumnos WHERE Nombre LIKE "+"'%"+recogonombre.getText()+"%'");
                            }else {
                                resultSet=statement.executeQuery("SELECT * FROM alumnos WHERE Nombre LIKE "+"'%"+recogonombre.getText()+"%'"+" OR Apellidos LIKE "+"'%"+recogoapellido.getText()+"%'");
                                System.out.println("SELECT * FROM alumnos WHERE Nombre LIKE "+"'%"+recogonombre.getText()+"%'"+" OR Apellidos LIKE "+"'%"+recogoapellido.getText()+"%'");
                            }
                            boolean next = resultSet.next();
                            /**if (!resultSet.next()){
                                JOptionPane.showMessageDialog(frame,"No hay resultados");
                            }**/
                            while (resultSet.next()){
                                String Nombre = resultSet.getString("Nombre");
                                String Apellidos = resultSet.getString("Apellidos");
                                String Direccion = resultSet.getString("Direccion");
                                String alumnno=(Nombre + " " + Apellidos + " " + Direccion);
                                JOptionPane.showMessageDialog(frame,alumnno);
                            }
                        } catch (SQLException ex) {
                            throw new RuntimeException(ex);
                        }
                        frame1.dispose();
                    }
                });
                frame1.setVisible(true);
            }
        });
        frame.setVisible(true);
    }
}
