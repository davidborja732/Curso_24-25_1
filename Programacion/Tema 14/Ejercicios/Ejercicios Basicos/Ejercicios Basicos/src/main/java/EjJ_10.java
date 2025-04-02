import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class EjJ_10 {
    static String url = "jdbc:mysql://localhost:3306/ej14";
    static String usuario = "root";
    static String Contraseña = "1234";

    public static void main(String[] args) {
        JFrame frame = new JFrame("Menu opciones");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.setLayout(new GridLayout(2, 2));
        JButton Añadir = new JButton("Añadir");
        JButton Borrar = new JButton("Eliminar");
        JButton Editar = new JButton("Editar");
        JButton Listar = new JButton("Listar");
        frame.add(Añadir);
        frame.add(Borrar);
        frame.add(Editar);
        frame.add(Listar);
        Añadir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            }
        });
        Borrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            }
        });
        Editar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            }
        });
        Listar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            }
        });
        frame.setVisible(true);
    }
}