import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fin extends StatelessWidget {
  final String preguntaAnterior;
  final String respuestaAnterior;

  const Fin({
    required this.preguntaAnterior,
    required this.respuestaAnterior,
    Key? key,
  }) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            // Título "Jugador anterior:"
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
            // Mostrar la pregunta anterior
            Text(
              preguntaAnterior,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Mostrar la respuesta anterior
            Text(
              respuestaAnterior,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60), // Aumentado el espacio aquí
            // Texto para describir la película
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Describa la película",
                style: GoogleFonts.poppins(
                  fontSize: 24.0, // Fuente más pequeña
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            // Campo de texto para la descripción (con nuevos colores)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Escribe aquí...',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white60), // Borde más suave
                    borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0), // Borde azul cuando está enfocado
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Fondo más suave
                  contentPadding: const EdgeInsets.all(15), // Padding dentro del TextField
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Botón Siguiente mejorado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF87E7BF), // Verde menta suave
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0), // Más fino
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Más redondeado
                  ),
                ),
                onPressed: () {
                  // Navegar a la siguiente pantalla
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextScreen()), // Aquí se coloca la pantalla siguiente
                  );
                },
                child: const Text(
                  'Siguiente',
                  style: TextStyle(
                    fontSize: 16.0, // Un poco más pequeño
                    fontWeight: FontWeight.w600, // Menos grueso
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Nueva pantalla "NextScreen"
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Pantalla'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('¡Bienvenido a la siguiente pantalla!',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
