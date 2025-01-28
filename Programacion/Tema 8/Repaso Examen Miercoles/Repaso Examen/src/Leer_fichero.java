import java.io.*;

public class Leer_fichero {
    public static void main(String[] args) throws IOException {
        File archivo=new File("Ficheros prueba/prueba.txt");
        try (FileInputStream fileInputStream=new FileInputStream(archivo)) {
            int datos;
            while ((datos=fileInputStream.read())!=-1){
                System.out.println((char) datos);
            }
        }
    }
}
