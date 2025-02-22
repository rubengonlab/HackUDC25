import 'package:flutter/material.dart';
import '../Players/players.dart';
import 'package:google_fonts/google_fonts.dart';


class Resultado extends StatelessWidget {
  final String description;

  const Resultado({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A5ACD), Color(0xFFFF7F50)], // De morado a naranja
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80), // Espaciado superior
            // Título "¡FIN DEL JUEGO!"
            Text(
              "¡FIN DEL JUEGO!",
              style: GoogleFonts.poppins(
                fontSize: 50.0, // Más grande y destacado
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 3.0, // Mayor separación de letras
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Mensaje adicional
            Text(
              "La película correcta era ... ", //LEER DEL FICHERO lib/assets/peliculas/<<peli>>/titulo.txt
              style: GoogleFonts.poppins(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Mostrar la descripción ingresada
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "La película que la IA ha entendido es ...", // LLAMAR AL MÉTODO QUE HACE LA LLAMADA A LA API CON LA DESCRIPCIÓN
                style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            // Botón "Volver a jugar"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF87E7BF), // Verde menta
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                elevation: 5, // Sombra para efecto 3D
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Players()),
                );
              },
              child: Text(
                "Volver a jugar",
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 80), // Espaciado inferior
          ],
        ),
      ),
    );
  }
}

