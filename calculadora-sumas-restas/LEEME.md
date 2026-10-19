# Calculadora de sumas y restas: Java + Prolog

Adaptacion de la seccion Java y Prolog de Guia-5.pdf. La interfaz usa Swing y las operaciones se resuelven con tuProlog 3.3.0, igual que la conexion de la guia. No necesitas instalar SWI-Prolog para esta aplicacion.

## Ver y correr ahora en Windows

Haz doble clic en **ejecutar.bat**. Compila y abre la ventana con el JDK 17 que ya esta instalado en esta computadora. La carpeta lib incluye tuProlog para ejecutar sin Maven.

1. Escribe el primer numero, por ejemplo `8`.
2. Escribe el segundo numero, por ejemplo `3`.
3. Pulsa **Sumar**: aparece `11`.
4. Pulsa **Restar**: aparece `5`.

La resta siempre es primer numero menos segundo numero. Acepta negativos y decimales con punto o coma. Enter en el segundo campo suma. Por ejemplo, `2.5` y `-1.5` dan `1` al sumar y `4` al restar. Los decimales usan la precision de tuProlog y pueden presentar redondeo.

## Abrir en IntelliJ IDEA

1. Selecciona **File > Open** y abre el archivo **pom.xml** de esta carpeta.
2. Si IntelliJ pregunta, selecciona **Open as Project**.
3. Deja que Maven descargue la dependencia tuProlog; la primera importacion necesita internet.
4. En **File > Project Structure > Project**, selecciona un **JDK 17 o superior** como SDK.
5. Abre `src/main/java/org/example/Main.java`.
6. Pulsa el triangulo verde junto a `main` y elige **Run Main.main()**.

Si no se resuelven los imports `alice.tuprolog`, abre el panel Maven y pulsa **Reload All Maven Projects**.

## Archivos y funcionamiento

- `pom.xml`: proyecto Maven y dependencia de tuProlog.
- `Main.java`: inicia la aplicacion.
- `Connection.java`: carga calculo.pl, valida los numeros y consulta Prolog.
- `screen/Window.java`: ventana con dos campos, dos botones y resultado.
- `src/main/resources/calculo.pl`: reglas de suma y resta.

El recorrido es: ventana → Connection → regla Prolog → resultado → ventana.

Con 8 y 3, Java manda `suma(8, 3, R).` o `resta(8, 3, R).`. Prolog devuelve R = 11 o R = 5. El calculo se hace con `is`, no con `=`. La guia tiene nombres distintos en su ejemplo final de Main; aqui Main usa las clases Connection y Window que realmente existen.

Para practicar solo las reglas en SWI-Prolog, abre calculo.pl y consulta:

```prolog
?- suma(8, 3, R).
R = 11.
?- resta(8, 3, R).
R = 5.
```
