import 'dart:io';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.


abstract class Challenge {

  final String enunciado;
  late final String oldAnswer;

  Challenge({required this.enunciado});

  bool validate(String entrada);

}