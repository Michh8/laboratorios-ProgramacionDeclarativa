package org.example;

import alice.tuprolog.Prolog;
import alice.tuprolog.SolveInfo;
import alice.tuprolog.Theory;
import java.io.InputStream;
import java.math.BigDecimal;

/** Carga las reglas y consulta tuProlog, igual que en la guia. */
public class Connection {
    private final Prolog engine = new Prolog();

    public Connection() throws Exception {
        try (InputStream in = getClass().getResourceAsStream("/calculo.pl")) {
            if (in == null) throw new IllegalStateException("No se encontro calculo.pl");
            engine.setTheory(new Theory(in));
        }
    }

    public String consultar(String operacion, String primero, String segundo) throws Exception {
        if (!operacion.equals("suma") && !operacion.equals("resta")) {
            throw new IllegalArgumentException("Operacion desconocida");
        }
        String a = numero(primero);
        String b = numero(segundo);
        SolveInfo info = engine.solve(operacion + "(" + a + ", " + b + ", R).");
        if (!info.isSuccess()) throw new IllegalStateException("Prolog no encontro una solucion");
        return new BigDecimal(info.getTerm("R").toString()).stripTrailingZeros().toPlainString();
    }

    private String numero(String entrada) {
        String texto = entrada.trim().replace(',', '.');
        if (!texto.matches("[+-]?(?:[0-9]+(?:\\.[0-9]+)?|\\.[0-9]+)")) {
            throw new IllegalArgumentException("Escribe dos numeros validos, por ejemplo 8, -3 o 2.5");
        }
        BigDecimal valor = new BigDecimal(texto);
        // tuProlog usa enteros de 32 bits y decimales de doble precision.
        if (valor.abs().compareTo(new BigDecimal("1000000000")) > 0 || valor.scale() > 9) {
            throw new IllegalArgumentException("Usa numeros entre -1000000000 y 1000000000, con hasta 9 decimales");
        }
        return valor.stripTrailingZeros().toPlainString();
    }
}
