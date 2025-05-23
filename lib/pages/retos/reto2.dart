import 'package:flutter/material.dart';
import 'package:chronos/components/question_page.dart';
import 'reto3.dart';

class Reto2 extends StatelessWidget {
  const Reto2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'RETO 2',
      questions: [
        {
          'question': '¿¿Qué es la paradoja del gato de ?',
          'options': [
            'una paradoja de coaliciones energéticas',
            'La explicación de la funcionalidad del universo',
            'una paradoja sobre el tiempo cuantico',
            'Es una paradoja de superposición donde se muestran estados'
          ],
          'answer': 'Es una paradoja de superposición donde se muestran estados',
        },
        {
          'question': '¿Quién propuso la teoría de la relatividad?',
          'options': [
            'Isaac Newton',
            'Albert Einstein',
            'Alejandra Pizarnick',
            'Osamu Dazai'
          ],
          'answer': 'Albert Einstein',
        },
        {
          'question': '¿Qué estudia la física clásica?',
          'options': [
            'El tiempo',
            'El movimiento rectilineo',
            'El movimiento de los cuerpos macroscópicos',
            'Ninguna de las anteriores'
          ],
          'answer':'El movimiento de los cuerpos macroscópicos',
        },
      ],
      nextPage: const Reto3(),
    );
  }
}
