package Vista.Vistas_Generales;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Interfaz_Inicial {

    /* Constructor vacio de la clase */
    public Interfaz_Inicial() {

    }

    /* Metodo para inicializar la interfaz inicial */
    public void Inicializar_Interfaz_inicial() {
        ImageIcon imagenhockey; /* Variable para almacenar la imagen */

        /* Se obtienen las dimensiones de la pantalla */
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;

        try {
            /* Se carga la imagen desde el archivo */
            BufferedImage bufferedImage = ImageIO.read(new File("Imagen/Liga_Imagen.jpg"));

            /* Se adapta el tamaño de la imagen a una escala determinada */
            Image imagenadaptada = bufferedImage.getScaledInstance(ancho / 4, alto / 2, Image.SCALE_SMOOTH);

            /* Se almacena la imagen adaptada en un ImageIcon */
            imagenhockey = new ImageIcon(imagenadaptada);

        } catch (IOException e) {
            throw new RuntimeException(e); /* Se maneja la excepcion en caso de error al cargar la imagen */
        }

        /* Se crea la ventana principal de la aplicacion */
        JFrame frame;
        frame = new JFrame("Liga De Hockey"); /* Se establece el titulo de la ventana */
        frame.setSize(ancho / 4, alto / 2); /* Se ajusta el tamaño de la ventana */
        frame.setLayout(new BorderLayout()); /* Se define el diseño de la ventana */
        frame.setLocationRelativeTo(null); /* Se centra la ventana en la pantalla */

        /* Se crea una barra de progreso */
        JProgressBar progressBar = new JProgressBar(0, 100);
        progressBar.setVisible(true); /* Se hace visible la barra de progreso */

        /* Se añade la imagen a la ventana en el centro */
        frame.add(new JLabel(imagenhockey), BorderLayout.CENTER);

        /* Se añade la barra de progreso en la parte inferior */
        frame.add(progressBar, BorderLayout.SOUTH);

        /* Se establece la operacion de cierre de la ventana */
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);

        /* Se hace visible la ventana */
        frame.setVisible(true);

        /* Se simula la carga progresiva llenando la barra de progreso */
        for (int i = 0; i <= 100; i++) {
            try {
                Thread.sleep(20); /* Se espera 20ms para simular el progreso */
            } catch (InterruptedException e) {
                throw new RuntimeException(e); /* Se maneja la excepcion en caso de error */
            }
            progressBar.setValue(i); /* Se actualiza el valor de la barra de progreso */
        }

        /* Cuando la barra de progreso alcanza el 100%, se cierra la ventana y se abre la interfaz de login */
        if (progressBar.getValue() == 100) {
            frame.dispose(); /* Se cierra la ventana */
            Interfaz_login interfazLogin = new Interfaz_login(); /* Se crea una instancia de la interfaz de login */
            interfazLogin.Inicializar_Login(); /* Se inicializa la interfaz de login */
        }
    }
}
