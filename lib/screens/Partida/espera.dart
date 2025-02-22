import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackudc/presenter/presenter.dart';
import 'mitad.dart';

class Espera extends StatefulWidget {
  final String? imagePath;
  final String? pregunta;
  final String? respuestaPrev;
  final JuegoPresentador presenter;

  const Espera({
    this.imagePath,
    this.pregunta,
    this.respuestaPrev,
    required this.presenter,
    Key? key,
  }) : super(key: key);

  @override
  _EsperaState createState() => _EsperaState();
}

class _EsperaState extends State<Espera> with SingleTickerProviderStateMixin {
  int _counter = 4; // Contador de 4 segundos
  late Timer _timer;
  double _progress = 1.0; // Valor inicial de progreso
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _startCountdown();

    // Configuración de la animación para escala (pulso)
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duración del pulso
      vsync: this,
    )..repeat(reverse: true); // Repite y hace un pulso hacia atrás también

    // Escala de 1.0 a 1.3, creando el efecto de pulso
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Animación suave
    ));
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
          _progress = _counter / 4; // Calcula el progreso basado en el contador
        });
      } else {
        _timer.cancel();
        _navigateToMitad();
      }
    });
  }

  void _navigateToMitad() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Mitad(
          imagePath: widget.imagePath,
          pregunta: widget.pregunta,
          respuestaPrev: widget.respuestaPrev,
          presenter: widget.presenter,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose(); // Asegúrate de liberar los recursos de la animación
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // Colores para el gradiente
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pasale el movil al siguiente jugador',
                style: GoogleFonts.poppins(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Spinner con animación de pulso
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value, // Cambia el tamaño según la animación
                    child: SizedBox(
                      width: 100,  // Aumenta el tamaño del spinner (ancho)
                      height: 100, // Aumenta el tamaño del spinner (alto)
                      child: CircularProgressIndicator(
                        value: _progress, // Progreso basado en el contador
                        strokeWidth: 20, // Hacemos el spinner más grueso
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
