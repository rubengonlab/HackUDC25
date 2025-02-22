import 'package:hackudc/models/movie.dart';
import 'package:hackudc/models/game.dart';
import 'package:hackudc/models/challenge.dart';

Game juego_actual = new Game;
Reto reto_actual = new Reto;

list<string> respuestas_validas;



Future<void> iniciarJuego() async {
  
}


// guardar_datos_juego(int N_jugadores, string temática, int dificultad)
// llamar al constructor de Game del modelo para instanciar el juego actual


// extraer nombres carpetas de la ruta /assets/$tematica/ y guardarlos en una lista
// aplicar funcion random para seleccionar un nombre
// instanciar película con sus atributos dado el nombre (el modelo obtiene las rutas relativas recibiendo tematica y nombre)
  //  /assets/$tematica/$nombre

// devolver automáticamete la ruta concreta del archivo en función de la dificultad (return /assets/$tematica/$nombre/imagen.jpg)

// get_reto()

    // if (contador <= n_jugadores){

    //        aux = rand(lista_retos);
    //        while(reto_actual == aux) {
    //            aux = rand(lista_retos);
    //        }
    //        reto_actual = aux;

    //      return(reto_actual);


// validar_respuesta(string respuesta) 
      // if(reto_actual.validar(string respuesta)){
      //      respuestas_validas.add(respuesta);
      //      contador++;
      //      reto_actual.set_Resp_Ant(respuesta);
      //      return (reto_actual);
      //} else {
      //      mostrar_error();
      //}

  // else{
  //    //llamar api IA (no implementar)
  //}





import 'package:hackudc/models/movie.dart';
import 'package:hackudc/models/game.dart';
import 'package:hackudc/models/challenge.dart';
import 'dart:math';
import 'dart:io';

class JuegoPresentador {
  late Game juegoActual;
  late Reto retoActual;
  List<String> respuestasValidas = [];
  int contador = 0;

  Future<void> iniciarJuego(int nJugadores, String tematica, int dificultad) async {
    juegoActual = Game(nJugadores, tematica, dificultad);
    await seleccionarPeliculaAleatoria(tematica);
  }

  Future<void> seleccionarPeliculaAleatoria(String tematica) async {
    final dir = Directory("assets/$tematica/");
    List<FileSystemEntity> archivos = dir.listSync();
    List<String> nombresPeliculas = archivos.map((e) => e.path.split('/').last).toList();
    
    if (nombresPeliculas.isNotEmpty) {
      String nombreSeleccionado = nombresPeliculas[Random().nextInt(nombresPeliculas.length)];
      juegoActual.pelicula = Movie(tematica, nombreSeleccionado);
    }
  }

  String getArchivo(String dificultad) {
    String basePath = "assets/${juegoActual.tematica}/${juegoActual.pelicula.nombre}";
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

  Reto getReto(List<Reto> listaRetos) {
    if (contador < juegoActual.nJugadores) {
      Reto aux;
      do {
        aux = listaRetos[Random().nextInt(listaRetos.length)];
      } while (retoActual == aux);
      retoActual = aux;
    }
    return retoActual;
  }

  bool validarRespuesta(String respuesta) {
    if (retoActual.validar(respuesta)) {
      respuestasValidas.add(respuesta);
      contador++;
      retoActual.setRespAnt(respuesta);
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
