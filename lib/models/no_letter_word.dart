import 'package:hackudc/models/words.dart';

class NoLetterWord extends Words {
  final String letter;

  NoLetterWord({required super.enunciado, required this.letter});

  @override
  bool validate(String entrada) {
    List<String> words = entrada.split(" ");
    if (words.length!=2) {
      return false;
    }

    for (String word in words){
      if ((word.toUpperCase()).contains(letter.toUpperCase())) {
        return false;
      }
    }
    return true;
  }
}