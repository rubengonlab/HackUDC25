import 'dart:io';
import 'package:hackudc/models/challenge.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.


abstract class Words extends Challenge {

  Words({required super.enunciado});

  @override
  bool validate(String entrada);

}