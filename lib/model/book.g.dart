// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => BookDataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'data': instance.data,
    };

BookDataBean _$BookDataBeanFromJson(Map<String, dynamic> json) {
  return BookDataBean(
    id: json['id'] as String?,
    uuid: json['uuid'] as String?,
    title: json['title'] as String?,
    author: json['author'] as String?,
    description: json['description'] as String?,
    publisher: json['publisher'] as String?,
    datePublished: json['date_published'] as String?,
    subject: json['subject'] as String?,
    frontCover: json['front_cover'] as String?,
  );
}

Map<String, dynamic> _$BookDataBeanToJson(BookDataBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'publisher': instance.publisher,
      'date_published': instance.datePublished,
      'subject': instance.subject,
      'front_cover': instance.frontCover,
    };
