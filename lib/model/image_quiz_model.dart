import 'package:spectrum_kids/model/image_gaps_model.dart';

class ImageQuizModel  extends ImageQuiz{
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

  ImageQuizModel(
      {this.id,
      this.image,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.option5,
      this.answer,
      this.isAnswered,
      this.isEnabled});

  factory ImageQuizModel.fromJson(Map<String, dynamic> parsedJson) {
    return ImageQuizModel(
      id: parsedJson['id'],
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

class QuizModel {
  int? id;
  String? image;
  List<String>? options;
  String? answer;
  bool? isEnabled;
  bool? isAnswered;

  QuizModel(
      {this.id,
      this.image,
      this.options,
      this.answer,
      this.isEnabled,
      this.isAnswered});

}
