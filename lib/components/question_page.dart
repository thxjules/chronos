import 'package:flutter/material.dart';
import 'reto_avatar.dart';

class QuestionPage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> questions; // Cada pregunta incluye texto, opciones y respuesta correcta
  final Widget nextPage; // Página siguiente si todas son correctas

  const QuestionPage({
    Key? key,
    required this.title,
    required this.questions,
    required this.nextPage,
  }) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late List<String?> _selectedAnswers;

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List.filled(widget.questions.length, null);
  }

  void _validateAndNavigate() {
    int correctCount = 0;
    for (int i = 0; i < _selectedAnswers.length; i++) {
      if (_selectedAnswers[i]?.trim().toLowerCase() ==
          widget.questions[i]['answer'].trim().toLowerCase()) {
        correctCount++;
      }
    }

    if (correctCount == widget.questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => widget.nextPage),
      );
    } else {
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
          RetoAvatar(text: widget.title),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 240, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < widget.questions.length; i++) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.questions[i]['question'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    for (String option in widget.questions[i]['options'])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectedAnswers[i] == option
                                    ? const Color(0xFF9FC4FF)
                                    : Colors.grey[800],
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedAnswers[i] = option;
                            });
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(option),
                          ),
                        ),
                      ),
                    const SizedBox(height: 30),
                  ],
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
          ),
        ],
      ),
    );
  }
}
