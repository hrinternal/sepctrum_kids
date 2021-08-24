class ImageGapsModel  extends ImageQuiz{
  int? id;
  String? word;
  String? wordGap;
  String? image;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? option5;
  String? answer;
  bool? isEnabled;
  bool? isAnswered;

  ImageGapsModel({
    this.id,
    this.word,
    this.wordGap,
    this.image,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.answer,
    this.isAnswered,
    this.isEnabled
  });

  factory ImageGapsModel.fromJson(Map<String, dynamic> parsedJson) {
    return ImageGapsModel(
      id: parsedJson['id'],
      word: parsedJson['word'],
      wordGap: parsedJson['wordGap'],
      option1: parsedJson['option1'],
      option2: parsedJson['option2'],
      option3: parsedJson['option3'],
      option4: parsedJson['option4'],
      option5: parsedJson['option5'],
      answer: parsedJson['answer'],
      image: parsedJson['image'],
      isAnswered: parsedJson['isAnswered'],
    );
  }
}

class ImageQuiz {
  int? id;
  String? image;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? option5;
  String? answer;
  bool? isEnabled;
  bool? isAnswered;

  ImageQuiz({
    this.id,
    this.image,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.answer,
    this.isAnswered,
    this.isEnabled
  });

}
