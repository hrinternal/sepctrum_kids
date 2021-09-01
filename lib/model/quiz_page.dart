import 'package:json_annotation/json_annotation.dart';

part 'quiz_page.g.dart';

@JsonSerializable()
class QuizPage {
  List<QuizDataBean>? data;
  LinksBean? links;

  QuizPage({this.data, this.links});

  factory QuizPage.fromJson(Map<String, dynamic> json) => _$QuizPageFromJson(json);

  Map<String, dynamic> toJson() => _$QuizPageToJson(this);
}

@JsonSerializable()
class LinksBean {
  String? first;
  String? last;
  String? prev;
  String? next;

  LinksBean({this.first, this.last, this.prev, this.next});

  factory LinksBean.fromJson(Map<String, dynamic> json) => _$LinksBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LinksBeanToJson(this);
}

@JsonSerializable()
class QuizDataBean {
  String? id;
  String? book_id;
  String? type;
  String? title;
  String? subject;
  List<QuestionsBean>? questions;

  QuizDataBean({this.id, this.book_id, this.type, this.title, this.subject, this.questions});

  factory QuizDataBean.fromJson(Map<String, dynamic> json) => _$QuizDataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDataBeanToJson(this);
}

@JsonSerializable()
class QuestionsBean {
  String? id;
  String? page_id;
  String? text;
  List<String>? choices;
  String? answer;
  String? image;

  QuestionsBean({this.id, this.page_id, this.text, this.choices, this.answer, this.image});

  factory QuestionsBean.fromJson(Map<String, dynamic> json) => _$QuestionsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsBeanToJson(this);
}

