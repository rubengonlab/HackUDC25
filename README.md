
<div style="text-align: center;">
  <h2>NUTTYPHONE</h2>
</div>

<div style="text-align: center;">
  <p align="center">
  <img src="/lib/assets/hola.jpg" alt="Descripción de la imagen" width="400" height="400"/>
</p>

</div>


## 📌 Descripción

**Guess the Movie** es un juego interactivo y colaborativo desarrollado con el lenguaje de programación **Flutter** con **Dart** en **Android Studio**. El objetivo del juego es que un equipo logre que la inteligencia artificial (IA) adivine correctamente una película basándose en descripciones dadas por los jugadores. Sin embargo, hay un giro: los jugadores deben superar diferentes pruebas que dificultan la correcta transmisión de la información, generando confusión y desafiando su creatividad.

## 🎯 Objetivo del Juego

Los jugadores describen una película en turnos, pero cada uno debe enfrentarse a obstáculos que pueden distorsionar la información. La IA, con base en el mensaje final, intentará adivinar la película. El reto es vencer en equipo y superar las dificultades para que la IA haga la elección correcta.

## 🚀 Tecnologías Utilizadas

- **Flutter**: Framework para desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Android Studio**: Entorno de desarrollo
- **Firebase**: Para almacenamiento y sincronización en tiempo real (opcional)
- **TensorFlow Lite**: Para la IA de reconocimiento de películas (opcional)

## 🕹️ Mecánica del Juego

1. **Inicio de la partida**: Un jugador recibe el nombre de una película y debe describirla.
2. **Retos y trampas**: A medida que el turno avanza, los jugadores enfrentan desafíos como:
   - Sinónimos prohibidos
   - Frases limitadas
   - Imitar acentos
   - Explicar solo con emojis
3. **Último jugador**: Intenta describir la película con la información recibida.
4. **La IA adivina**: Basándose en la última descripción, la IA intenta identificar la película correcta.
5. **Victoria o derrota**: Se gana si la IA elige la película correcta.

## 📲 Instalación y Ejecución

### Prerequisitos

- Tener instalado Flutter y Dart
- Android Studio configurado
- Dispositivo/emulador Android

### Pasos para ejecutar el juego

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/tuusuario/guess-the-movie.git
   cd guess-the-movie
