
import 'package:chronos/pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:chronos/components/question_page.dart';

class Reto3 extends StatelessWidget {
  const Reto3({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'RETO 3',
      questions: [
        {
          'question': '¿Qué es el entrelazamiento cuántico?',
          'options': [
            'Una teoría sobre la expansión del universo',
            'Una conexión instantánea entre partículas a distancia',
            'Una ley de la física clásica',
            'Un tipo de agujero negro',
          ],
          'answer': 'Una conexión instantánea entre partículas a distancia',
        },
        {
          'question': '¿Qué representa el gato en la paradoja de Schrödinger?',
          'options': [
            'Un animal con poderes cuánticos',
            'Un símbolo de la vida real',
            'Una ilustración de superposición cuántica',
            'Una broma científica',
          ],
          'answer': 'Una ilustración de superposición cuántica',
        },
        {
          'question': '¿Qué significa que una partícula esté en superposición?',
          'options': [
            'Que está dividida en dos partes',
            'Que tiene múltiples estados al mismo tiempo',
            'Que se ha destruido',
            'Que no se puede detectar',
          ],
          'answer': 'Que tiene múltiples estados al mismo tiempo',
        },
      ],
      nextPage: const Iniciopage (), 
    );
  }
}
