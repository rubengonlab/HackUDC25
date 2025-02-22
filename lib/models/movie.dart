import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var serverUrl = Platform.isAndroid ? "10.0.2.2" : "127.0.0.1";
// es la dirección IP que permite al emulador de Android acceder al localhost del ordenador que está ejecutando el emulador.


class Pelicula {
  final String nombre;
  late final String titulo;
  late final String imagen;
  late final List<String> palabrasRestringidas;

  // Constructor
  Pelicula({tematica, required this.nombre}) {
    _loadData(tematica);
  }

  // Método privado para cargar los datos automáticamente
  Future<void> _loadData(tematica) async {
    titulo = "assets/$tematica/$nombre/titulo.txt";
    imagen = "assets/$tematica/$nombre/portada.jpg";
    String palabrasTxt = await rootBundle.loadString("assets/peliculas/$nombre/palabras.txt");
    palabrasRestringidas = palabrasTxt.split('\n').map((e) => e.trim()).toList();
  }
}



