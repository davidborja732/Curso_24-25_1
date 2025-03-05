import java.io.File;
import java.nio.file.Files;
import java.util.Arrays;

public class listar_archivos {
    public static void main(String[] args) {
        File file=new File("Repaso");
        File[] files= file.listFiles(pathname -> pathname.toString().contains(".csv"));
        for (File file1:files){
            System.out.println(file1.getName());
        }
    }
}
