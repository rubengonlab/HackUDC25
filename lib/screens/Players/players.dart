import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Tematica/tematica.dart';

class Players extends StatefulWidget {
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  int _counter = 3;

  void _decrementCounter() {
    setState(() {
      if (_counter > 3) {
        _counter--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < 10) {
        _counter++;
      }
    });
  }

  void _onReadyPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tematica()),
    );
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
              // Título "Numero de Jugadores"
              Text(
                'NUMERO DE JUGADORES',
                style: GoogleFonts.poppins(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 3.0,
                ),
                textAlign: TextAlign.center, // Centrado horizontalmente
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Botón para restar
                  GestureDetector(
                    onTap: _decrementCounter,
                    child: Container(
                      width: 75.0,
                      height: 75.0,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(25.0), // Bordes más redondeados
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(2, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Contador en el medio con diseño más atractivo
                  Container(
                    width: 80.0,
                    height: 80.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(2, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$_counter',
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Botón para sumar
                  GestureDetector(
                    onTap: _incrementCounter,
                    child: Container(
                      width: 75.0,
                      height: 75.0,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(25.0), // Bordes más redondeados
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(2, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Botón "Listo" con un diseño más profesional
              ElevatedButton(
                onPressed: _onReadyPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Color del texto
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30), // Tamaño del botón
                  minimumSize: const Size(150, 70), // Tamaño mínimo del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Bordes más redondeados
                  ),
                  elevation: 5, // Sombra para dar profundidad
                  side: const BorderSide(
                    color: Colors.white, // Añadir un borde blanco sutil
                    width: 2,
                  ),
                ), // Acción al presionar el botón
                child: const Text(
                  'Listo',
                  style: TextStyle(
                    fontSize: 22.0, // Tamaño de la fuente un poco más grande
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
