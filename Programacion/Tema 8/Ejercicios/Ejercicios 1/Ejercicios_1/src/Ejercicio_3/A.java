package Ejercicio_3;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class A {
    public static void main(String[] args) {
        try {
                FileInputStream filein = new FileInputStream("Archivos_Ejercicios/Programacion.txt");
                FileOutputStream fileout = new FileOutputStream("Archivos_Ejercicios/Programacion1.txt");
                FileOutputStream fileout2 = new FileOutputStream("Archivos_Ejercicios/Programacion2.txt");
                int linea;
                while ((linea = filein.read()) != -1) {
                    fileout.write(linea);
                    fileout2.write(linea);
                }

            } catch (FileNotFoundException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

