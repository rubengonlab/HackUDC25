import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.

class Game{
  final int numPlayers;
  final String topic;
  final int difficulty;
  final int minutes;

  Game({required this.numPlayers, required this.topic, required this.difficulty, required this.minutes});
}
