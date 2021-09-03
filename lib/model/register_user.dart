import 'package:json_annotation/json_annotation.dart';

part 'register_user.g.dart';

@JsonSerializable()
class RegisterUser {
  String ? message;
  List<DataBean>?  data;
  String?  status;

  RegisterUser({this.message, this.data, this.status});

  factory RegisterUser.fromJson(Map<String, dynamic> json) => _$RegisterUserFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);
}

@JsonSerializable()
class DataBean {
  @JsonKey(name:"book_title")
  String? bookTitle;
  @JsonKey(name:"book_author")
  String? bookAuthor;
  @JsonKey(name:"book_description")
  String? bookDescription;
  @JsonKey(name:"book_publisher")
  String? bookPublisher;
  @JsonKey(name:"date_published")
  String? datePublished;
  @JsonKey(name:"download_link")
  String? downloadLink;
  @JsonKey(name:"front_cover")
  String? frontCover;

  DataBean({this.bookTitle, this.bookAuthor, this.bookDescription, this.bookPublisher, this.datePublished, this.downloadLink, this.frontCover});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

