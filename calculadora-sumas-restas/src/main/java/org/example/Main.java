package org.example;

import org.example.screen.Window;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

public class Main {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            try {
                new Window(new Connection()).setVisible(true);
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al iniciar", JOptionPane.ERROR_MESSAGE);
            }
        });
    }
}
