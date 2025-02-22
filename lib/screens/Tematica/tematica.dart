import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackudc/screens/Dificultad/Dificultad.dart';

class Tematica extends StatelessWidget {
  String _tematica = "";

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
            mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos en la columna
            children: <Widget>[
              // Título más grande y estilizado, ahora centrado horizontalmente
              Text(
                'ELIJA LA TEMATICA',
                style: GoogleFonts.poppins(
                  fontSize: 50.0, // Más grande para que se vea más destacado
                  fontWeight: FontWeight.w900, // Negrita para hacerlo más llamativo
                  color: Colors.white,
                  letterSpacing: 3.0, // Espaciado entre letras para mayor impacto
                ),
                textAlign: TextAlign.center, // Centrado horizontalmente
              ),
              const SizedBox(height: 50), // Espaciado entre el título y las cajas
              // Fila 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildThematicButton(
                    context,
                    "Películas",
                    Colors.purpleAccent,
                        () {
                      _tematica = "Peliculas";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dificultad()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espaciado entre las filas
              // Fila 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildThematicButton(
                    context,
                    "Canciones",
                    Colors.orangeAccent,
                        () {
                      _tematica = "Canciones";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dificultad()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espaciado entre las filas
              // Fila 3
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildThematicButton(
                    context,
                    "Presidentes",
                    Colors.greenAccent,
                        () {
                      _tematica = "Presidentes";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dificultad()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThematicButton(BuildContext context, String label, Color color, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 300.0,
        height: 150.0,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(2, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
