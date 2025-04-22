
import 'package:flutter/material.dart';
import 'package:chronos/components/question_page.dart';
import 'reto3.dart';

class Reto2 extends StatelessWidget {
  const Reto2({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'RETO 2',
      questions: [
        '¿Qué es la mecánica cuántica?',
        '¿Qué es la paradoja?',
        '¿Qué estudia la física clásica?',
        '¿Quién propuso la teoría de la relatividad?',
      ], 
      correctAnswers: [
        'Una teoría física que describe lo microscópico',
        'Un problema lógico sin solución aparente',
        'El movimiento de los cuerpos macroscópicos',
        'Albert Einstein',
      ], 
      nextPage: const Reto3(),
    );
  }
}


