import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
  String? filePath;

  @override
  void initState() {
    super.initState();
    _loadArchive();
  }

  Future<void> _loadArchive() async {
    String path = "titanic/imagen.jpg"; // Ajusta el nombre y la ruta del archivo
    setState(() {
      filePath = path;
    });

  }

  bool _isImage(String path) {
    return path.endsWith('.png') || path.endsWith('.jpg') || path.endsWith('.jpeg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: filePath == null
              ? const CircularProgressIndicator()
              : _isImage(filePath!)
              ? Image.asset('lib/assets/peliculas/$filePath') // Verifica que la ruta sea correcta
              : const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("No se pudo cargar la imagen")],
          ),
        ),
      ),
    );
  }
}
