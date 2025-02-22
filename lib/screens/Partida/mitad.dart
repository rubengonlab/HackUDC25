import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackudc/presenter/presenter.dart';
import 'espera.dart';

class Mitad extends StatefulWidget {
  final String? imagePath;
  final String? pregunta;
  final String? respuestaPrev;
  final JuegoPresentador presenter;

  const Mitad({
    required this.presenter,
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
  int _counter = 40;
  late Timer _timer;
  late String textoDescripcion;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    textoDescripcion = widget.presenter.getReto(context);
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

    if(!widget.presenter.validarRespuesta(_controller.text)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Error al introducir los datos",
            style: TextStyle(fontSize: 16), // Tamaño del texto
          ),
          backgroundColor: Colors.red, // Fondo rojo para indicar error
          duration: Duration(seconds: 2), // Duración de 2 segundos
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Espera( //Pantalla de carga entre medias de dos preguntas
          imagePath: null,
          pregunta: textoDescripcion,
          respuestaPrev: _controller.text,
          presenter: widget.presenter,
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
      resizeToAvoidBottomInset: false, // No ajusta la pantalla cuando el teclado aparece
      body: Stack(
        children: [
          // Fondo que se mantiene fijo
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Contenido que puede desplazarse cuando el teclado aparece
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120.0), // Espacio extra para que el teclado no tape el contenido
            child: Container(
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
                        const SizedBox(height: 40),
                        Text(
                          "Jugador anterior:",
                          style: GoogleFonts.poppins(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 3.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
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
                ],
              ),
            ),
          ),
          // El botón de "Siguiente" queda fijo en la parte inferior
          Positioned(
            bottom: 20.0, // Ajusta el espacio para el botón
            left: 20.0,
            right: 20.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: _reloadScreen,
                child: const Text(
                  "Siguiente",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
