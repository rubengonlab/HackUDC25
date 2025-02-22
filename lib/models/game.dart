import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:io';
import 'movie.dart';

class Game {
  final int numPlayers;
  final int difficulty;
  final int seconds;

  Game({
    required this.numPlayers,
    required this.difficulty,
  }) : seconds = _calculateSeconds(difficulty);


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