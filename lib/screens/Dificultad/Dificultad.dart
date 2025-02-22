import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Preparados/preparados.dart';


class Dificultad extends StatelessWidget {
  String _dificultad = "";
  final int _counter;
  final String _tematica;

  Dificultad(this._counter, this._tematica, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6A11CB), // Fondo similar al de la pantalla de Temática
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navegar hacia atrás
          },
        ),
        title: Text(
          'Dificultad', // Título del AppBar
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'NIVEL DE DIFICULTAD',
                style: GoogleFonts.poppins(
                  fontSize: 50.0, // Más grande para que se vea más destacado
                  fontWeight: FontWeight.w900, // Negrita para hacerlo más llamativo
                  color: Colors.white,
                  letterSpacing: 3.0, // Espaciado entre letras para mayor impacto
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Caja 1
                  _buildDifficultyButton(context, "FACIL 😇", Colors.greenAccent, "FACIL"),
                ],
              ),
              const SizedBox(height: 20), // Espaciado entre las filas
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Caja 2
                  _buildDifficultyButton(context, "DIFICIL 🔥", Colors.orangeAccent, "DIFICIL"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Caja 3
                  _buildDifficultyButton(context, "EXTREMO 💣", Colors.redAccent, "EXTREMO"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para crear los botones de dificultad
  Widget _buildDifficultyButton(BuildContext context, String label, Color color, String difficulty) {
    return GestureDetector(
      onTap: () {
        _dificultad = difficulty;
        // Navegar a la pantalla de "Preparados"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Preparados()), // Cambiar a la pantalla Preparados
          // MANDAR VALORES AL PRESENTADOR !!!!!!!!!!!!!!!!
        );
      },
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
            style: const TextStyle(
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