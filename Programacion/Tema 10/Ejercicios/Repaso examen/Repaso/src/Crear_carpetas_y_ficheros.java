import java.io.*;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Crear_carpetas_y_ficheros {
    public static void main(String[] args) {
        File file = new File("Repaso/archivos/carpetanueva");
        File file2 = new File("Repaso/archivos/archivo1.txt");
        File file3 = new File("Repaso/archivos/archivo3.txt");
        File file4 = new File("Repaso/archivos/archivo4.txt");
        File file5 = new File("Repaso/archivos/carpetanueva/prueba");
        String texto =
                "Para añadir texto a  archivo existente en Java, se puede utilizar la clase BufferedWriter \n" +
                        "junto con el constructor de FileWriter que acepta un parámetro true para habilitar el \n" +
                        "modo de añadir. Esto garantiza que el contenido se agregue al final del archivo sin \n" +
                        "sobrescribir el texto existente." +
                        "A continuación, te presento un ejemplo donde solicitamos al Usuario que ingrese frases \n" +
                        "que se agregarán a un archivo existente: ";
        try {
            if (!file.exists()){
                Files.createDirectory(file.toPath());
            }
            Files.createDirectories(file.toPath());
            if (!file2.exists()) {
                Files.createFile(file2.toPath());
            }
            if (!file5.exists()){
                Files.createDirectories(file5.toPath());
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file2))) {
            bufferedWriter.write(texto);
            bufferedWriter.newLine();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        String regex = "\\b[Uu]{1}[a-z]+";
        Pattern pattern = Pattern.compile(regex);
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(file2)); BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file3))) {
            String linea="";
            while ((linea=bufferedReader.readLine())!=null){
                Matcher matcher= pattern.matcher(linea);
                while (matcher.find()){
                    bufferedWriter.write(matcher.group().replaceAll("[u]","U"));
                    bufferedWriter.newLine();
                }
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        try {
            Files.move(file4.toPath(),file5.toPath(),StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
