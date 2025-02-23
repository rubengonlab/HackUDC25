import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackudc/screens/Partida/resultado.dart';

class Fin extends StatelessWidget {
  final String preguntaAnterior;
  final String respuestaAnterior;
  final String filmname;

  Fin({
    required this.preguntaAnterior,
    required this.respuestaAnterior,
    required this.filmname,
    Key? key,
  }) : super(key: key);

  final TextEditingController descripcionController = TextEditingController();

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
                colors: [Color(0xFFFF7F50), Color(0xFF6A5ACD)], // Naranja a Morado
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Contenido desplazable cuando el teclado aparece
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120.0), // Espacio extra para que el teclado no tape el contenido
            child: Container(
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
                      controller: descripcionController, // Nombre del controlador que recoge el texto de la descripción
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
                ],
              ),
            ),
          ),
          // El botón "Siguiente" queda fijo en la parte inferior
          Positioned(
            bottom: 20.0, // Ajusta el espacio para el botón
            left: 20.0,
            right: 20.0,
            child: Padding(
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
                    MaterialPageRoute(builder: (context) => Resultado(description: descripcionController.text, filmname: filmname)), // Aquí se coloca la pantalla siguiente
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
          ),
        ],
      ),
    );
  }

}

