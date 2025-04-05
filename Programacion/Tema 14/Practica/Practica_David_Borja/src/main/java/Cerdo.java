import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.*;


import java.io.*;
import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;

public class Cerdo {
    private int id;
    private String nombre;
    private String raza;
    private String fecha_nacimiento;
    private double peso;

    public Cerdo(int id, String nombre, String raza, String fecha_nacimiento, double peso) {
        this.id = id;
        this.nombre = nombre;
        this.raza = raza;
        this.fecha_nacimiento = fecha_nacimiento;
        this.peso = peso;
    }

    public Cerdo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
    public void serializar(Cerdo cerdo){
        //creo el objectmapper para poder serializar
        ObjectMapper objectMapper=new ObjectMapper();
        //escribire en este fichero el fichero serializado
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("Ficheros/Cerdos.json",true))){
            //clase que almacena el objeto serializado
            String json = objectMapper.writeValueAsString(cerdo);
            //Lo escribo en el objeto
            bufferedWriter.write(json);
            bufferedWriter.newLine();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    public void deserializar(File file, ArrayList<Cerdo> arrayList){
        //creo el objectmapper para poder serializar
        ObjectMapper objectMapper=new ObjectMapper();
        try(BufferedReader bufferedReader= new BufferedReader(new FileReader(file))){
            //Leo cada linea que sera un objeto cerdo
            String linea;
            while ((linea= bufferedReader.readLine())!=null){
                //creo cerdo que sera el objeto desrializado y lo meto a una lista
                Cerdo cerdo=(Cerdo) objectMapper.readValue(linea, Cerdo.class);
                arrayList.add(cerdo);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String toString() {
        return "Cerdo{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", raza='" + raza + '\'' +
                ", fecha_nacimiento=" + fecha_nacimiento +
                ", peso=" + peso +
                '}';
    }
}
