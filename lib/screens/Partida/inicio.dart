import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackudc/presenter/presenter.dart';
import 'mitad.dart';

class Inicio extends StatefulWidget {
  final String mensage;
  final JuegoPresentador presenter;

  const Inicio(this.mensage, this.presenter, {super.key});

  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> with SingleTickerProviderStateMixin {
  String? filePath;
  int _counter = 5; // Contador de 5 segundos
  Timer? _timer;
  double _progress = 1.0; // Progreso inicial del spinner
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;



  @override
  void initState() {
    super.initState();
    _loadArchive();
    _startTimer();

    // Animación de pulso para el spinner
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  // Cargar la imagen
  Future<void> _loadArchive() async {
    setState(() {
      filePath = widget.mensage;
    });
  }

  // Iniciar el temporizador
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 1) {
        setState(() {
          _counter--;
          _progress = _counter / 5;
        });
      } else {
        _timer?.cancel();
        _navigateToNextScreen();
      }
    });
  }

  // Navegar a la siguiente pantalla
  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Mitad(
          imagePath: filePath!,
          pregunta: "",
          respuestaPrev: "",
          presenter: widget.presenter
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00BFFF), Color(0xFFFF1493)], // Azul profundo a rosa fuerte
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Texto de "¡ATENCIÓN!" encima de la imagen
              Text(
                "¡ATENCIÓN!",
                style: GoogleFonts.poppins(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20), // Espacio entre el texto y la imagen
              // Imagen más grande
              filePath == null
                  ? Container()
                  : Image.asset(
                'lib/$filePath',
                width: 350, // Imagen más grande
                height: 350,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40), // Más separación entre imagen y spinner
              // Spinner animado debajo de la imagen
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 10,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        backgroundColor: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
