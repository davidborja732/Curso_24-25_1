import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.LinkedList;
import java.util.Queue;
public class prueba extends JFrame {
    private Queue<String> queue;
    private JTextField txtIn, txtOut, txtPeek;
    private JLabel lblCount;
    private JButton btnEnqueue, btnDequeue;
    public prueba() {
        setTitle("Queue Example");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new GridLayout(5, 2, 5, 5));
// Inicializar cola
        queue = new LinkedList<>();
        add(new JLabel("Enter Text:"));
        txtIn = new JTextField();
        add(txtIn);
        btnEnqueue = new JButton("Enqueue");
        add(btnEnqueue);
        btnDequeue = new JButton("Dequeue");
        add(btnDequeue);
        add(new JLabel("Front of Queue (Peek):"));
        txtPeek = new JTextField();
        txtPeek.setEditable(false);
        add(txtPeek);
        add(new JLabel("Dequeued Element:"));
        txtOut = new JTextField();
        txtOut.setEditable(false);
        add(txtOut);
        add(new JLabel("Queue Count:"));
        lblCount = new JLabel("0");
        add(lblCount);
// Agregar eventos a los botones
        btnEnqueue.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                enqueueElement();
            }
        });
        btnDequeue.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dequeueElement();
            }
        });
        ShowQueueData();
        setVisible(true);
    }
    private void ShowQueueData() {
        lblCount.setText(String.valueOf(queue.size()));
        if (!queue.isEmpty()) {
            txtPeek.setText(queue.peek());
            btnDequeue.setEnabled(true);
        } else {
            txtPeek.setText("");
            btnDequeue.setEnabled(false);
        }
    }
    private void enqueueElement() {
        String s = txtIn.getText().trim();
        if (!s.isEmpty()) {
            queue.offer(s); // Enqueue en Java
            ShowQueueData();
            txtIn.setText("");
        } else {
            JOptionPane.showMessageDialog(this, "Text cannot be empty");
        }
        txtIn.requestFocus();
    }
    private void dequeueElement() {
        if (!queue.isEmpty()) {
            txtOut.setText(queue.poll()); // Dequeue en Java
            ShowQueueData();
        }
    }
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new prueba());
    }
}
