import '../../domain/entities/islam_web_entities.dart';

class IslamWebModel extends IslamWebEntities {
  IslamWebModel(
      {required super.title, required super.question, required super.answer});

  factory IslamWebModel.fromJson(Map<String, dynamic> json) {
    return IslamWebModel(
        title: json['title'],
        question: json['question'],
        answer: json['answer']);
  }
}
