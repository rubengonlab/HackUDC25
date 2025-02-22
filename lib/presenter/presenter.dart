import 'package:hackudc/models/emoji.dart';
import 'package:hackudc/models/movie.dart';
import 'package:hackudc/models/game.dart';
import 'package:hackudc/models/challenge.dart';
import 'package:hackudc/models/no_letter_word.dart';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:hackudc/models/num_words.dart';
import 'package:hackudc/models/start_letter_word.dart';

import '../screens/Partida/fin.dart';

class JuegoPresentador {
  late Game juegoActual;
  late Challenge retoActual;
  List<String> respuestasValidas = [];
  List<Challenge> retos = [];
  int contador=0;
  late Pelicula pelicula_aleatoria;

  JuegoPresentador(); // Constructor vacío

  String iniciarJuego(int numPlayers, int dificultad) {
    contador = 0;
    retoActual = Emoji(enunciado: "pepepe");
    juegoActual = Game(numPlayers: numPlayers, difficulty: dificultad);
    seleccionarPeliculaAleatoria();
    retos = crearRetos();
    pelicula_aleatoria = seleccionarPeliculaAleatoria();
    return pelicula_aleatoria.nombre;
  }


  Pelicula seleccionarPeliculaAleatoria() {
    List<Pelicula> peliculas = crearPeliculas();

    int indiceAleatorio = Random().nextInt(peliculas.length); // Genera un número entre 0 y 2
    return peliculas[indiceAleatorio]; // Suponiendo que Pelicula tiene un atributo "nombre"

  }

  String getArchivo(String nombre) {
    int dificultad = juegoActual.difficulty;
    String basePath = "assets/peliculas/$nombre";
    switch (dificultad) {
      case 0:
        return "$basePath/imagen.jpg";
      case 1:
        return "$basePath/imagen.jpg";
      case 2:
        return "$basePath/imagen.jpg";
      default:
        return "$basePath/imagen.jpg";
    }
  }

  String getReto(BuildContext context) {

    if (contador < juegoActual.numPlayers) {
      Challenge aux;
      do {
        aux = retos[Random().nextInt(retos.length)];
      } while (retoActual == aux);
      retoActual = aux;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Fin(
              preguntaAnterior: retoActual.enunciado,
              respuestaAnterior: retoActual.oldAnswer), // PASAR PREGUNTA Y RESPUEST ANTERIOR
        ),
      );
    }
    return retoActual.enunciado;
  }

  bool validarRespuesta(String respuesta) {
    if (retoActual.validate(respuesta)) {
      print(contador);
      respuestasValidas.add(respuesta);
      contador = contador + 1;
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

  List<Challenge> crearRetos(){

    List <Challenge> retos = [];
    Challenge retoEmoji = new Emoji(enunciado: "Describe la película con 3 emojis");
    retos.add(retoEmoji);

    int numero = Random().nextInt(4) + 2;
    Challenge num_words = new NumWords(enunciado: "Describe la película con $numero palabras", numWords: numero);
    retos.add(num_words);

    List<String> letrasMasComunes = ['A', 'C', 'E', 'P', 'L', 'M', 'D', 'R', 'T', 'S'];
    int indice = Random().nextInt(letrasMasComunes.length);
    String letra = letrasMasComunes[indice];
    Challenge start_letter = new StartLetterWord(enunciado: "Describe la película con 3 palabras que comiencen por '$letra'", letter: letra);
    retos.add(start_letter);

    indice = Random().nextInt(letrasMasComunes.length);
    letra = letrasMasComunes[indice];
    Challenge no_letter = new NoLetterWord(enunciado: "Describe la película con 3 palabras que no puedan contener la letra '$letra'", letter: letra);
    retos.add(no_letter);

    return retos;
  }
}



