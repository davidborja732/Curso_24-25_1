package Vista.Vistas_Generales;

import Controlador.Ficheros;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.util.ArrayList;

public class Leer_Log {
    private Ficheros ficheros_escritura;

    public Leer_Log() {
        ficheros_escritura = new Ficheros();
    }

    public void mostrarInterfaz() {
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        JFrame frame = new JFrame("Ver Log");
        frame.setSize(ancho / 4, alto / 2);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        frame.setLayout(new BorderLayout());

        JTextArea textArea = new JTextArea();
        textArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(textArea);
        frame.add(scrollPane, BorderLayout.CENTER);

        cargarLog(textArea); // 🔄 Cargar el contenido del log.txt en la interfaz

        frame.setVisible(true);
    }

    private void cargarLog(JTextArea textArea) {
        File archivoLog = new File("Ficheros/log.txt");

        if (!archivoLog.exists()) {
            textArea.setText("El archivo log.txt no existe.");
            return;
        }

        ficheros_escritura.lectura(archivoLog); // Usa la clase `Ficheros` para leer el archivo
        ArrayList<String> lineasLog = ficheros_escritura.getLineas_lectura();

        StringBuilder contenido = new StringBuilder();
        for (String linea : lineasLog) {
            contenido.append(linea).append("\n");
        }

        textArea.setText(contenido.toString()); // 📜 Muestra el contenido en el JTextArea
    }
}

