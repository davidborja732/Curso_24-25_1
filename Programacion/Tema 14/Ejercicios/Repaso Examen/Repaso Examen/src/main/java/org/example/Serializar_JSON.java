package org.example;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Serializar_JSON {
    private static String url="jdbc:mysql://localhost:3306/repasoexamen";
    private static String usuario="root";
    private static String Contrasena="1234";
    public static void main(String[] args) {
        ArrayList<Alumno> listaalumnos = new ArrayList<>();
        ObjectMapper objectMapper=new ObjectMapper();
        try(Connection connection= DriverManager.getConnection(url,usuario,Contrasena);
        BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("Ficheros/Serializar_JSON.json",true))){
            Statement statement= connection.createStatement();
            ResultSet resultSet=statement.executeQuery("SELECT * FROM alumnos");
            while (resultSet.next()){
                int id=resultSet.getInt("Id");
                String nombre=resultSet.getString("Nombre");
                String apellidos=resultSet.getString("Apellidos");
                String direccion=resultSet.getString("Direccion");
                Alumno alumno=new Alumno(id,nombre,apellidos,direccion);
                listaalumnos.add(alumno);
            }
            for (Alumno alumnos:listaalumnos){
                String json= objectMapper.writeValueAsString(alumnos);
                bufferedWriter.write(json);
                bufferedWriter.newLine();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
