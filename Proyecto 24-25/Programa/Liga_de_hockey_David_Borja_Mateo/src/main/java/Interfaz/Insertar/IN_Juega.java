package Interfaz.Insertar;

import Conexiones.Conexion;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IN_Juega {
    public IN_Juega() {
    }

    public void Iniciar_insercion() {
        Conexion conexion = new Conexion();

        JFrame frame = new JFrame("Asignar equipo a partido");
        frame.setSize(400, 250);
        frame.setLayout(new GridLayout(4, 2));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        JComboBox<Integer> equipos = new JComboBox<>();
        JComboBox<Integer> partidos = new JComboBox<>();
        JComboBox<String> Rol = new JComboBox<>();
        JButton boton_Modificar = new JButton("Modificar");
        JButton boton_Cancelar = new JButton("Cancelar");

        frame.add(new JLabel("ID_eq "));
        frame.add(equipos);
        frame.add(new JLabel("Partido"));
        frame.add(partidos);
        frame.add(new JLabel("Rol "));
        frame.add(Rol);

        try {
            ResultSet resultSet = conexion.resultSet("SELECT ID_eq FROM equipo");
            while (resultSet.next()) {
                equipos.addItem(resultSet.getInt("ID_eq"));
            }
            resultSet.close();

            resultSet = conexion.resultSet("SELECT ID_partido FROM partidos");
            while (resultSet.next()) {
                partidos.addItem(resultSet.getInt("ID_partido"));
            }
            resultSet.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Rol.addItem("Local");
        Rol.addItem("Visitante");

        frame.add(boton_Modificar);
        frame.add(boton_Cancelar);
        frame.setVisible(true);

        boton_Modificar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    int idPartido = (int) partidos.getSelectedItem();
                    int idEquipo = (int) equipos.getSelectedItem();
                    String rolSeleccionado = (String) Rol.getSelectedItem();

                    // Consulta para verificar existencia del equipo en el partido
                    String consulta = "SELECT ID_eq, Rol FROM juega WHERE ID_partido = ?";
                    PreparedStatement stmt = conexion.prepared(consulta);
                    stmt.setInt(1, idPartido);
                    ResultSet resultSet = stmt.executeQuery();

                    boolean localExiste = false, visitanteExiste = false, equipoAsignado = false;

                    while (resultSet.next()) {
                        int equipoExistente = resultSet.getInt("ID_eq");
                        String rol = resultSet.getString("Rol");

                        if (equipoExistente == idEquipo) {
                            equipoAsignado = true;
                        }
                        if (rol.equals("Local")) localExiste = true;
                        if (rol.equals("Visitante")) visitanteExiste = true;
                    }
                    resultSet.close();

                    // Validaciones antes de la inserción
                    if (localExiste && rolSeleccionado.equals("Local")) {
                        JOptionPane.showMessageDialog(frame, "Este partido ya tiene un equipo local registrado.");
                    } else if (visitanteExiste && rolSeleccionado.equals("Visitante")) {
                        JOptionPane.showMessageDialog(frame, "Este partido ya tiene un equipo visitante registrado.");
                    } else if (equipoAsignado) {
                        JOptionPane.showMessageDialog(frame, "Este equipo ya está asignado a este partido.");
                    } else {
                        // Insertar nuevo registro
                        try {
                            String insertarSQL = "INSERT INTO juega VALUES (?, ?, ?)";
                            PreparedStatement preparedStatement = conexion.prepared(insertarSQL);
                            preparedStatement.setInt(1, Integer.parseInt(String.valueOf(equipos.getSelectedItem())));
                            preparedStatement.setInt(2, Integer.parseInt(String.valueOf(partidos.getSelectedItem())));
                            preparedStatement.setString(3, String.valueOf(Rol.getSelectedItem()));

                            int filas = preparedStatement.executeUpdate();
                            if (filas > 0) {
                                JOptionPane.showMessageDialog(frame, "Añadido correctamente.");
                            }
                        } catch (SQLException ex) {
                            throw new RuntimeException(ex);
                        }
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
        boton_Cancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
            }
        });
    }
}
