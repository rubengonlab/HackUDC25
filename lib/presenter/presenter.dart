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





