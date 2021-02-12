class GapsEntity {
  String word;
  String wordGapp;
  String option1;
  String option2;
  String answer;
  bool isEnabled;
  bool isAnswered;

  GapsEntity({
    this.word,
    this.wordGapp,
    this.option1,
    this.option2,
    this.answer,
    this.isAnswered,
    this.isEnabled
  });

  factory GapsEntity.fromJson(Map<String, dynamic> parsedJson) {
    return GapsEntity(
      word: parsedJson['word'],
      wordGapp: parsedJson['wordGapp'],
      option1: parsedJson['option1'],
      option2: parsedJson['option2'],
      answer: parsedJson['answer']


    );
  }
}
