@echo off
setlocal
cd /d "%~dp0"
where javac >nul 2>nul
if errorlevel 1 (
  echo Necesitas un JDK 17 o superior en el PATH. Tambien puedes abrir pom.xml en IntelliJ.
  pause
  exit /b 1
)
if not exist "lib\tuprolog-3.3.0.jar" (
  echo Falta lib\tuprolog-3.3.0.jar. Abre pom.xml en IntelliJ para usar Maven.
  pause
  exit /b 1
)
if not exist out mkdir out
dir /s /b src\main\java\*.java > out\fuentes.txt
javac -encoding UTF-8 -cp "lib\*" -d out @out\fuentes.txt
if errorlevel 1 (
  pause
  exit /b 1
)
copy /y src\main\resources\calculo.pl out\calculo.pl >nul
java -cp "out;lib\*" org.example.Main
if errorlevel 1 pause
