import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackudc/models/words.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.


class StartLetterWord extends Words {
  final String letter;

  StartLetterWord({required super.enunciado, required this.letter});

  @override
  bool validate(String entrada){
    List<String> words = entrada.split(" ");
    if (words.length!=3){
      return false;
    }
    for (String word in words){
      if (!(word.toUpperCase()).startsWith(letter.toUpperCase())) {
        return false;
      }
    }
    return true;
  }
}