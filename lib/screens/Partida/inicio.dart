import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MediaPlayer extends StatefulWidget {
  @override
  _MediaPlayerState createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  String? filePath;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadArchive();
  }

  Future<void> _loadArchive() async {
    String path = "tita.mp3"; // Ajusta el nombre y la ruta del archivo
    setState(() {
      filePath = path;
    });

    if (_isAudio(path)) {
      _playAudio(path);
    }
  }

  void _playAudio(String path) async {
    try {
      await _audioPlayer.play(DeviceFileSource('assets/peliculas/titanic/$path')); // Asegúrate de que la ruta del archivo sea correcta
      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      print("Error reproduciendo el audio: $e");
    }
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  bool _isAudio(String path) {
    return path.endsWith('.mp3') || path.endsWith('.wav') || path.endsWith('.aac');
  }

  bool _isImage(String path) {
    return path.endsWith('.png') || path.endsWith('.jpg') || path.endsWith('.jpeg');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
              ? Image.asset('assets/peliculas/$filePath') // Verifica que la ruta sea correcta
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Reproduciendo audio...",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  if (_isPlaying) {
                    _stopAudio();
                  } else {
                    _playAudio(filePath!);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
