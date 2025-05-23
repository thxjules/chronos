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
        {
          'question': '¿Cuántas galaxias hay en el universo observable?',
          'options': [
            'Cerca de 100 millones',
            'Unos 500 mil millones',
            'Más de 2 billones',
            'No se puede estimar'
          ],
          'answer': 'Más de 2 billones',
        },
        {
          'question': '¿Qué es la energía oscura?',
          'options': [
            'Es materia oscura comprimida',
            'Una forma de energía que llena el espacio',
            'Una teoría sin pruebas',
            'Luz no visible al ojo humano'
          ],
          'answer': 'Una forma de energía que llena el espacio',
        },
        {
          'question': '¿Está el universo en expansión?',
          'options': [
            'No, se mantiene constante',
            'Sí, pero se desacelera',
            'Sí y esta expansión se acelera',
            'Se contrae lentamente'
          ],
          'answer': 'Sí y esta expansión se acelera',
        },
      ],
      nextPage: const Reto2(),
    );
  }
}
