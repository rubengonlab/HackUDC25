import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackudc/models/challenge.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.


class Emoji extends Challenge {

  Emoji({required super.entrada});

  @override
  bool validate(String entrada){
    List<String> emojis = entrada.characters.toList();

    //Se comprueba que son exactamente 3 caracteres y si todos son emojis
    return (emojis.length == 3 && emojis.every(isEmoji));
  }

  bool isEmoji(String char) {
    final int code = char.runes.first;
    return (code >= 0x1F300 && code <= 0x1F5FF) || // Símbolos y pictogramas
        (code >= 0x1F600 && code <= 0x1F64F) || // Emojis de caras
        (code >= 0x1F680 && code <= 0x1F6FF) || // Transporte y mapas
        (code >= 0x1F700 && code <= 0x1F77F) || // Alquimia y otros símbolos
        (code >= 0x1F900 && code <= 0x1F9FF);   // Extensiones de emojis
  }

}