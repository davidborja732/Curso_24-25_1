import java.io.File;

public class Ejercicio_2 {
    /**
     Crea un programa que pida al usuario introducir una ruta del directorio de
     archivos del ordenador. A continuación, el programa debe mostrar cuál es la
     ruta de la subcarpeta que contiene el archivo o el directorio. También debe
     mostrar si la ruta existe realmente en el ordenador y, en caso de existir, debe
     mostrar si se trata de un fichero o un directorio. En el caso de que se trate de
     un directorio el programa mostrará también el contenido de dicho directorio.
     **/
    public static void main(String[] args) {
        String directorio="Archivos_Ejercicios";
        String archivo="Archivos_Ejercicios/archivo1.txt";
        File archivo1=new File(archivo);
        File directorio1=new File(directorio);
        if (archivo1.exists()){
            System.out.println("El archivo existe");
        }else {
            System.out.println("El archivo no existe");
        }
        if (directorio1.exists()){
            System.out.println("El directorio existe");
        }else {
            System.out.println("El directorio no existe");
        }
        if (archivo1.isFile()){
            System.out.println("Es un archivo");
        }else {
            System.out.println("No es un archivo");
        }
        if (directorio1.isDirectory()){
            System.out.println("Es un directorio");
            System.out.println(directorio1.toPath());
        }else {
            System.out.println("No es un directorio");
        }
    }
}
