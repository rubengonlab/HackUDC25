import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Players/players.dart';




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    // Establecer un retraso de 5 segundos antes de navegar a la pantalla de Players
    Future.delayed(Duration(seconds: 5), () {

      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Players()), // Segunda pantalla
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 150),
            const Text(
              'TELEFONO LOCO ',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 100),
            // Imagen dentro del CircleAvatar
            CircleAvatar(
              radius: 150.0,
              backgroundColor: Colors.transparent, // Fondo transparente
              backgroundImage: AssetImage('lib/assets/hola.jpg'), // Ruta de la imagen en assets
            ),
            const SizedBox(height: 100),
            if(_isLoading) const CupertinoActivityIndicator(
              radius: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
