import 'dart:convert';
import 'package:http/http.dart' as http;

class HuggingFaceService {

  final String apikey = "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"; // Remplazar con tu clave de Hugging Face
  final String apiUrl = "https://api-inference.huggingface.co/models/mistralai/Mixtral-8x7B-Instruct-v0.1";

  HuggingFaceService(); // Constructor

  Future<String> getAIResponse (String userDescription) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer $apiKey',
      },
      body: utf8.encode(jsonEncode({
        "inputs": userDescription,
        "parameters": {
          "max_new_tokens": 150,
          "temperature": 0.36,
          "top_p": 0.4,
        }
      })),
    );


      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        String generatedText = data[0]["generated_text"].toString().trim();

        // Dividimos la respuesta en líneas y eliminamos las vacías
        List<String> lines = generatedText.split("\n").map((line) => line.trim()).where((line) => line.isNotEmpty).toList();

        // Eliminamos la primera línea si hay más de una (debido a que la respuesta de la AI devuelve la pregunta dentro de la respuesta)
        if (lines.isNotEmpty) {
          lines.removeAt(0);
        }

        // Buscamos la primera línea que tenga al menos 4 caracteres (el supuesto título de la película)
        String? selectedLine;
        for (String line in lines) {
          if (line.length >= 4) {
            selectedLine = line;
            break;
          }
        }
        return selectedLine ?? "No valid response"; // Devuelve la primera línea válida o un mensaje por defecto

      } else {
        return "no disponible";
      }


  }

}
