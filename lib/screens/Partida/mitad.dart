import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'espera.dart'; // Asegúrate de agregar este paquete en tu pubspec.yaml

class Mitad extends StatefulWidget {
  final String? imagePath;
  final String? pregunta;
  final String? respuestaPrev;

  const Mitad({
    this.imagePath,
    this.pregunta,
    this.respuestaPrev,
    Key? key,
  }) : super(key: key);

  @override
  _MitadState createState() => _MitadState();
}

class _MitadState extends State<Mitad> {
  late TextEditingController _controller;
  int _counter = 30;
  late Timer _timer;
  late String textoDescripcion;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    textoDescripcion = "Nueva preguntaaaaaaaaaaaa";///LLAMAR FUNCIÓN DEL PRESENTADOR
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
        _reloadScreen();
      }
    });
  }

  void _reloadScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Espera( //Pantalla de carga entre medias de dos preguntas
          imagePath: null,
          pregunta: textoDescripcion,
          respuestaPrev: _controller.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            widget.imagePath != null
                ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'lib/${widget.imagePath}',
                fit: BoxFit.contain,
              ),
            )
                : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nuevo encabezado "Jugador anterior:" con estilo de GoogleFonts
                  const SizedBox(height: 40), // Espaciado por encima
                  Text(
                    "Jugador anterior:",
                    style: GoogleFonts.poppins(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Pregunta anterior
                  Text(
                    widget.pregunta ?? "Pregunta no disponible",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  // Respuesta anterior
                  Text(
                    widget.respuestaPrev ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Entrada de texto con título desde el Presenter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textoDescripcion,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Escribe aquí...',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: _reloadScreen,
                child: const Text(
                  "Siguiente",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
