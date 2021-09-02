class QuizData {
  String _question;
  List<String> _choices;
  String _correctAnswer;

  String get question => _question;

  set question(String value) {
    _question = value;
  }

  QuizData(this._question, this._choices, this._correctAnswer);

  List<String> get choices => _choices;

  String get correctAnswer => _correctAnswer;

  set correctAnswer(String value) {
    _correctAnswer = value;
  }

  set choices(List<String> value) {
    _choices = value;
  }
}
