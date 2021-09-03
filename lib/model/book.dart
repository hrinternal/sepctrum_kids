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
  @JsonKey(name:"date_published")
  String? datePublished;
  String? subject;
  @JsonKey(name:"front_cover")
  String? frontCover;

  BookDataBean(
      {this.id,
      this.uuid,
      this.title,
      this.author,
      this.description,
      this.publisher,
      this.datePublished,
      this.subject,
      this.frontCover});

  factory BookDataBean.fromJson(Map<String, dynamic> json) =>
      _$BookDataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BookDataBeanToJson(this);
}
