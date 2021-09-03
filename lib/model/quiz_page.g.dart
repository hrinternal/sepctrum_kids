// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizPage _$QuizPageFromJson(Map<String, dynamic> json) {
  return QuizPage(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => QuizDataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    links: json['links'] == null
        ? null
        : LinksBean.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuizPageToJson(QuizPage instance) => <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
    };

LinksBean _$LinksBeanFromJson(Map<String, dynamic> json) {
  return LinksBean(
    first: json['first'] as String?,
    last: json['last'] as String?,
    prev: json['prev'] as String?,
    next: json['next'] as String?,
  );
}

Map<String, dynamic> _$LinksBeanToJson(LinksBean instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

QuizDataBean _$QuizDataBeanFromJson(Map<String, dynamic> json) {
  return QuizDataBean(
    id: json['id'] as String?,
    bookId: json['book_id'] as String?,
    type: json['type'] as String?,
    title: json['title'] as String?,
    subject: json['subject'] as String?,
    questions: (json['questions'] as List<dynamic>?)
        ?.map((e) => QuestionsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuizDataBeanToJson(QuizDataBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_id': instance.bookId,
      'type': instance.type,
      'title': instance.title,
      'subject': instance.subject,
      'questions': instance.questions,
    };

QuestionsBean _$QuestionsBeanFromJson(Map<String, dynamic> json) {
  return QuestionsBean(
    id: json['id'] as String?,
    pageId: json['page_id'] as String?,
    text: json['text'] as String?,
    choices:
        (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
    answer: json['answer'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$QuestionsBeanToJson(QuestionsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page_id': instance.pageId,
      'text': instance.text,
      'choices': instance.choices,
      'answer': instance.answer,
      'image': instance.image,
    };
