
import 'package:chronos/pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:chronos/components/question_page.dart';


class Reto3 extends StatelessWidget {
  const Reto3({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'RETO 2',
      questions: [
        '¿Qué es la mecánica cuántica?',
        '¿Qué es la paradoja?',
        '¿Qué estudia la física clásica?',
        '¿Quién propuso la teoría de la relatividad?',
      ], // Añade más preguntas aquí
      correctAnswers: [
        'Una teoría física que describe lo microscópico',
        'Un problema lógico sin solución aparente',
        'El movimiento de los cuerpos macroscópicos',
        'Albert Einstein',
      ], // Asegúrate de agregar las respuestas correctas correspondientes
      nextPage:Iniciopage(),
    );
  }
}


