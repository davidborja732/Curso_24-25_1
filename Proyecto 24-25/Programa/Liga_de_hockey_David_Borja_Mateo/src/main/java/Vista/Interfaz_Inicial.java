package Vista;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Interfaz_Inicial {
    public Interfaz_Inicial() {

    }

    public void Inicializar_Interfaz_inicial() {
        ImageIcon imagenhockey;
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        try {
            BufferedImage bufferedImage = ImageIO.read(new File("Imagen/Liga_Imagen.jpg"));
            Image imagenadaptada = bufferedImage.getScaledInstance(ancho / 4, alto / 2, Image.SCALE_SMOOTH);
            imagenhockey = new ImageIcon(imagenadaptada);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        JFrame frame;
        frame = new JFrame("Liga De Hockey");
        frame.setSize(ancho / 4, alto / 2);
        frame.setLayout(new BorderLayout());
        frame.setLocationRelativeTo(null);
        JProgressBar progressBar = new JProgressBar(0, 100);
        progressBar.setVisible(true);
        frame.add(new JLabel(imagenhockey), BorderLayout.CENTER);
        frame.add(progressBar, BorderLayout.SOUTH);
        frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        frame.setVisible(true);
        for (int i = 0; i <= 100; i++) {
            try {
                Thread.sleep(20);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            progressBar.setValue(i);
        }
        if (progressBar.getValue() == 100) {
            frame.dispose();
            Interfaz_login interfazLogin = new Interfaz_login();
            interfazLogin.Inicializar_Login();
        }
    }
}
