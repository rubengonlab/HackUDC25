import 'package:flutter/material.dart';
import 'package:hackudc/models/words.dart';

class NoLetterWord extends Words {
  final String letter;

  NoLetterWord({required super.entrada, required this.letter});

  @override
  bool validate(String entrada){
    List<String> words = entrada.characters.toList();
    for (String word in words){
      if (word.contains(letter)) {
        return false;
      }
    }
    return true;
  }
}