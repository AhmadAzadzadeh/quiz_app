import 'package:flutter/material.dart';

import '../utils//question.dart';
import '../utils//quiz.dart';
import '../ul//answer_button.dart';
import '../ul/question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  // We Connect our QuizPageState To Our QuizPage
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column( // This is our main page
          children: <Widget>[
            new AnswerButton(true, () => print("You Answered True")),
            new QuestionText("Flutter is Great ?", 1),
            new AnswerButton(false, () => print("You Answered False")),
          ],
        ),
      ],
    );
  }
}
