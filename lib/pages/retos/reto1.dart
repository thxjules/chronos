
import 'package:flutter/material.dart';
import 'package:chronos/components/question_page.dart';
import 'reto2.dart';

class Reto1 extends StatelessWidget {
  const Reto1({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'RETO 1',
      questions: [
        'Cuántas galaxias hay en el universo observable',
        '¿Qué es la energía oscura?',
        '¿Está el universo en expansión?',
      ], 
      correctAnswers: [
        'se estima que hay más de 2 billones de galaxias',
        'es una forma de energía que llena el espacio',
        'si y esta expansión se acelera',
      ], 
      nextPage: const Reto2(),
    );
  }
}


