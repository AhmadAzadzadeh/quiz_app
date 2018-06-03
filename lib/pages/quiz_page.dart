import 'package:flutter/material.dart';

import '../utils//question.dart';
import '../utils//quiz.dart';
import '../ul//answer_button.dart';
import '../ul/question_text.dart';
import '../ul/correct_wrong_overlay.dart';
import '../pages//score_page.dart';

class QuizPage extends StatefulWidget {
  // We Connect our QuizPageState To Our QuizPage
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Flutter is Awesome ?", true),
    new Question("Pizza is Healthy ?", false),
    new Question("The Capital Of Iran is Tehran ?", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // This is our main page
          children: <Widget>[
            new AnswerButton(true, () => this.handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => this.handleAnswer(false)),
          ],
        ),
        overlayVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          (){
            if(quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext contex) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              this.overlayVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}
