package Ejercicio_1;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    static boolean buscar(String regex, String texto) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(texto);
        return matcher.find();
    }
    static void recorrerlistas(ArrayList lista){
        for (int i=0;i<lista.size()-1;i++){
            System.out.println(lista.get(i));
        }
    }

    public static void main(String[] args) {
        String correoyahoo = "[a-zA-Z0-9_%$]+@yahoo.[a-zA-Z]{1,}|[a-zA-Z0-9_%$]+@yahoo.[a-zA-Z]{1,}.[a-zA-Z]{1,}";
        String last_login = "2015-(1[1-2])-[0-3][0-9]|2016-(0[0-9]|1[1-2])-[0-3][0-9]|2017-01-[0-3][0-9]";
        String nombres_A = "A[a-z]|A[A-Z]";
        ArrayList<Registro> franceses = new ArrayList<>();
        ArrayList<Registro> yahoo = new ArrayList<>();
        ArrayList<Registro> ultimo_login = new ArrayList<>();
        Map<String,String> nombres_con_a = new HashMap<>();

        try (BufferedReader bu = new BufferedReader(new FileReader("Fichero/DATA.csv"))) {
            String linea;
            int contador = 0;
            int id = 0;
            String firstName = "";
            String lastName = "";
            double latitude = 0;
            double longitude = 0;
            String domain = "";
            String email = "";
            String country = "";
            String ipAddress = "";
            String lastLogin = "";

            while ((linea = bu.readLine()) != null) {
                String[] lineaseparada = new String[linea.length()];
                if (contador != 0) {
                    lineaseparada = linea.split(",");
                    id = Integer.parseInt(lineaseparada[0]);
                    firstName = lineaseparada[1];
                    lastName = lineaseparada[2];
                    latitude = Double.parseDouble(lineaseparada[3]);
                    longitude = Double.parseDouble(lineaseparada[4]);
                    domain = lineaseparada[5];
                    email = lineaseparada[6];
                    country = lineaseparada[7];
                    ipAddress = lineaseparada[8];
                    lastLogin = lineaseparada[9];
                    Registro registro = new Registro(id, firstName, lastName, latitude, longitude, domain, email, country, ipAddress, lastLogin);

                    if (registro.getCountry().contains("FR")) {
                        franceses.add(registro);
                    }
                    if (buscar(correoyahoo, registro.getEmail())) {
                        yahoo.add(registro);
                    }
                    if (buscar(last_login, registro.getLastLogin())) {
                        ultimo_login.add(registro);
                    }
                    if (buscar(nombres_A, registro.getFirstName())) {
                        nombres_con_a.put(registro.getFirstName(),registro.getLastName());

                    }
                }
                contador=1;
            }
            //Collections.sort(yahoo, Comparator.comparing(Registro::getFirstName));
            //Collections.sort(ultimo_login, Comparator.comparing(Registro::getLastLogin).reversed());
            System.out.println("Franchutes");
            recorrerlistas(franceses);
            System.out.println("Correos");
            recorrerlistas(yahoo);
            System.out.println("Login");
            recorrerlistas(ultimo_login);
            System.out.println("Nombres_a");
            for (String nombre : nombres_con_a.keySet()) {
                String apellido = nombres_con_a.get(nombre);
                System.out.println("Nombre: " + nombre + ", Apellido: " + apellido);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}



