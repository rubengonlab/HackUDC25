import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackudc/models/words.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.


class NumWords extends Words {
  final int numWords;

  NumWords({required super.entrada, required this.numWords});

  @override
  bool validate(String entrada){
    List<String> words = entrada.characters.toList();
    return words.length == numWords;
  }

}