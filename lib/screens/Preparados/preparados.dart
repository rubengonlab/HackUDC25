import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackudc/screens/Partida/inicio.dart';
import 'package:hackudc/screens/Tematica/tematica.dart'; // Asegúrate de que la ruta es correcta

class Preparados extends StatefulWidget {
  @override
  _PreparadosState createState() => _PreparadosState();
}

class _PreparadosState extends State<Preparados> {
  bool _showCountdown = false;
  int _counter = 3;

  @override
  void initState() {
    super.initState();
    _startCountdownSequence();
  }

  void _startCountdownSequence() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showCountdown = true;
      });
      _startCountdown();
    });
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      print('Countdown: $_counter'); // Log para verificar el valor del contador
      if (_counter > 1) {
        setState(() {
          _counter--;
        });
        _startCountdown();
      } else {
        print('Countdown reached 1'); // Log para verificar que el contador llegó a 1
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Inicio()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF7F50), Color(0xFF6A5ACD)], // Naranja a Morado
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Preparados',
                style: GoogleFonts.poppins(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              if (_showCountdown)
                Text(
                  '$_counter',
                  style: GoogleFonts.poppins(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
