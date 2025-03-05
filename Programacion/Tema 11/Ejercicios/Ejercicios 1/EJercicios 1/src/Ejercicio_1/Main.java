package Ejercicio_1;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.chrono.ChronoLocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class Main {



    public static void main(String[] args) {
        ArrayList<Registro> registros = new ArrayList<>();

        try (BufferedReader bu = new BufferedReader(new FileReader("Fichero/DATA.csv"))) {
            String linea;
            int contador = 0;
            int id;
            String firstName;
            String lastName;
            double latitude;
            double longitude;
            String domain;
            String email;
            String country;
            String ipAddress;
            LocalDateTime lastLogin;

            while ((linea = bu.readLine()) != null) {
                String[] lineaseparada;
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
                    lastLogin = LocalDateTime.parse(lineaseparada[9], DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                    Registro registro = new Registro(id, firstName, lastName, latitude, longitude, domain, email, country, ipAddress, lastLogin);
                    registros.add(registro);
                }
                contador=1;
            }
            System.out.println("Francia");
            registros.stream().filter(registro -> registro.getCountry().equals("FR")).forEach(System.out::println);
            System.out.println("Yahoo");
            registros.stream().filter(registro -> registro.getEmail().contains("yahoo")).sorted(Comparator.comparing(Registro::getFirstName)).forEach(System.out::println);
            System.out.println("Ultimo Login");
            registros.stream().filter((r->r.getLastLogin().isAfter(LocalDateTime.parse("2015-10-31T23:59:59")) && r.getLastLogin().isBefore(LocalDateTime.parse("2017-02-01T23:59:59")))).sorted(Comparator.comparing(Registro::getLastLogin).reversed()).forEach(System.out::println);
            System.out.println("Nombres con A");
            registros.stream().filter(registro -> registro.getFirstName().startsWith("A")).sorted(Comparator.comparing(Registro::getLastLogin).reversed()).forEach(r -> System.out.println(r.getFirstName() + " " + r.getLastName()));

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}



