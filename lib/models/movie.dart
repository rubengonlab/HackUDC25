import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.


class Movie {
  final String _name;
  final String _title;
  final String _image;
  final List<String> _restrictedWords;

  Movie._({
    required String name,
    required String title,
    required String image,
    required List<String> restrictedWords,
  })  : _name = name,
        _title = title,
        _image = image,
        _restrictedWords = restrictedWords;

  static Future<Movie> load(String name) async {
    String title = "assets/movies/$name/title.txt";
    String image = "assets/movies/$name/cover.jpg";
    String wordsTxt =
    await rootBundle.loadString("assets/movies/$name/words.txt");
    List<String> words = wordsTxt.split('\n').map((e) => e.trim()).toList();

    return Movie._(
      name: name,
      title: title,
      image: image,
      restrictedWords: words,
    );
  }

  // Getters
  String get name => _name;
  String get title => _title;
  String get image => _image;
  List<String> get restrictedWords => List.unmodifiable(_restrictedWords);
}



