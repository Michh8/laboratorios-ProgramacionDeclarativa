package org.example.screen;

import org.example.Connection;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

/** Interfaz Swing: captura los numeros y muestra la respuesta de Prolog. */
public class Window extends JFrame {
    private static final Color BG = new Color(0x1E1F29);
    private static final Color CARD = new Color(0x2A2B3A);
    private static final Color TEXT = new Color(0xF2F3F8);
    private static final Color MUTED = new Color(0xABB1CA);
    private final JTextField primero = campo();
    private final JTextField segundo = campo();
    private final JLabel resultado = etiqueta("Ingresa dos numeros para comenzar", 20, TEXT);
    private final JLabel estado = etiqueta("La resta calcula: primer numero - segundo numero", 13, MUTED);

    public Window(Connection motor) {
        super("Sumas y restas con Prolog");
        JPanel raiz = new JPanel();
        raiz.setLayout(new BoxLayout(raiz, BoxLayout.Y_AXIS));
        raiz.setBackground(BG);
        raiz.setBorder(new EmptyBorder(28, 30, 28, 30));
        agregar(raiz, etiqueta("Sumas y restas", 28, TEXT), 6);
        agregar(raiz, etiqueta("Dos numeros · Java + Prolog", 14, MUTED), 28);
        agregar(raiz, etiqueta("Primer numero", 14, MUTED), 8);
        agregar(raiz, primero, 18);
        agregar(raiz, etiqueta("Segundo numero", 14, MUTED), 8);
        agregar(raiz, segundo, 20);
        JPanel botones = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
        botones.setOpaque(false);
        JButton sumar = boton("+  Sumar", new Color(0x6C8CFF));
        JButton restar = boton("-  Restar", new Color(0x3DDC97));
        sumar.addActionListener(e -> ejecutar(motor, "suma"));
        restar.addActionListener(e -> ejecutar(motor, "resta"));
        botones.add(sumar);
        botones.add(Box.createHorizontalStrut(12));
        botones.add(restar);
        agregar(raiz, botones, 24);
        agregar(raiz, etiqueta("Resultado", 14, MUTED), 8);
        JPanel tarjeta = new JPanel(new BorderLayout());
        tarjeta.setBackground(CARD);
        tarjeta.setBorder(new EmptyBorder(18, 16, 18, 16));
        tarjeta.add(resultado);
        agregar(raiz, tarjeta, 16);
        agregar(raiz, estado, 0);
        primero.addActionListener(e -> segundo.requestFocusInWindow());
        segundo.addActionListener(e -> ejecutar(motor, "suma"));
        getRootPane().setDefaultButton(sumar);
        setContentPane(raiz);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(650, 540));
        pack();
        setLocationRelativeTo(null);
    }

    private void ejecutar(Connection motor, String operacion) {
        try {
            String valor = motor.consultar(operacion, primero.getText(), segundo.getText());
            resultado.setText(valor);
            estado.setText("Listo: " + (operacion.equals("suma") ? "suma" : "resta") + " resuelta en Prolog");
            estado.setForeground(new Color(0x3DDC97));
        } catch (Exception ex) {
            resultado.setText("Revisa los datos ingresados");
            estado.setText(ex.getMessage());
            estado.setForeground(new Color(0xFFC857));
        }
    }

    private static JTextField campo() {
        JTextField campo = new JTextField(22);
        campo.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 20));
        campo.setBackground(CARD);
        campo.setForeground(TEXT);
        campo.setCaretColor(TEXT);
        campo.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(new Color(0x3A3C52)), new EmptyBorder(10, 12, 10, 12)));
        campo.setMaximumSize(new Dimension(Integer.MAX_VALUE, 48));
        return campo;
    }

    private static JLabel etiqueta(String texto, int tamano, Color color) {
        JLabel etiqueta = new JLabel(texto);
        etiqueta.setFont(new Font(Font.SANS_SERIF, Font.PLAIN, tamano));
        etiqueta.setForeground(color);
        return etiqueta;
    }

    private static JButton boton(String texto, Color color) {
        JButton boton = new JButton(texto);
        boton.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        boton.setBackground(color);
        boton.setForeground(BG);
        boton.setFocusPainted(false);
        boton.setBorder(new EmptyBorder(12, 24, 12, 24));
        boton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return boton;
    }

    private static void agregar(JPanel panel, JComponent componente, int espacio) {
        componente.setAlignmentX(Component.LEFT_ALIGNMENT);
        panel.add(componente);
        if (espacio > 0) panel.add(Box.createVerticalStrut(espacio));
    }
}
