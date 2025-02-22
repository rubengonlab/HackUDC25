import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackudc/screens/Dificultad/Dificultad.dart';

class Tematica extends StatelessWidget {
  String _tematica = "";
  final int _counter;

  Tematica(this._counter, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B2D84), // Morado oscuro que combina con el gradiente de fondo
        elevation: 5, // Sombra sutil para dar profundidad
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Icono de flecha atrás en blanco
          onPressed: () {
            Navigator.pop(context); // Vuelve a la pantalla anterior
          },
        ),
        title: Text(
          'Temática', // Título del AppBar
          style: GoogleFonts.poppins(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Texto blanco para buena visibilidad
          ),
        ),
      ),
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
                'ELIGE TEMÁTICA',
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
                  Expanded(
                    child: _buildThematicButton(
                      context,
                      "Películas",
                      Colors.purpleAccent,
                          () {
                        _tematica = "peliculas";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dificultad(_counter)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10), // Espacio entre los botones
                  Expanded(
                    child: _buildThematicButton(
                      context,
                      "Canciones",
                      Colors.orangeAccent,
                          () {
                        _tematica = "canciones";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dificultad(_counter)),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espaciado entre las filas
              // Fila 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _buildThematicButton(
                      context,
                      "Presidentes",
                      Colors.greenAccent,
                          () {
                        _tematica = "presidentes";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dificultad(_counter)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10), // Espacio entre los botones
                  Expanded(
                    child: _buildThematicButton(
                      context,
                      "Deportes", // Nueva temática añadida
                      Colors.yellow,
                          () {
                        _tematica = "deportes";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dificultad(_counter)),
                        );
                      },
                    ),
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
        margin: const EdgeInsets.symmetric(horizontal: 10.0), // Ajuste de margen
        height: 120.0, // Ajuste de la altura
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
              fontSize: 20.0, // Ajuste el tamaño de la fuente
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}