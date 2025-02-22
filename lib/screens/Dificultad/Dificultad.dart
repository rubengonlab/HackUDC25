// Nueva pantalla de Tematica
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackudc/screens/Players/players.dart';

class Dificultad extends StatelessWidget {

  String _dificultad = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'NIVEL DE DIFICULTAD   ',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Caja 1
                Container(
                    width: 300.0,
                    height: 150.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _dificultad = "FACIL";
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Color de fondo
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Tamaño
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                      ),
                      child: const Text(
                        "FACIL 😇",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                ),
                // Caja 2

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Caja 3
                Container(
                    width: 300.0,
                    height: 150.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                        _dificultad= "DIFICIL";
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Color de fondo
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Tamaño
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                      ),
                      child: const Text(
                        "DIFICIL 🔥",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                ),
                // Caja 4

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Caja 3
                Container(
                    width: 300.0,
                    height: 150.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                        _dificultad = "EXTREMO ";
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Color de fondo
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Tamaño
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                      ),
                      child: const Text(
                        "EXTREMO 💣",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    )

                ),
                // Caja 4

              ],
            ),
          ],
        ),
      ),
    );
  }
}