import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  List<BookDataBean>? data;

  Book({this.data});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class BookDataBean {
  String? id;
  String? uuid;
  String? title;
  String? author;
  String? description;
  String? publisher;
  String? date_published;
  String? subject;
  String? front_cover;

  BookDataBean(
      {this.id,
      this.uuid,
      this.title,
      this.author,
      this.description,
      this.publisher,
      this.date_published,
      this.subject,
      this.front_cover});

  factory BookDataBean.fromJson(Map<String, dynamic> json) =>
      _$BookDataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BookDataBeanToJson(this);
}
