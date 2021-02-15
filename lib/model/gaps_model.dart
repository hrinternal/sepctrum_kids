class GapsModel {
  String word;
  String wordGap;
  String option1;
  String option2;
  String answer;
  bool isEnabled;
  bool isAnswered;

  GapsModel({
    this.word,
    this.wordGap,
    this.option1,
    this.option2,
    this.answer,
    this.isAnswered,
    this.isEnabled
  });

  factory GapsModel.fromJson(Map<String, dynamic> parsedJson) {
    return GapsModel(
      word: parsedJson['word'],
      wordGap: parsedJson['wordGap'],
      option1: parsedJson['option1'],
      option2: parsedJson['option2'],
      answer: parsedJson['answer']
    );
  }
}
