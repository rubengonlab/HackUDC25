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
  late Pelicula pelicula_aleatoria;

  JuegoPresentador();


  String iniciarJuego(int numPlayers, int dificultad) {
    juegoActual = Game(numPlayers: numPlayers, difficulty: dificultad);
    seleccionarPeliculaAleatoria();
    pelicula_aleatoria = seleccionarPeliculaAleatoria();
    return pelicula_aleatoria.nombre;
  }


  Pelicula seleccionarPeliculaAleatoria() {
    List<Pelicula> peliculas = crearPeliculas();

    int indiceAleatorio = Random().nextInt(peliculas.length); // Genera un número entre 0 y 2
    return peliculas[indiceAleatorio]; // Suponiendo que Pelicula tiene un atributo "nombre"

  }

  String getArchivo(String nombre ) {
    int dificultad = juegoActual.difficulty;
    String basePath = "assets/peliculas/$nombre";
    switch (dificultad) {
      case 0:
        return "$basePath/imagen.jpg";
      case 1:
        return "$basePath/titulo.txt";
      case 2:
        return "$basePath/audio.mp3";
      default:
        return "$basePath/imagen.jpg";
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

  List<Pelicula> crearPeliculas(){
    List<String> mylista=["titanic","seven", "cars"];
    List<Pelicula> peliculas =[] ;
    for (String pelicula in mylista){
      peliculas.add(Pelicula(nombre: pelicula));
    }
    return peliculas;
  }
}



