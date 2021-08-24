class FillAlphabetsModel {
  String? letter;
  int? selected;
  String? answer;
  int? isAnswered;

  FillAlphabetsModel({
    this.letter,
    this.selected:0,
    this.answer:'',
    this.isAnswered:0,
  });

  factory FillAlphabetsModel.fromJson(Map<String, dynamic> parsedJson) {
    return FillAlphabetsModel(
      letter: parsedJson['letter'],
      selected: parsedJson['selected'],
      answer: parsedJson['answer'],
      isAnswered: parsedJson['isAnswered'],
    );
  }
}
