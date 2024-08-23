import '../../domain/entities/learning_islam_entities.dart';

class LearningIslamModel extends LearningIslamEntities {
  const LearningIslamModel({
    required super.name,
    required super.subCatigory,
  });
  factory LearningIslamModel.fromJson(Map<String, dynamic> json) {
    List<SubCatigoryModel> subCatigory = [];
    if (json['subcategories'] != null) {
      for (var subcatigory in json['subcategories']) {
        subCatigory.add(SubCatigoryModel.fromJson(subcatigory));
      }
    }

    return LearningIslamModel(name: json['name'], subCatigory: subCatigory);
  }
}

class SubCatigoryModel extends SubCatigoryEntities {
  SubCatigoryModel({
    required super.subCatigoryName,
    required super.lesson,
  });

  factory SubCatigoryModel.fromJson(Map<String, dynamic> json) {
    List<LessonModel> lesson = [];
    if (json['lessons'] != null) {
      for (var subCatigory in json['lessons']) {
        lesson.add(LessonModel.fromJson(subCatigory));
      }
    }

    return SubCatigoryModel(
      subCatigoryName: json['name'],
      lesson: lesson,
    );
  }
}

class LessonModel extends LessonEntities {
  LessonModel({
    required super.lessonName,
    required super.lessonBody,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(lessonName: json['title'], lessonBody: json['lines']);
  }
}
