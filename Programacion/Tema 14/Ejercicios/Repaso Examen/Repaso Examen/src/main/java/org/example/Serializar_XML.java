package org.example;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class Serializar_XML {
    private static final String url="jdbc:mysql://localhost:3306/repasoexamen";
    private static final String usuario="root";
    private static final String Contrasena="1234";
    public static void main(String[] args) {
        ArrayList<Alumno> listaalumnos=new ArrayList<>();
        try(Connection connection= DriverManager.getConnection(url,usuario,Contrasena);
            BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("Ficheros/Serializar.xml",true))){
            Statement statement= connection.createStatement();
            ResultSet resultSet= statement.executeQuery("SELECT * FROM alumnos");
            while (resultSet.next()){
                int id=resultSet.getInt("Id");
                String nombre=resultSet.getString("Nombre");
                String apellidos=resultSet.getString("Apellidos");
                String direccion=resultSet.getString("Direccion");
                Alumno alumno1=new Alumno(id,nombre,apellidos,direccion);
                listaalumnos.add(alumno1);
            }
            for (Alumno alumno:listaalumnos){
                StringWriter stringWriter=new StringWriter();
                JAXBContext jaxbContext=JAXBContext.newInstance(Alumno.class);
                Marshaller marshaller= jaxbContext.createMarshaller();
                marshaller.marshal(alumno,stringWriter);
                bufferedWriter.write(String.valueOf(stringWriter));
                bufferedWriter.newLine();

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
