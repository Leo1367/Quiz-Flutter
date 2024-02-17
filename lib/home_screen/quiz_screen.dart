import 'package:flutter/material.dart';
import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/home_screen/home_screen.dart';

QuizController quizController = QuizController();

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Resultado'),
            content: Text('você fez ${quizController.getScore()} pontos'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    quizController.reset();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  Widget _button(Color color, String valor, bool resultado) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            if (quizController.getIcons().length < 15) {
              quizController.checkAnswer(resultado);
            }
            if (quizController.getIcons().length >= 15) {
              _showConfirmationDialog(context);
            }
            quizController.nextQuestion();
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(valor,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          "Quiz",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: Text(
                    "${quizController.getNumberQuestion()}. ${quizController.getQuestion()}",
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [_button(Colors.green, "true", true)],
                    ),
                    Row(
                      children: [_button(Colors.pink, "false", false)],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Wrap(
                  children:
                      quizController.getIcons().map<Widget>((dynamic icon) {
                    return icon as Widget;
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
