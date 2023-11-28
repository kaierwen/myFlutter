class Question {
  final String question;
  final bool answer;

  Question({
    this.question = '',
    this.answer = false,
  });

  String getQuestionText() {
    return question;
  }

  bool getQuestionAnswer() {
    return answer;
  }
}
