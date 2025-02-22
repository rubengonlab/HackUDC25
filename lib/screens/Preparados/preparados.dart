import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Preparados extends StatefulWidget {
  @override
  _PreparadosState createState() => _PreparadosState();
}

class _PreparadosState extends State<Preparados> {
  bool _showCountdown = false;  // Variable para controlar la visibilidad del contador
  int _counter = 3;

  @override
  void initState() {
    super.initState();
    _startCountdownSequence();
  }

  // Método para iniciar la secuencia de la pantalla
  void _startCountdownSequence() {
    // Mostrar el contador después de un retraso
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showCountdown = true;  // Hacer visible el contador
      });
      _startCountdown();  // Iniciar el contador
    });
  }

  // Método para manejar el conteo regresivo
  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_counter > 1) {
        setState(() {
          _counter--;
        });
        _startCountdown();  // Llamar recursivamente para continuar el contador
      } else {
        // Cuando llegue a 1, navega a la siguiente pantalla
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NextScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo con gradiente de colores personalizados
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
              // Primero se muestra "Preparados"
              Text(
                'Preparados',
                style: GoogleFonts.poppins(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,  // Estilo oblicuo
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50), // Espaciado entre "Preparados" y el contador

              // Si se debe mostrar el contador, lo mostramos
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

// Aquí puedes reemplazar `NextScreen` por el nombre de la pantalla a la que quieras navegar.
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('¡Bienvenido a la siguiente pantalla!'),
      ),
    );
  }
}
