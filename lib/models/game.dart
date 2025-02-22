import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.

class Game {
  final int numPlayers;
  final String topic;
  final int difficulty;
  final int seconds;

  Game({
    required this.numPlayers,
    required this.topic,
    required this.difficulty,
  }) : seconds = _calculateSeconds(difficulty);

  // Método privado para calcular los segundos según la dificultad
  static int _calculateSeconds(int difficulty) {
    switch (difficulty) {
      case 0:
        return 60;
      case 1:
        return 30;
      case 2:
        return 15;
      default:
        throw ArgumentError("Invalid difficulty level: $difficulty");
    }
  }
}
