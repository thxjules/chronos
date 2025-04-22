import 'package:flutter/material.dart';
import 'reto_avatar.dart';

class QuestionPage extends StatefulWidget {
  final String title;
  final List<String> questions; // Lista de preguntas para los TextField
  final List<String> correctAnswers; // Respuestas correctas correspondientes
  final Widget
      nextPage; // Widget al que navegar si todas las respuestas son correctas

  const QuestionPage({
    Key? key,
    required this.title,
    required this.questions,
    required this.correctAnswers,
    required this.nextPage,
  })  : assert(questions.length == correctAnswers.length,
            'questions y correctAnswers deben tener la misma longitud'),
        super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late List<String> _answers;

  @override
  void initState() {
    super.initState();
    _answers = List.filled(widget.questions.length, '');
  }

  void _validateAndNavigate() {
    int correctCount = 0; // Contador de respuestas correctas
    for (int i = 0; i < _answers.length; i++) {
      if (_answers[i].trim().toLowerCase() ==
          widget.correctAnswers[i].trim().toLowerCase()) {
        correctCount++;
      }
    }

    if (correctCount == widget.questions.length) {
      // Todas las respuestas son correctas
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => widget.nextPage),
      );
    } else {
      // Algunas respuestas son incorrectas
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Has respondido correctamente a $correctCount de ${widget.questions.length} preguntas.',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Volver a intentar'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Avatar superior con el título
          RetoAvatar(text: widget.title),
           const SizedBox(height: 24),
         
          // Contenido debajo del avatar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 240, 16, 16),
            child: Column(
              children: [
                for (int i = 0; i < widget.questions.length; i++) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.questions[i],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF9FC4FF))),
                    ),
                    onChanged: (v) => _answers[i] = v,
                  ),
                  const SizedBox(height: 34),
                ],
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _validateAndNavigate,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text('VALIDAR',
                          style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text('REGRESAR',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
