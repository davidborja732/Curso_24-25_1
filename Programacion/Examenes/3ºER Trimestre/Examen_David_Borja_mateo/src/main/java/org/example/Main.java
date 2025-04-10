package org.example;

import org.example.Apartado_1.Autor;
import org.example.Apartado_1.Libro;
import org.example.Apartados_2_3_4_5.Deserializar;
import org.example.Apartados_2_3_4_5.Serializar;

import java.io.File;
import java.sql.*;
import java.time.LocalDate;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        //Llamo a mi clase deserializar
        Deserializar deserializar=new Deserializar();
        //Llamo a mi clase serializar
        Serializar serializar=new Serializar();
        //Creo libros
        Libro libro1=new Libro(1,20.90, LocalDate.of(2003,12,23),"Comic","Mortadelo y filemon");
        Libro libro2=new Libro(2,21.94, LocalDate.of(2013,11,19),"Comic","Mortadelo y filemon Las nuevas aventuras");
        //Llamo al metodo serializa_libro de la clase serializar
        serializar.serializar_libro(libro1);
        serializar.serializar_libro(libro2);
        //Creo autores
        Autor autor1=new Autor(1,"Ibañez","Desconocida","Iabñez@gmail.com");
        Autor autor2=new Autor(2,"Stephen King","Estadoudinenese","Stephen@gmail.com");
        //Llamo al metodo serializa_Autor de la clase serializar
        serializar.serializar_Autor(autor1);
        serializar.serializar_Autor(autor2);
        //Deserializao y llamo a la listas para ver si ha funcionado la deserializacion de libros
        deserializar.Deserializar_Libro(new File("Ficheros/libros.json"));
        for (Libro libro: deserializar.getLibros()){
            System.out.println(libro);
        }
        //Deserializao y llamo a la listas para ver si ha funcionado la deserializacion de Autor
        deserializar.Deserializar_Autor(new File("Ficheros/autores.xml"));
        for (Autor autor: deserializar.getAutores()){
            System.out.println(autor);
        }
        //Hago la conexiona la base de datos
        try(Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/examenBorja","root","1234")){
            //hago el prepartedstatement para poder insertar un nuevo libro
            PreparedStatement preparedStatement= connection.prepareStatement("INSERT INTO Libro VALUES (?,?,?,?,?)");
            preparedStatement.setInt(1,libro1.getId());//Especifico el valor de cada ? que sera el valor que se introducira en la base de datos
            preparedStatement.setString(2,libro1.getTitulo());
            preparedStatement.setString(3, libro1.getGenero());
            preparedStatement.setDate(4, Date.valueOf(libro1.getFecha_publicacion()));
            preparedStatement.setDouble(5,libro1.getPrecio());
            int filas= preparedStatement.executeUpdate();
            if (filas>0){
                System.out.println("Insertado correctamente");// si devuelve 1 fila o mas nos avisara de que se ha insertado correctamente
            }
            //hago el prepartedstatement para poder actualizar un Autor
            PreparedStatement preparedStatement1= connection.prepareStatement("UPDATE Autor SET nombre=?,nacionalidad=?,email=? WHERE id=1");
            preparedStatement1.setString(1,"Lopez");//Especifico el valor de cada ? que sera el valor que se actualizara en la base de datos
            preparedStatement1.setString(2,"Argentino");
            preparedStatement1.setString(3,"nuevoemail@gmail.com");
            int filas1= preparedStatement1.executeUpdate();
            if (filas1>0){
                System.out.println("Modificado correctamente");// si devuelve 1 fila o mas nos avisara de que se ha actualizado correctamente
            }
            Statement statement= connection.createStatement();//preparo un statement para poder hacer un select en la base de datos
            ResultSet resultSet;
            resultSet=statement.executeQuery("SELECT * FROM Libro");//Consulta a realizar
            System.out.println("Libros=");
            while (resultSet.next()){
                int id= resultSet.getInt("id");
                String titulo= resultSet.getString("titulo");
                String genero= resultSet.getString("genero");
                LocalDate fechapublicacion= resultSet.getDate("fecha_publicacion").toLocalDate();
                double precio=resultSet.getDouble("precio");
                System.out.println(id+" "+titulo+" "+genero+" "+fechapublicacion+" "+precio);// da el valor de lo que devuelve en los result.get y lo imprimo
            }
            resultSet=statement.executeQuery("SELECT * FROM Autor");
            System.out.println("Autores=");
            while (resultSet.next()){
                int id= resultSet.getInt("id");
                String nombre= resultSet.getString("nombre");
                String nacionalidad=resultSet.getString("nacionalidad");
                String email= resultSet.getString("email");
                System.out.println(id+" "+nombre+" "+" "+nacionalidad+" "+email);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
