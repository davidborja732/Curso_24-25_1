
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Vendedores vendedores=new Vendedores();
        //creo vendedor y lo ñado a una lista de vendedores
        ArrayList<Vendedores> vendedores_deserializados=new ArrayList<>();
        ArrayList<Cerdo> listacerdos=new ArrayList<>();
        Vendedor vendedor1=new Vendedor(1,"Juan","Mercadona","juan@gmail.com");
        Vendedor vendedor2=new Vendedor(2,"Pepe","Alcampo","pepe@gmail.com");
        vendedores.add(vendedor1);
        vendedores.add(vendedor2);
        //creo cerdo y lo añado a una lista de cerdo
        Cerdo cerdo=new Cerdo();
        Cerdo cerdo1=new Cerdo(1,"Peppa","raza 1", "02-04-2010",23);
        Cerdo cerdo2=new Cerdo(2,"George","raza 2", "02-05-2010",45);
        cerdo.serializar(cerdo1);
        cerdo.serializar(cerdo2);
        cerdo.deserializar(new File("Ficheros/Cerdos.json"),listacerdos);
        for (Cerdo cerdos:listacerdos){
            System.out.println(cerdos.toString());
        }
        //Serializo vendedores
        vendedores.serializar(vendedores);
        //Deserializar vendedores
        vendedores.deserializar(new File("Ficheros/vendedores.xml"),vendedores_deserializados);
        for (Vendedores vendedores1:vendedores_deserializados){
            System.out.println(vendedores1.getVendedor());
        }

        String url = "jdbc:mysql://localhost:3306/practica_david_borja";
        String usuario = "root";
        String Contrasena = "1234";
        try (Connection connection = DriverManager.getConnection(url, usuario, Contrasena)) {
            System.out.println("1 para insertar");
            System.out.println("2 para actualizar");
            System.out.println("3 para ver");
            Scanner scanner=new Scanner(System.in);
            int opcion;
            System.out.println("Introduce un numero ");
            while (!scanner.hasNextInt()){
            System.out.println("Introduce un numero= ");
            scanner.next();
            }
            opcion= scanner.nextInt();
            if (opcion==1){
                System.out.println("Dime nombre ");
                String nombre= scanner.next();
                System.out.println("Dime raza ");
                String raza= scanner.next();
                System.out.println("Dime peso ");
                Float peso;
                System.out.println("Introduce un numero ");
                while (!scanner.hasNextFloat()){
                    System.out.println("Introduce un numero= ");
                    scanner.next();
                }
                peso= scanner.nextFloat();
                System.out.println("Dime Fecha nacimiento");
                String fecha_nacimiento= scanner.next();
                try {
                    PreparedStatement preparedStatement= connection.prepareStatement("INSERT INTO cerdos (nombre, raza,fecha_nacimiento,peso ) VALUES (?, ?, ?,?)");
                    preparedStatement.setString(1, nombre);
                    preparedStatement.setString(2, raza);
                    preparedStatement.setString(3, fecha_nacimiento);
                    preparedStatement.setFloat(4, peso);
                    preparedStatement.executeUpdate();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            } else if (opcion==2) {
                System.out.println("Dime el id a modificar");
                int id;
                System.out.println("Introduce un numero ");
                while (!scanner.hasNextFloat()){
                    System.out.println("Introduce un numero= ");
                    scanner.next();
                }
                id= scanner.nextInt();
                System.out.println("Dime nombre ");
                String nombre_empleado= scanner.nextLine();
                System.out.println("Dime empresa ");
                String empresa= scanner.nextLine();
                System.out.println("Dime contacto ");
                String contacto=scanner.nextLine();

                PreparedStatement preparedStatement = connection.prepareStatement("UPDATE vendedores SET nombre = ?, empresa = ?, contacto = ? WHERE Id ="+id);
                preparedStatement.setString(1, nombre_empleado);
                preparedStatement.setString(2, empresa);
                preparedStatement.setString(3, contacto);
                int filas=preparedStatement.executeUpdate();
                System.out.println(filas);
                if (filas>0){
                    System.out.println("vendedor Modificado");
                }else {
                    System.out.println("No existe nadie con ese id");
                }
            } else if (opcion==3) {
                System.out.println("CERDOS= ");
                Statement statement = connection.createStatement();
                ResultSet resultSet= statement.executeQuery("Select * from cerdos");
                while (resultSet.next()){
                    String Nombre=resultSet.getString("nombre");
                    String raza=resultSet.getString("raza");
                    String fecha_nacimiento=resultSet.getString("fecha_nacimiento");
                    String peso=resultSet.getString("peso");
                    System.out.println(Nombre+" "+raza+" "+fecha_nacimiento+" "+peso);
                }
                System.out.println("VENDEDORES=");
                Statement statement2 = connection.createStatement();
                ResultSet resultSet2= statement2.executeQuery("Select * from vendedores");
                while (resultSet2.next()){
                    String Nombre=resultSet.getString("nombre");
                    String empresa=resultSet.getString("empresa");
                    String contacto=resultSet.getString("contacto");
                    System.out.println(Nombre+" "+empresa+" "+contacto);
                }
            }else {
                System.out.println("Opcion desconocida");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
