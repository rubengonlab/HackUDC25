import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../Players/players.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Iniciar animación del spinner
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    // Retraso de 4 segundos antes de cambiar de pantalla
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Players()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // Morado a Azul
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Nombre del juego
              Text(
                'NUTTYPHONE',
                style: GoogleFonts.poppins(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 3.0,
                ),
              ),
              const SizedBox(height: 80),

              // Imagen en círculo con borde colorido
              Container(
                padding: EdgeInsets.all(8.0), // Espaciado del borde
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.yellowAccent, // Borde amarillo vibrante
                    width: 6.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 120.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('lib/assets/hola.jpg'),
                ),
              ),
              const SizedBox(height: 80),

              // Spinner animado profesional
              if (_isLoading)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 6.28, // Rotación 360°
                      child: const Icon(
                        Icons.autorenew,
                        size: 75.0,
                        color: Colors.white,
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
