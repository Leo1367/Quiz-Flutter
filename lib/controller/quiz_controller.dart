import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';

class QuizController {
  int _questionNumer = 0;
  int _numeroQuestao = 1;
  int _score = 0;
  List<Widget> iconAns = [];

  final List<Question> _questions = [
    Question(
        questionText: "Quem foi o primeiro homem a pisar na Lua?",
        answer: false),
    Question(questionText: "O que é um paralelepipedo?", answer: false),
    Question(
        questionText: "Quem foi o Smith weber jagger man jensen?",
        answer: true),
    Question(questionText: "Quem foi o numero 1?", answer: true),
    Question(questionText: "Foda?", answer: true),
    Question(
        questionText: "Quanto custa o Medo abundante de todas as verdades?",
        answer: false),
    Question(questionText: "'-'?", answer: true),
    Question(questionText: "Concha mágica eu posso sair?", answer: false),
    Question(questionText: "Qual o nome do bob esponja?", answer: false),
    Question(questionText: "Sapo são pessoas?", answer: true),
    Question(questionText: "Uma escada é esquerda ou direita?", answer: true),
    Question(
        questionText: "Quem ganha 1 trilhão de leões de agua ou o sol?",
        answer: false),
    Question(questionText: "Alguém trouxe o bandeclay?", answer: false),
    Question(questionText: "Deuses da morte comem maçã?", answer: true),
    Question(questionText: "Deus ou Lucifer?", answer: true),
  ];

  String getQuestion() {
    return _questions[_questionNumer].questionText;
  }

  bool getAnswer() {
    return _questions[_questionNumer].answer;
  }

  int getScore() {
    return _score;
  }

  List getIcons() {
    return iconAns;
  }

  int getNumberQuestion(){
    return _numeroQuestao;
  }

  void nextQuestion() {
    if (_questionNumer < _questions.length - 1) {
      _questionNumer++;
      _numeroQuestao++;
    } 
   
  }

  void checkAnswer(bool userAnswer) {
    bool result = userAnswer == getAnswer();

    if (result) {
      iconAns.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
      _score += 1;
    } else {
      iconAns.add(const Icon(
        Icons.close,
        color: Colors.pink,
      ));
    }
  }

  void reset() {
    iconAns.clear();
    _score = 0;
    _questionNumer = 0;
    _questions.shuffle();
    nextQuestion();
    _numeroQuestao = 1;
  }
}
