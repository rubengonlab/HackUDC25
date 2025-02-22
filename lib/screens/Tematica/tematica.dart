// Nueva pantalla de Tematica
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackudc/screens/Dificultad/Dificultad.dart';
import 'package:hackudc/screens/Players/players.dart';

class Tematica extends StatelessWidget {

  String _tematica = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ELIJA LA TEMATICA  ',
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
                        _tematica = "Peliculas";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> Dificultad() ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Color de fondo
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Tamaño
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                      ),
                      child: const Text(
                        "Películas",
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
                        _tematica= "Canciones";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> Dificultad() ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Color de fondo
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Tamaño
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                      ),
                      child: const Text(
                        "Canciones",
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
                        _tematica = "Presidentes";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> Dificultad() ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Color de fondo
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Tamaño
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                      ),
                      child: const Text(
                        "Presidentes",
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