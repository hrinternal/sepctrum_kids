// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) {
  return RegisterUser(
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    bookTitle: json['book_title'] as String?,
    bookAuthor: json['book_author'] as String?,
    bookDescription: json['book_description'] as String?,
    bookPublisher: json['book_publisher'] as String?,
    datePublished: json['date_published'] as String?,
    downloadLink: json['download_link'] as String?,
    frontCover: json['front_cover'] as String?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'book_title': instance.bookTitle,
      'book_author': instance.bookAuthor,
      'book_description': instance.bookDescription,
      'book_publisher': instance.bookPublisher,
      'date_published': instance.datePublished,
      'download_link': instance.downloadLink,
      'front_cover': instance.frontCover,
    };
