import 'package:hackudc/models/movie.dart';
import 'package:hackudc/models/game.dart';
import 'package:hackudc/models/challenge.dart';
import 'dart:math';
import 'dart:io';

class JuegoPresentador {
  late Game juegoActual;
  late Challenge retoActual;
  List<String> respuestasValidas = [];
  int contador = 0;

  Future<void> iniciarJuego(int numPlayers, String tematica, int dificultad) async {
    juegoActual = new Game(numPlayers: numPlayers, topic: tematica, difficulty: dificultad);
    await seleccionarPeliculaAleatoria(tematica);
  }

  Future<void> seleccionarPeliculaAleatoria(String tematica) async {
    final dir = Directory("assets/$tematica/");
    List<FileSystemEntity> archivos = dir.listSync();
    List<String> nombresPeliculas = archivos.map((e) => e.path.split('/').last).toList();

    if (nombresPeliculas.isNotEmpty) {
      String nombreSeleccionado = nombresPeliculas[Random().nextInt(nombresPeliculas.length)];
      juegoActual.movie = new Pelicula(tematica: tematica, nombre: nombreSeleccionado);
    }
  }

  String getArchivo(String dificultad) {
    String basePath = "assets/${juegoActual.topic}/${juegoActual.movie.nombre}";
    switch (dificultad) {
      case "facil":
        return "$basePath/imagen.jpg";
      case "dificil":
        return "$basePath/titulo.txt";
      case "extremo":
        return "$basePath/audio.mp3";
      default:
        return "";
    }
  }

  Challenge getReto(List<Challenge> listaRetos) {
    if (contador < juegoActual.numPlayers) {
      Challenge aux;
      do {
        aux = listaRetos[Random().nextInt(listaRetos.length)];
      } while (retoActual == aux);
      retoActual = aux;
    }
    return retoActual;
  }

  bool validarRespuesta(String respuesta) {
    if (retoActual.validate(respuesta)) {
      respuestasValidas.add(respuesta);
      contador++;
      retoActual.oldAnswer = respuesta;
      return true;
    } else {
      mostrarError();
      return false;
    }
  }

  void mostrarError() {
    print("Respuesta incorrecta. Inténtalo de nuevo.");
  }
}
