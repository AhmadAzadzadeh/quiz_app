import './question.dart';

class Quiz {
  // Fields
  List<Question> _questions;
  int _score = 0;
  int _currentQuestionIndex = -1;

  // Constructor 
  Quiz(this._questions) {
    _questions.shuffle();
  }

  // Getters
  List<Question> get questions => _questions;
  int get score => _score;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  Question get nextQuestion {
    _currentQuestionIndex += 1;
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) {
      _score += 1;
    }
  }
}

//  Create an instance of a class
// Quiz quiz = new Quiz([new Question("Flutter is Awesome", true)]);