import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Tematica/tematica.dart';


class Players extends StatefulWidget {
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  int _counter = 3;

  void _decrementCounter() {
    setState(() {
      if(_counter >3){
        _counter--;
      }

    });
  }

  void _incrementCounter() {
    setState(() {
      if(_counter<10){
        _counter++;
      }

    });
  }

  void _onReadyPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> Tematica()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'NUMERO DE JUGADORES ',
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
                // Botón para restar
                GestureDetector(
                  onTap: _decrementCounter,
                  child: Container(
                    width: 75.0,
                    height:75.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Restar',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // Contador en el medio
                Container(
                  width: 75.0,
                  height: 75.0,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      '$_counter', // Muestra el valor del contador
                      style: TextStyle(
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Sumar',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            // Botón "Listo"
            ElevatedButton(
              onPressed: _onReadyPressed, // Acción al presionar el botón
              child: const Text(
                'Listo',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Color del fondo del botón
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30), // Tamaño del botón
                minimumSize: Size(150, 70), // Tamaño mínimo del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Redondea las esquinas
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}