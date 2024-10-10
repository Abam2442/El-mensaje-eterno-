class LearningIslamEntities {
  final String name;
  final List<SubCatigoryEntities> subCatigory;

  const LearningIslamEntities({
    required this.name,
    required this.subCatigory,
  });
}

class SubCatigoryEntities {
  final String subCatigoryName;
  final List<LessonEntities> lesson;

  const SubCatigoryEntities({
    required this.subCatigoryName,
    required this.lesson,
  });
}

class LessonEntities {
  final String lessonName;
  final String lessonBody;

  const LessonEntities({
    required this.lessonName,
    required this.lessonBody,
  });
}
