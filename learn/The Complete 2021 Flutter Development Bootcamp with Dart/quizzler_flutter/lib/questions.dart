import 'question.dart';

class Questions {
  int _questionNumber = 0;

  List<Question> _questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: '1 + 1 = 2', answer: true),
    Question(question: 'a b c f f', answer: false),
    Question(question: 'pi is 3.14', answer: true),
    Question(question: 'hhh, i am not sure', answer: false),
  ];

  String getQuestionText() {
    if (_questionNumber >= _questions.length) {
      return '';
    }
    return _questions[_questionNumber].getQuestionText();
  }

  bool getQuestionAnswer() {
    if (_questionNumber >= _questions.length) {
      return false;
    }
    return _questions[_questionNumber].getQuestionAnswer();
  }

  bool nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
